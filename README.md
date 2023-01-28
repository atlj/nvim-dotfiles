# atlj/nvim-dotfiles

<img width="1149" alt="Screen Shot 2023-01-28 at 22 55 36" src="https://user-images.githubusercontent.com/23079646/215288153-36452fd0-2f86-485c-9c59-8bf60b3e5fc9.png">

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

### 3. Install `fzf-lua` native dependencies

> You need to install `fzf` to enable fuzzy finding
```bash
brew install fzf fd rg
```

### 4. Get the dotfiles from git and run `PackerSync`

```bash
git clone https://github.com/atlj/nvim-dotfiles ~/.config/nvim
nvim +PackerSync
```

## Key bindings

| Binding | What it does? |
| --- | --- |
| space | lead key |
| lead e | file manager |
| lead f | fuzzy find files (respects `.gitignore`) |
| lead ; | fuzzy find files (doesn't respect `.gitignore`)|
| lead s | fuzzy find string |
| lead w | write |
| lead c | close |
| lead d | show floating diagnostics |
| lead a | show code actions |
| lead r | rename |
| lead t | open terminal |
| lead g | open lazygit |
| lead shift | format |
| lead p | PackerSync command synces all the packages |
| lead b | Show the git blame for current line |
| ctrl h | Go to left window |
| ctrl l | Go to right window |
| ctrl k | Go to top window |
| ctrl j | Go to bottom window |
| shift l | Go to next buffer |
| shift h | Go to previous buffer |
| gcc | Comment |
| gcb | Block comment |

