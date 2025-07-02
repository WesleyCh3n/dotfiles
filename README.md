<h1 align="center">
  WesleyCh3n's dotfiles
</h1>

## 📖 Contents
- neovim config
- tmux config
- zsh config
- terminal config: wezterm
- devcontainer setup script

## 💭 About

My personal dotfiles for MacOS/Ubuntu/Windows.

## Install

You can either use `bare git repo` or `softlink`

### Opt 1. Bare Git Repo

```sh
git --no-replace-objects clone --bare --depth 1 \
    https://github.com/WesleyCh3n/dotfiles.git $HOME/.dot
git --work-tree $HOME --git-dir $HOME/.dot config --local status.showUntrackedFiles no
git --work-tree $HOME --git-dir $HOME/.dot checkout -f
```

### Opt 2. Soft link

See [`.setup`](https://github.com/WesleyCh3n/dotfiles/blob/main/.setup).

### Opt 3. Use in Devcontainer

```sh
devcontainer up --workspace-folder . \
  --dotfiles-repository https://github.com/WesleyCh3n/dotfiles \
  --dotfiles-install-command ".setup"
```

## License

MIT
