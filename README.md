# NVIM Dotfiles

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

### 3. Get the dotfiles from git and run `PackerSync`

```bash
git clone https://github.com/atlj/nvim-dotfiles ~/.config/nvim
nvim +PackerSync
```
