# Markdown Editing Guide

Ergonomic setup for reading, editing, and navigating long markdown documents — especially useful when iterating with LLMs on architecture docs and coding plans.

## Plugins Installed

| Plugin | Purpose |
|--------|---------|
| nvim-ufo | Treesitter-based folding |
| render-markdown.nvim | Inline rendering (calmer reading) |
| glow.nvim | Terminal preview |
| telescope-heading.nvim | Fuzzy heading navigation |
| vim-table-mode | Ergonomic table editing |
| yazi.nvim | File browser with markdown preview |

## Navigation

### Jump Between Headings
- **`]]`** - Jump to next heading
- **`[[`** - Jump to previous heading
- **`gh`** or **`<leader>mh`** - Telescope heading picker (fuzzy search)

The heading picker is the fastest way to navigate long docs. Press `gh`, type a few characters, and jump.

### Folding

Folding is the key to managing cognitive load in long documents.

#### Quick Fold Levels
- **`z1`** - Collapse to H1 only (highest overview)
- **`z2`** - Collapse to H2 (section overview)
- **`z3`** - Collapse to H3
- **`z4`** - Collapse to H4
- **`z0`** - Unfold everything

#### Standard Fold Commands
- **`za`** - Toggle fold under cursor
- **`zo`** - Open fold under cursor
- **`zc`** - Close fold under cursor
- **`zR`** - Open all folds
- **`zM`** - Close all folds
- **`zK`** - Peek folded content (without opening)

### Workflow: Reading a Long Doc

1. Open the file
2. Press **`z2`** to see section outline
3. Use **`gh`** to fuzzy-jump to the section you want
4. Press **`zo`** or **`za`** to expand that section
5. Read/edit
6. Press **`z2`** again to return to outline view

## Editing

### Text Emphasis (Visual Mode)
Select text first (`v` + motion), then:
- **`<leader>mb`** - **Bold** selection
- **`<leader>mi`** - *Italic* selection
- **`<leader>mc`** - `Code` selection

### Checkboxes
- **`<leader>mx`** - Toggle checkbox on current line
  - Converts `- item` → `- [ ] item` → `- [x] item`

### Quick Heading Insertion (Insert Mode)
At the start of a line:
- **`Ctrl+1`** - Insert `# ` (H1)
- **`Ctrl+2`** - Insert `## ` (H2)
- **`Ctrl+3`** - Insert `### ` (H3)

### Table Editing
- **`<leader>mt`** - Toggle table mode
- Once enabled, `|` triggers auto-alignment
- Tables auto-format as you type

## Preview

### Terminal Preview
- **`<leader>mg`** - Open Glow preview (terminal-rendered, floating window)
- **`<leader>mr`** - Toggle render-markdown (inline rendering in buffer)

### Browser Preview (rich rendering with large headers)
- **`<leader>mp`** - Open live browser preview (markdown-preview.nvim)
  - Auto-refreshes as you edit
  - Full CSS styling, large headers, syntax highlighting
  - Dark theme by default

Glow opens a floating window with rendered markdown. Press `q` to close.

render-markdown shows inline rendering without leaving the buffer — headings get icons/backgrounds, checkboxes render, code blocks get borders.

markdown-preview.nvim opens your default browser with a live-updating preview — this gives you the richest rendering with actual different-sized headers.

## LLM Iteration Workflow

When iterating with an LLM on architecture docs:

### 1. Use a Consistent Structure
```markdown
## Context

## Goals

## Non-Goals

## Proposed Architecture
### Overview
### Components
### Data Flow

## Open Questions
```

### 2. Mark LLM Drafts
```markdown
## Proposed Architecture

### My Notes
- high-level intent here

### LLM Draft (v1)
> pasted output here

### Synthesis
- refined version after review
```

### 3. Use Folding to Focus
- Collapse everything except the section you're working on
- Keeps your mental surface small while the doc grows

### 4. Quick Navigation Pattern
1. **`z2`** - see outline
2. **`gh`** - jump to section
3. **`za`** - expand
4. Edit or paste LLM output
5. **`z2`** - return to outline

## Tips

1. **Soft wrap is enabled** — long lines wrap at word boundaries
2. **Breakindent is enabled** — wrapped lines preserve indentation
3. **render-markdown conceals markup** — less visual noise while reading
4. **Use `zK` to peek** — see folded content without disrupting your fold state

## Keybinding Reference

| Key | Mode | Action |
|-----|------|--------|
| `]]` | n | Next heading |
| `[[` | n | Previous heading |
| `gh` | n | Telescope headings |
| `<leader>mh` | n | Telescope headings |
| `z1-4` | n | Fold to level |
| `z0` | n | Unfold all |
| `zK` | n | Peek fold |
| `<leader>mp` | n | Browser preview (live) |
| `<leader>mg` | n | Glow preview (terminal) |
| `<leader>mr` | n | Toggle render |
| `<leader>mt` | n | Toggle table mode |
| `<leader>mx` | n | Toggle checkbox |
| `<leader>mb` | v | Bold selection |
| `<leader>mi` | v | Italic selection |
| `<leader>mc` | v | Code selection |
| `Ctrl+1/2/3` | i | Insert H1/H2/H3 |
| `<leader>y` | n | Open yazi at file |
| `<leader>fy` | n | Open yazi at file |
| `<leader>fY` | n | Open yazi at cwd |

## Yazi Integration

yazi.nvim lets you open yazi directly from nvim. Combined with your existing glow preview in yazi, this creates a smooth workflow for browsing and previewing markdown files.

### Keybindings (from nvim)
- **`<leader>y`** or **`<leader>fy`** - Open yazi at current file's directory
- **`<leader>fY`** - Open yazi at working directory

### Keybindings (in yazi)
- **`P`** - Open markdown in browser (grip - GitHub-flavored preview)

### Workflow: Browsing Markdown Files
1. Press `<leader>y` to open yazi
2. Navigate and preview markdown files (glow renders in yazi preview)
3. Press Enter to open in nvim
4. Edit with full folding/navigation support

### Workflow: With Zellij
Your existing backtick binding in yazi opens files in a new zellij pane. Combined with yazi.nvim:
- From nvim: `<leader>y` → browse → Enter → opens in current nvim
- From yazi: backtick → opens in new zellij pane with fresh nvim

## Files

- `~/.config/nvim/lua/plugins/markdown.lua` — plugin definitions + yazi.nvim
- `~/.config/nvim/lua/config/autocmds.lua` — markdown-specific keymaps
- `~/.config/yazi/yazi.toml` — yazi config with glow previewer
- `~/.config/yazi/keymap.toml` — yazi keybindings
