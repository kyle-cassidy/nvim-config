-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>;;", "/", { noremap = true })
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

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
