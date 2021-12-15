# WesleyCh3n's dotfiles

WesleyCh3n's personal (minimal) dotfiles for MacOS/Ubuntu/Manjaro. If you see something
useful feel free to use.

## Contents:
- neovim config
- tmux config
- zsh config
- terminal config: alacritty, iTerm2
- ...(some setup script)

## Setup Scripts

### Install prerequisites

In `setup` directory
- `xx_install.sh`: install basic required package by your distro. (*After this
 script, you can already link dotfiles*)
- `xx_manual.sh`: install 3rd-party package.
- `xx_install_nvim.sh`: install `neovim`.

> ⚠️⚠️⚠️ Strongly Recommend look through all scripts and install what you need.

### Link dotfiles

Use GNU `stow` to create soft-link.

Simply type:
```bash
make
```

## Screenshot

I lov Gruvbox <3
<details>
  <summary>Image preview</summary>

|![img1](./asset/img1.png)|![img2](./asset/img2.png)|
|:-:|:-:|
|![img3](./asset/img3.png)|![img1](./asset/img4.png)|

</details>
