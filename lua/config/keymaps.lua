-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

vim.g.mapleader = " "

-- Disable LazyVim's default <leader><leader> (space-space) mapping
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",
--   callback = function()
--     pcall(vim.keymap.del, "n", "<leader><leader>")
--   end,
-- })

vim.api.nvim_set_keymap("n", "<leader>;;", "/", { noremap = true })
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

-- Quick access to Lazy plugin manager from fyler
vim.api.nvim_set_keymap("n", "<leader>lf", "<cmd>Lazy<cr><cmd>Fyler<cr>", { noremap = true, desc = "Lazy then Fyler" })

-- vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- better motion
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.api.nvim_set_keymap("v", "H", "^", { noremap = true }) --(default H moves the cursor to the top of the screen)
vim.api.nvim_set_keymap("v", "J", "}", { noremap = true }) --(default J moves down one line)
vim.api.nvim_set_keymap("v", "K", "{", { noremap = true }) --(default K moves up one line)
vim.api.nvim_set_keymap("v", "L", "$", { noremap = true }) --(no defualt that i know of)

vim.api.nvim_set_keymap("n", "H", "^", { noremap = true })
vim.api.nvim_set_keymap("n", "J", "}", { noremap = true })
vim.api.nvim_set_keymap("n", "K", "{", { noremap = true })
vim.api.nvim_set_keymap("n", "L", "$", { noremap = true })

-- smart dd: only yank the line if it's not empty
keymap("n", "dd", function()
  if vim.fn.getline(".") == "" then
    return '"_dd'
  end
  return "dd"
end, { expr = true })

-- Themery theme switcher
keymap("n", "<leader>th", ":Themery<CR>", { desc = "Open theme switcher" })

-- Quick escape from special buffers (dashboard, claude code, etc)
-- Using <leader>q to quit special buffers instead of Esc to avoid conflicts
keymap("n", "<leader>q", function()
  local buftype = vim.bo.buftype
  local filetype = vim.bo.filetype
  local bufname = vim.fn.bufname()
  -- Check if we're in a special buffer or Claude Code buffer
  if
    buftype ~= ""
    or filetype == "alpha"
    or filetype == "dashboard"
    or filetype == "lazy"
    or string.match(bufname, "claude")
  then
    -- Get list of normal buffers
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    local current = vim.fn.bufnr()

    -- Try to find a normal buffer to switch to
    for _, buf in ipairs(buffers) do
      if buf.bufnr ~= current and buf.name ~= "" and not string.match(buf.name, "claude") then
        vim.cmd("buffer " .. buf.bufnr)
        return
      end
    end

    -- If no other buffers, create a new one
    vim.cmd("enew")
  else
    -- If in normal buffer, just quit
    vim.cmd("q")
  end
end, { desc = "Quit buffer or escape from special buffers" })

-- Alternative escape with double Esc (won't conflict with Claude Code's single Esc)
keymap("n", "<Esc><Esc>", function()
  local bufname = vim.fn.bufname()
  if string.match(bufname, "claude") or vim.bo.buftype ~= "" then
    -- Get list of normal buffers
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    local current = vim.fn.bufnr()

    -- Try to find a normal buffer to switch to
    for _, buf in ipairs(buffers) do
      if buf.bufnr ~= current and buf.name ~= "" and not string.match(buf.name, "claude") then
        vim.cmd("buffer " .. buf.bufnr)
        return
      end
    end

    -- If no other buffers, create a new one
    vim.cmd("enew")
  end
end, { desc = "Double Esc to escape special buffers" })

-- Quick buffer switching (with fallback)
keymap("n", "<leader><Tab>", function()
  local ok = pcall(vim.cmd, "b#")
  if not ok then
    -- Show buffer list if no alternate buffer
    vim.cmd("Telescope buffers")
  end
end, { desc = "Switch to previous buffer" })

keymap("n", "<leader>bb", function()
  local ok = pcall(vim.cmd, "b#")
  if not ok then
    -- Show buffer list if no alternate buffer
    vim.cmd("Telescope buffers")
  end
end, { desc = "Switch to previous buffer" })

-- Map leader-backtick to escape Claude buffer or switch buffers
keymap("n", "<leader>`", function()
  local bufname = vim.fn.bufname()

  -- If in Claude buffer, try to find another buffer
  if string.match(bufname, "claude") or string.match(bufname, "Claude") then
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    local current = vim.fn.bufnr()

    -- Find first non-Claude buffer
    for _, buf in ipairs(buffers) do
      if buf.bufnr ~= current and not string.match(buf.name or "", "[Cc]laude") then
        vim.cmd("buffer " .. buf.bufnr)
        return
      end
    end

    -- No other buffers, create new
    vim.cmd("enew")
  else
    -- Not in Claude buffer, try to switch to alternate
    local ok = pcall(vim.cmd, "b#")
    if not ok then
      vim.cmd("Telescope buffers")
    end
  end
end, { desc = "Smart buffer switch (escape Claude)" })
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to window below" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to window above" })

-- macOS-style navigation in INSERT mode
-- Option+Arrow for word navigation (terminal sends <M-b> and <M-f>)
keymap("i", "<M-b>", "<C-o>b", { desc = "Move back one word" })
keymap("i", "<M-f>", "<C-o>w", { desc = "Move forward one word" })
-- Cmd+Arrow for line navigation (Ghostty sends <C-a> and <C-e>)
keymap("i", "<C-a>", "<C-o>0", { desc = "Move to beginning of line" })
keymap("i", "<C-e>", "<C-o>$", { desc = "Move to end of line" })

-- macOS-style deletion in INSERT mode
-- Option+Backspace for delete word backward
keymap("i", "<M-BS>", "<C-w>", { desc = "Delete word backward" })
-- Cmd+Backspace for delete to line start (Ghostty needs: keybind = cmd+backspace=text:\x15)
keymap("i", "<C-u>", "<C-u>", { desc = "Delete to line start" })
