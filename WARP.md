# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Common Commands

### Plugin Management
- **Update all plugins**: `:Lazy sync`
- **Check for updates**: `:Lazy check`
- **Open Lazy UI**: `:Lazy` or `<leader>l`
- **View plugin logs**: `:Lazy log`
- **Profile startup**: `:Lazy profile`

### LSP & Language Servers
- **Manage LSP servers**: `:Mason` (opens UI)
- **Install LSP server**: `:MasonInstall <server_name>`
- **Uninstall LSP server**: `:MasonUninstall <server_name>`
- **Check LSP status**: `:LspInfo`
- **Format current file**: `:lua vim.lsp.buf.format()`

### Code Formatting
- **Format current Lua file**: `:!stylua %`
- **Format all Lua files**: `:!stylua lua/`
- **Toggle format on save**: `:FormatOnSaveToggle`

### Configuration & Debugging
- **Check health**: `:checkhealth`
- **Check Lazy health**: `:checkhealth lazy`
- **Reload current file**: `:source %`
- **Reload init.lua**: `:source $MYVIMRC`
- **Enable debug logging**: Uncomment debug lines at top of `init.lua`

## Architecture

### Core Structure
This is a **LazyVim** distribution configuration using **Lazy.nvim** as the plugin manager.

**Entry Points:**
- `init.lua` - Main entry point that:
  - Sets LSP log level
  - Loads performance optimizations from `lua/config/performance.lua`
  - Loads LSP helper functions from `lua/config/lsp-helper.lua`
  - Configures Python host at `~/.venv_nvim/bin/python3`
  - Detects VSCode and loads appropriate configuration

**Configuration Layout:**
- `lua/config/` - Core configuration files
  - `lazy.lua` - Lazy.nvim bootstrap and setup
  - `options.lua` - Vim options and settings
  - `keymaps.lua` - Custom key mappings
  - `autocmds.lua` - Auto commands
  - `performance.lua` - Performance optimizations
  - `lsp-helper.lua` - LSP utility functions

**Plugin System:**
- `lua/plugins/` - Individual plugin configurations
  - Each file returns a Lua table with plugin specifications
  - Automatically loaded by Lazy.nvim
  - Key plugins: blink.lua (completion), lsp.lua, mason.lua, themery.lua

### LSP Architecture
- **Mason** manages LSP server installations
- **mason-lspconfig** bridges Mason with nvim-lspconfig
- Custom handlers in `lua/plugins/lsp/handlers.lua` provide:
  - Capabilities detection (Blink.cmp integration)
  - Diagnostic configuration
  - Keymapping setup
  - Document highlighting
  - Format on save toggle

### Completion System
Uses **Blink.cmp** instead of nvim-cmp for better performance:
- Configured in `lua/plugins/blink.lua`
- Integrates with LSP for capabilities
- Provides fast, efficient completion

### LazyVim Extras
Enabled extras (from `lazyvim.json`):
- **Coding**: mini-surround, yanky
- **Editor**: dial, fzf, harpoon2, leap, snacks (explorer & picker)
- **Formatting**: black (Python)
- **Languages**: docker, git, json, markdown, python, toml
- **UI**: mini-animate, mini-hipatterns
- **Utilities**: gitui
- **Integration**: vscode support

## Key Bindings

### Essential Mappings
- **Leader key**: `<Space>`
- **Escape insert mode**: `jk`
- **Search forward**: `<leader>;;`

### Navigation (Normal & Visual)
- `H` - Jump to line start
- `J` - Jump to next paragraph
- `K` - Jump to previous paragraph  
- `L` - Jump to line end

### Buffer Management
- `<leader>q` - Quit/escape special buffers
- `<Esc><Esc>` - Double escape from special buffers
- `<leader><Tab>` or `<leader>bb` - Switch to previous buffer
- `<leader>` ` - Smart buffer switch (escapes Claude buffers)

### Window Navigation
- `<C-h>` - Move to left window
- `<C-l>` - Move to right window
- `<C-j>` - Move to window below
- `<C-k>` - Move to window above

### Plugin Access
- `<leader>lf` - Open Lazy then Fyler
- `<leader>th` - Open Themery theme switcher

### LSP Bindings (when attached)
- `gD` - LSP finder (via Lspsaga)
- `gd` - Go to definition
- `K` - Hover documentation
- `gi` - Go to implementation
- `<leader>ca` - Code action
- `<leader>rn` - Rename symbol

## Configuration Notes

### Display Settings
- **Winbar**: Shows filename in top right (`%=%m %f`)
- **Status column**: Shows relative line numbers only
- **Conceal level**: Set to 2 for better markdown/obsidian display

### Python Environment
- Dedicated virtual environment: `~/.venv_nvim`
- Used for Neovim Python provider and debugpy
- Configure in `lua/plugins/mason.lua`

### Formatting
- **stylua** for Lua (config in `stylua.toml`)
- **black** and **isort** for Python
- **prettier/prettierd** for JavaScript/TypeScript
- Configured via `conform.nvim` in `lua/plugins/lsp.lua`

### Performance Features
- Lazy loading managed by Lazy.nvim
- Performance optimizations in `lua/config/performance.lua`
- Smart dd command that doesn't yank empty lines

### VSCode Integration
- Separate keymaps loaded when `vim.g.vscode` is detected
- Configuration in `lua/config/keymaps_vscode.lua`

### Development Tips
- Check plugin updates regularly with `:Lazy check`
- Use `:checkhealth` to diagnose issues
- Enable debug logging by uncommenting lines in `init.lua` when troubleshooting
- The `.claude/settings.local.json` allows Claude AI to interact with the configuration
