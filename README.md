# NVIM Dotfiles

<img width="1051" alt="Screen Shot 2022-11-06 at 02 18 09" src="https://user-images.githubusercontent.com/23079646/200146000-eb674bc3-1281-4cff-9a1c-faf896eeb73e.png">

These are my custom dotfiles for `nvim`. I'm using [AstroVim](https://github.com/AstroNvim/AstroNvim) as a solid base and build on top of that.
Most edits are done in [the user init.lua file](./lua/user/init.lua)  

## Installation

### 1. Install `nvim`

For Macos you can:

```bash
brew install nvim
```

### 2. Backup your current nvim config (If you have it)

```bash
mv ~/.config/nvim ~/.config/nvimbackup
```

### 3. Install `fzf`

> You need to install `fzf` to enable fuzzy finding

```bash
brew install fzf
```

### 4. Get the dotfiles from git and run `PackerSync`

```bash
git clone https://github.com/atlj/nvim-dotfiles ~/.config/nvim
nvim +PackerSync
```
