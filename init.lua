-- Debug and Logging Settings (disabled for performance)
-- Uncomment these lines when debugging issues:
-- vim.lsp.set_log_level("debug")
-- vim.g.vimsyn_embed = 'l'
-- vim.opt.verbose = 15
-- vim.opt.verbosefile = "/tmp/nvim_verbose.log"
-- vim.g.lazy_show_debug = 1

-- Normal settings for daily use
vim.lsp.set_log_level("warn")

-- Load performance optimizations
require('config.performance')

-- Load LSP helper functions
require('config.lsp-helper')

-- Explorer helpers are now integrated into snacks-explorer.lua plugin

-- Python Host Settings 
vim.g.python3_host_prog = '~/.venv_nvim/bin/python3'

-- Environment-specific Configuration
if vim.g.vscode then
  -- VSCode extensions
  require("config.keymaps_vscode").setup()
else
  -- Neovim-specific configuration
  require("config.lazy")
end
