# Flash.nvim Keybindings Cheat Sheet

## Main Keybindings (Default)

### Core Navigation
- **`s`** (Normal/Visual/Operator mode) - **Flash Jump**
  - Type `s` followed by the character(s) you want to jump to
  - Labels will appear, press the label key to jump
  - Example: `s` → `th` → `a` (jumps to "the" with label 'a')

- **`S`** (Normal/Visual/Operator mode) - **Flash Treesitter**
  - Jump to any treesitter node (functions, classes, etc.)
  - Useful for code navigation

- **`r`** (Operator mode) - **Remote Flash**
  - Perform operations on remote locations without moving cursor
  - Example: `yr` to yank from a remote location

- **`R`** (Operator/Visual mode) - **Treesitter Search**
  - Search and select treesitter nodes

- **`Ctrl+s`** (Command mode) - **Toggle Flash Search**
  - Toggle flash mode during regular search (`/` or `?`)

### Enhanced f/F/t/T Motions
Flash.nvim enhances the built-in character motions:

- **`f{char}`** - Jump forward to {char}
- **`F{char}`** - Jump backward to {char}
- **`t{char}`** - Jump forward till (before) {char}
- **`T{char}`** - Jump backward till (after) {char}
- **`;`** - Repeat last f/F/t/T motion forward
- **`,`** - Repeat last f/F/t/T motion backward

With flash.nvim, after pressing `f`/`F`/`t`/`T`:
- You can continue typing more characters for better precision
- Jump labels appear when there are multiple matches
- Works across multiple lines (configurable)

## Usage Examples

### Basic Jump (`s`)
1. Press `s`
2. Type the first few characters of where you want to go
3. If there are multiple matches, press the highlighted label key
4. You'll jump to that location

### Deleting with Flash
- `ds{chars}{label}` - Delete from cursor to the target
- Example: `dsth` then press label to delete to "the"

### Yanking with Flash
- `ys{chars}{label}` - Yank from cursor to the target
- `yr{chars}{label}` - Yank remote text without moving

### Visual Selection
- `vs{chars}{label}` - Select from cursor to target
- Press `s` in visual mode to extend selection

## Tips

1. **Multi-window Jump**: Flash can jump across windows by default
2. **Case Sensitivity**: Respects your `ignorecase` and `smartcase` settings
3. **Incremental Search**: In search mode (`/`), flash integrates seamlessly
4. **Jump to First Match**: Press `Enter` to jump to the first match without labels
5. **Cancel**: Press `Esc` to cancel flash mode

## Customization Ideas

To change keybindings, edit `~/.config/nvim/lua/plugins/flash.lua`:

```lua
-- Example: Change main jump key from 's' to '<leader>j'
{ "<leader>j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" }

-- Example: Disable 's' and use only 'f/F/t/T' motions
-- Comment out the 's' keybinding and keep char mode enabled
```

## Common Workflows

### Quick Navigation
- See a word on screen? Press `s` + first 2-3 letters + label
- Navigate code? Press `S` to jump between functions/classes
- Quick edit? `cs{chars}{label}` to change text at target

### Search Enhancement
- Start search with `/`
- Press `Ctrl+s` to toggle flash mode
- Now you can jump to any match with labels

Remember: The more specific your search pattern, the fewer labels you'll need to press!
