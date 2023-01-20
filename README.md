# atlj/neovim_config

## Why?

It's fast, reliable (at least when it works), customizable and fast

## My Keys

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
| lead shift | format |

## TODO:

- [ ] Better file manager probably neotree
- [ ] Plugin to show which key to press after lead
- [ ] LSP
- [ ] Mason
- [ ] Term using lead t
- [ ] Ability to jump between windows holding ctrl
- [ ] lead w for saving, lead g for LazyGit, lead b for git blame, lead a for LSP fix, lead d for LSP diagnostic, shift + space for formatting
- [ ] sync the yank register with the system's clipboard
- [ ] Automatically close parenthesis
- [ ] Relative line numbers
- [ ] Hide search with space h
- [ ] ability to search backward using `/``
- [ ] hold shift to move between buffers
- [ ] show open buffers as tabs
- [ ] Make LSP dialogs floating
