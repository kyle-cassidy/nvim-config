local M = {}

M.opts = {
  mappings = {
    -- { mode = 'i', lhs = 'jk', rhs = '<Esc>', opts = { noremap = true, silent = true } },
    -- Add more mappings as needed
  }
}

function M.setup(opts)
  opts = vim.tbl_deep_extend("force", M.opts, opts or {})
  
  for _, mapping in ipairs(opts.mappings) do
    vim.keymap.set(mapping.mode, mapping.lhs, mapping.rhs, mapping.opts)
  end

  -- VSCode-specific way to set the 'jk' mapping
  vim.api.nvim_command([[
    if exists('g:vscode')
      inoremap jk <Esc>
    endif
  ]])
end

return M