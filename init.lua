-- Debug and Logging Settings
vim.lsp.set_log_level("debug")
vim.g.vimsyn_embed = 'l'
vim.opt.verbose = 15
vim.opt.verbosefile = "/tmp/nvim_verbose.log"

-- Plugin Manager Settings
vim.g.lazy_show_debug = 1

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
