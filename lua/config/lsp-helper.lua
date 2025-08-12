-- LSP Helper Functions
local M = {}

-- Common LSP servers for different languages
M.common_servers = {
  -- Web Development
  deno = "denols",
  node = "ts_ls", 
  vue = "volar",
  svelte = "svelte",
  astro = "astro",
  
  -- Systems Programming  
  go = "gopls",
  zig = "zls",
  c = "clangd",
  cpp = "clangd",
  
  -- Other Languages
  java = "jdtls",
  kotlin = "kotlin_language_server",
  swift = "sourcekit",
  php = "phpactor",
  ruby = "solargraph",
  
  -- Data/Config
  sql = "sqlls",
  graphql = "graphql",
  terraform = "terraformls",
}

-- Function to quickly install an LSP
function M.install_lsp(language)
  local server = M.common_servers[language]
  if server then
    vim.cmd("MasonInstall " .. server)
    print("Installing " .. server .. " for " .. language)
  else
    print("LSP for " .. language .. " not found in common servers")
    vim.cmd("Mason") -- Open Mason for manual selection
  end
end

-- Command to install LSP for current filetype
function M.install_for_current_file()
  local ft = vim.bo.filetype
  if ft == "" then
    print("No filetype detected")
    return
  end
  
  M.install_lsp(ft)
end

-- Create user commands
vim.api.nvim_create_user_command('LspInstall', function(opts)
  M.install_lsp(opts.args)
end, { nargs = 1 })

vim.api.nvim_create_user_command('LspInstallCurrent', function()
  M.install_for_current_file()
end, {})

return M
