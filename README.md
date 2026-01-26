# burneikis/nvim

My nvim config

**Leader Key**: `<Space>`

---

## Plugins

### Completion & Snippets
| Plugin | Purpose |
|--------|---------|
| nvim-cmp | Autocompletion engine |
| LuaSnip | Snippet engine |
| friendly-snippets | Community snippet collection |
| copilot.lua | AI code completion |

### LSP & Language Support
| Plugin | Purpose |
|--------|---------|
| nvim-lspconfig | LSP configuration |
| mason.nvim | Language server installer |
| mason-lspconfig.nvim | LSP server manager |
| mason-tool-installer.nvim | Formatter/tool manager |

**Configured Language Servers**:
- `lua_ls` - Lua
- `vtsls` - TypeScript/JavaScript
- `angularls` - Angular
- `pyright` - Python
- `eslint` - JavaScript linting (auto-fixes on save)

### Treesitter
| Plugin | Purpose |
|--------|---------|
| nvim-treesitter | Advanced syntax highlighting |

**Languages**: angular, bash, css, html, javascript, json, lua, markdown, python, tsx, typescript, yaml

### Fuzzy Finding
| Plugin | Purpose |
|--------|---------|
| telescope.nvim | Fuzzy finder |
| telescope-fzf-native.nvim | Native FZF sorter |

### File Management
| Plugin | Purpose |
|--------|---------|
| oil.nvim | Lightweight file explorer |

### Navigation & Movement
| Plugin | Purpose |
|--------|---------|
| flash.nvim | Fast motion/jump |
| hop.nvim | Word/line hopper |
| harpoon | File bookmarking (5 slots) |
| neoscroll.nvim | Smooth scrolling |
| nodejumper.nvim | Jump to Treesitter nodes |

### UI Enhancements
| Plugin | Purpose |
|--------|---------|
| lualine.nvim | Status bar |
| noice.nvim | Modern command line UI |
| which-key.nvim | Keybinding guide |
| trouble.nvim | Diagnostics panel |
| fidget.nvim | LSP progress notifications |
| wilder.nvim | Command-line completion |

### Visual
| Plugin | Purpose |
|--------|---------|
| tokyonight.nvim | Colorscheme (storm, transparent) |
| indent-blankline.nvim | Static indent guides |
| mini.indentscope | Animated scope line |

### Git
| Plugin | Purpose |
|--------|---------|
| gitsigns.nvim | Git decorations & line blame |
| snacks.nvim | LazyGit integration + dashboard |

### Code Quality
| Plugin | Purpose |
|--------|---------|
| conform.nvim | Format on save |
| mini.pairs | Auto-pair brackets/quotes |

### Session
| Plugin | Purpose |
|--------|---------|
| persistence.nvim | Session save/restore |

---

## Key Bindings

### Telescope (Find)
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>ft` | Find text (grep) |
| `<leader>fr` | Recent files |
| `<leader>fb` | Find buffers |
| `<leader>fc` | Commands |
| `<leader>fd` | Diagnostics |
| `<leader>fs` | Document symbols |

### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Find references |
| `K` | Hover documentation |
| `[d` / `]d` | Previous/next diagnostic |

### Navigation
| Key | Action |
|-----|--------|
| `s` | Flash jump |
| `S` | Nodejumper (AST) |
| `gw` | Hop to word |
| `-` | Oil (parent directory) |
| `<leader>o` | Oil (float) |

### Harpoon
| Key | Action |
|-----|--------|
| `<leader>a` | Add file |
| `<leader>h` | Toggle menu |
| `<leader>1-5` | Select file 1-5 |
| `[h` / `]h` | Previous/next file |

### Diagnostics (Trouble)
| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle diagnostics |
| `<leader>xX` | Buffer diagnostics |
| `<leader>xs` | Symbols |
| `<leader>xl` | LSP references |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |

### Git
| Key | Action |
|-----|--------|
| `<leader>g` | Open LazyGit |
| `]g` / `[g` | Next/prev hunk |

### Clipboard
| Key | Action |
|-----|--------|
| `y` / `Y` / `yy` | Yank to system clipboard |
| `<leader>yf` | Yank relative file path |
| `<leader>yF` | Yank absolute file path |

### Quickfix
| Key | Action |
|-----|--------|
| `<leader>co` | Open quickfix |
| `<leader>cc` | Close quickfix |
| `<leader>cn` | Next item |
| `<leader>cp` | Previous item |

### Copilot
| Key | Action |
|-----|--------|
| `<Tab>` | Accept suggestion |
| `<M-w>` | Accept word |
| `<M-e>` | Accept line |
| `<M-]>` / `<M-[>` | Next/prev suggestion |
| `<M-c>` | Dismiss |

### Other
| Key | Action |
|-----|--------|
| `<Esc>` | Clear search highlight |
| `<A-j>` / `<A-k>` | Move line up/down |
| `[b` / `]b` | Previous/next buffer |
| `<leader>d` | Show dashboard |

---

## Editor Options

- **Line numbers**: Relative + absolute
- **Indentation**: 2 spaces, smart indent
- **Search**: Case-insensitive with smart case
- **Splits**: Open right/below by default
- **Undo**: Persistent (no swap files)
- **Mouse**: Enabled
- **Scroll offset**: 8 characters

---

## Formatting (on save)

| Language | Formatter |
|----------|-----------|
| Lua | stylua |
| Python | isort + black |
| JavaScript/TypeScript | prettier |

---

## Autocommands

- Highlight text on yank (200ms)
- Return to last edit position on file open
- Close help/oil/qf windows with `q`
- Auto-resize splits on vim resize
- Remove trailing whitespace on save

---

## Theme

**Tokyo Night Storm** with:
- Transparent background
- Italic comments and keywords
- Terminal colors enabled

