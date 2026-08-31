#!/usr/bin/env bash
# Claude Code statusLine command — gruvbox dark theme
# Colors from ~/.config/tmux/tmux-gruvbox-dark.conf
#   C0=#ddc7a1  light tan    — primary text
#   C1=#a89984  muted beige  — secondary text / separators
#   C2=#504945  dark brown   — block backgrounds / pipe separators
#   C4=#282828  nearly black — bold text on light blocks

input=$(cat)

cwd=$(echo "$input"   | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')

# ANSI truecolor helpers
C0='\033[38;2;221;199;161m'   # #ddc7a1 — primary text
C1='\033[38;2;168;153;132m'   # #a89984 — secondary / separators
C2='\033[38;2;80;73;69m'      # #504945 — pipe separators
BG_C2='\033[48;2;80;73;69m'   # #504945 — block background
BOLD='\033[1m'
RESET='\033[0m'

# Get git repo root, branch and dirty status (no optional locks, suppress errors)
repo_root=""
branch=""
dirty=""
if git -C "$cwd" rev-parse --git-dir >/dev/null 2>&1; then
  repo_root=$(git -C "$cwd" rev-parse --show-toplevel 2>/dev/null)
  branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null \
    || git -C "$cwd" describe --tags --exact-match HEAD 2>/dev/null \
    || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
  if ! git -C "$cwd" diff --quiet 2>/dev/null || ! git -C "$cwd" diff --cached --quiet 2>/dev/null; then
    dirty="*"
  fi
fi

# Shorten every parent component to its first character (keeping a leading dot),
# leaving the final component intact:  ~/.config/nvim/lua  ->  ~/.c/n/lua
abbreviate_path() {
  local path="$1" out="" IFS='/'
  read -r -a parts <<< "$path"
  local n=${#parts[@]} i=0
  for part in "${parts[@]}"; do
    i=$(( i + 1 ))
    if [ -z "$part" ]; then
      continue
    elif [ "$i" -eq "$n" ] || [ "$part" = "~" ]; then
      out="${out}/${part}"
    elif [ "${part#.}" != "$part" ]; then
      out="${out}/${part:0:2}"          # hidden dir: keep the dot + one char
    else
      out="${out}/${part:0:1}"
    fi
  done
  printf '%s' "${out#/}"
}

# Path segment: inside a repo show <repo-name>[/subdir], otherwise abbreviate
if [ -n "$repo_root" ]; then
  rel="${cwd#$repo_root}"
  short_cwd="$(basename "$repo_root")${rel}"
elif [ -n "$cwd" ]; then
  home_cwd="${cwd/#$HOME/\~}"
  case "$home_cwd" in
    /*|\~*) short_cwd=$(abbreviate_path "$home_cwd") ;;
    *)      short_cwd="$home_cwd" ;;
  esac
  # keep the leading slash for absolute paths
  case "$home_cwd" in /*) short_cwd="/${short_cwd}" ;; esac
else
  short_cwd=""
fi

# Build the status line — pattern mirrors tmux config:
# secondary-colored separators, primary text, dark-brown blocks

out=""

# Directory segment: muted beige bullet + primary text
if [ -n "$short_cwd" ]; then
  out="${out}$(printf "${C1}●${RESET} ${C0}${short_cwd}${RESET}")"
fi

# Git segment: muted beige branch name, dirty marker in primary
if [ -n "$branch" ]; then
  out="${out}$(printf "  ${C1}${branch}${C0}${dirty}${RESET}")"
fi

# Model segment: dark brown pipe + primary text
if [ -n "$model" ]; then
  out="${out}$(printf "  ${C2}|${RESET}  ${C0}${model}${RESET}")"
fi

# Context usage bar: dark brown pipe + muted bar + primary percentage
used_raw=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
if [ -n "$used_raw" ]; then
  used_int=$(printf '%.0f' "$used_raw")
  filled=$(( used_int * 10 / 100 ))
  [ "$filled" -gt 10 ] && filled=10

  bar=""
  i=0
  while [ "$i" -lt "$filled" ]; do bar="${bar}█"; i=$(( i + 1 )); done
  while [ "$i" -lt 10 ];        do bar="${bar}░"; i=$(( i + 1 )); done

  out="${out}$(printf "  ${C2}|${RESET}  ${C1}${bar}${RESET} ${C0}${used_int}%%${RESET}")"
fi

# Session usage segment: 5h window (+ weekly), as labeled percentages
session_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week_pct=$(echo "$input"    | jq -r '.rate_limits.seven_day.used_percentage // empty')
if [ -n "$session_pct" ]; then
  session_int=$(printf '%.0f' "$session_pct")
  out="${out}$(printf "  ${C2}|${RESET}  ${C1}ses${RESET} ${C0}${session_int}%%${RESET}")"
  if [ -n "$week_pct" ]; then
    week_int=$(printf '%.0f' "$week_pct")
    out="${out}$(printf "  ${C1}wk${RESET} ${C0}${week_int}%%${RESET}")"
  fi
fi

printf "%b\n" "$out"
