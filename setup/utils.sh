#!/bin/bash

function setup_color() {
    RED=$(printf '\033[0;31m')
    CYAN=$(printf '\033[0;36m')
    ORANGE=$(printf '\033[0;33m')
    NC=$(printf '\033[0m')
}

function print_info() {
  echo "[${CYAN}INFO${NC}]" "$@"
}

function print_warn() {
  echo "[${RED}WARN${NC}]" "$@" >&2
}
