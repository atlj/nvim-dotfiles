# atlj/nvim-dotfiles

<img width='1149' alt='A terminal window that displays my neovim config' src='https://github.com/atlj/nvim-dotfiles/assets/23079646/6768b6fe-34a1-462d-9dde-537d95bca56f'>

It's fast, reliable (at least when it works), customizable and fast

## Installation

### 1. Install `nvim`

For macOS, you can:

```bash
brew install nvim
```

### 2. Backup your current NeoVim config (If you have it)

```bash
mv ~/.config/nvim ~/.config/nvimbackup
```

### 3. Install [ripgrep](https://github.com/BurntSushi/ripgrep) for fuzzy finding.

> `ripgrep` is required for `fzf-lua`

```bash
brew install rg
```

### 4. Get the dotfiles from git

```bash
git clone https://github.com/atlj/nvim-dotfiles ~/.config/nvim
```
