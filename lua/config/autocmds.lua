-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Markdown-specific keymaps and settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    local opts = { buffer = true, silent = true }

    -- Navigation: jump between headings
    vim.keymap.set("n", "]]", function()
      vim.fn.search("^##\\+\\s", "W")
    end, vim.tbl_extend("force", opts, { desc = "Next heading" }))

    vim.keymap.set("n", "[[", function()
      vim.fn.search("^##\\+\\s", "bW")
    end, vim.tbl_extend("force", opts, { desc = "Previous heading" }))

    -- Quick fold levels (z1 = fold to h1, z2 = fold to h2, etc.)
    vim.keymap.set("n", "z1", "<cmd>setlocal foldlevel=1<cr>", vim.tbl_extend("force", opts, { desc = "Fold to H1" }))
    vim.keymap.set("n", "z2", "<cmd>setlocal foldlevel=2<cr>", vim.tbl_extend("force", opts, { desc = "Fold to H2" }))
    vim.keymap.set("n", "z3", "<cmd>setlocal foldlevel=3<cr>", vim.tbl_extend("force", opts, { desc = "Fold to H3" }))
    vim.keymap.set("n", "z4", "<cmd>setlocal foldlevel=4<cr>", vim.tbl_extend("force", opts, { desc = "Fold to H4" }))
    vim.keymap.set("n", "z0", "<cmd>setlocal foldlevel=99<cr>", vim.tbl_extend("force", opts, { desc = "Unfold all" }))

    -- Quick heading insertion (in insert mode at line start)
    vim.keymap.set("i", "<C-1>", "<C-o>0# ", vim.tbl_extend("force", opts, { desc = "Insert H1" }))
    vim.keymap.set("i", "<C-2>", "<C-o>0## ", vim.tbl_extend("force", opts, { desc = "Insert H2" }))
    vim.keymap.set("i", "<C-3>", "<C-o>0### ", vim.tbl_extend("force", opts, { desc = "Insert H3" }))

    -- Toggle checkbox on current line
    vim.keymap.set("n", "<leader>mx", function()
      local line = vim.api.nvim_get_current_line()
      if line:match("%- %[ %]") then
        line = line:gsub("%- %[ %]", "- [x]")
      elseif line:match("%- %[x%]") then
        line = line:gsub("%- %[x%]", "- [ ]")
      elseif line:match("^%s*%-") then
        line = line:gsub("^(%s*)%-", "%1- [ ]")
      end
      vim.api.nvim_set_current_line(line)
    end, vim.tbl_extend("force", opts, { desc = "Toggle checkbox" }))

    -- Wrap selection in emphasis (visual mode)
    vim.keymap.set("v", "<leader>mb", 'c**<C-r>"**<Esc>', vim.tbl_extend("force", opts, { desc = "Bold selection" }))
    vim.keymap.set("v", "<leader>mi", 'c*<C-r>"*<Esc>', vim.tbl_extend("force", opts, { desc = "Italic selection" }))
    vim.keymap.set("v", "<leader>mc", 'c`<C-r>"`<Esc>', vim.tbl_extend("force", opts, { desc = "Code selection" }))

    -- Soft wrap for long lines (better reading)
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true

    -- Spell check (optional, enable if you want)
    -- vim.opt_local.spell = true
    -- vim.opt_local.spelllang = "en_us"
  end,
})
