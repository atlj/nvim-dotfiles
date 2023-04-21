# atlj/nvim-dotfiles

<img width='1149' alt='Screen Shot 2023-01-28 at 22 55 36' src='https://user-images.githubusercontent.com/23079646/215288153-36452fd0-2f86-485c-9c59-8bf60b3e5fc9.png'>

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

> `ripgrep` is required for `Telescope`

```bash
brew install rg
```

### 4. Get the dotfiles from git and run `PackerSync`

```bash
git clone https://github.com/atlj/nvim-dotfiles ~/.config/nvim
nvim +PackerSync
```

## Key bindings

> This configuration includes numerous key bindings that are not explicitly listed here. However, fear not, as I have implemented
the 'which-key' plugin to provide a comprehensive overview of all key mappings. Simply press the 'space' key to reveal the full
list of available mappings. With this feature, you can easily navigate and utilize the full range of key bindings at your
disposal.

| Binding | What it does? |
| --- | --- |
| space | Lead key |
| ctrl h | Go to left window |
| ctrl l | Go to right window |
| ctrl k | Go to top window |
| ctrl j | Open terminal |
| shift l | Go to next buffer |
| shift h | Go to previous buffer |
| gcc | Comment |
| gcb | Block comment |
| ctrl g | Open Diffview to compare current branch and main |
