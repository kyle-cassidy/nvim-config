-- Snacks Explorer Helper Commands
local M = {}

-- Open explorer with different styles
function M.open_float()
  Snacks.explorer({ style = "float" })
end

function M.open_center()
  Snacks.explorer({
    position = "float",
    backdrop = 60,
    border = "rounded",
    height = 0.8,
    width = 0.7,
    row = 0.5,  -- Center vertically
    col = 0.5,  -- Center horizontally
    title = " 📂 Center Explorer ",
    title_pos = "center",
  })
end

function M.open_left()
  Snacks.explorer({
    position = "float",
    backdrop = 40,
    border = "rounded",
    height = 0.85,
    width = 0.6,
    row = 0.1,  -- Near top
    col = 0.2,  -- Left-aligned
    title = " 📂 Left Explorer ",
    title_pos = "center",
  })
end

function M.open_minimal()
  Snacks.explorer({
    position = "float",
    backdrop = false,
    border = "single",
    height = 0.6,
    width = 0.4,
    row = 0.2,
    col = 0.3,
  })
end

function M.open_side()
  Snacks.explorer({
    position = "left",
    width = 0.25,
    border = "none",
  })
end

function M.open_fullscreen()
  Snacks.explorer({
    position = "float",
    height = 0.95,
    width = 0.95,
    backdrop = 20,
    border = "rounded",
  })
end

function M.open_compact()
  Snacks.explorer({
    position = "float",
    height = 0.5,
    width = 0.4,
    backdrop = false,
    border = "single",
    row = 0.1,
    col = 0.3,
  })
end

-- Reveal current file in explorer
function M.reveal_current()
  Snacks.explorer.reveal()
end

-- Create user commands
vim.api.nvim_create_user_command("ExplorerFloat", M.open_float, { desc = "Open floating explorer" })
vim.api.nvim_create_user_command("ExplorerCenter", M.open_center, { desc = "Open center floating explorer" })
vim.api.nvim_create_user_command("ExplorerLeft", M.open_left, { desc = "Open left floating explorer" })
vim.api.nvim_create_user_command("ExplorerMinimal", M.open_minimal, { desc = "Open minimal explorer" })
vim.api.nvim_create_user_command("ExplorerSide", M.open_side, { desc = "Open side explorer" })
vim.api.nvim_create_user_command("ExplorerFull", M.open_fullscreen, { desc = "Open fullscreen explorer" })
vim.api.nvim_create_user_command("ExplorerCompact", M.open_compact, { desc = "Open compact explorer" })
vim.api.nvim_create_user_command("ExplorerReveal", M.reveal_current, { desc = "Reveal current file in explorer" })

-- Keymaps (optional)
vim.keymap.set("n", "<leader>ef", M.open_float, { desc = "Explorer: Float" })
vim.keymap.set("n", "<leader>ec", M.open_center, { desc = "Explorer: Center" })
vim.keymap.set("n", "<leader>el", M.open_left, { desc = "Explorer: Left" })
vim.keymap.set("n", "<leader>em", M.open_minimal, { desc = "Explorer: Minimal" })
vim.keymap.set("n", "<leader>es", M.open_side, { desc = "Explorer: Side" })
vim.keymap.set("n", "<leader>eF", M.open_fullscreen, { desc = "Explorer: Fullscreen" })
vim.keymap.set("n", "<leader>eC", M.open_compact, { desc = "Explorer: Compact" })
vim.keymap.set("n", "<leader>er", M.reveal_current, { desc = "Explorer: Reveal Current" })

-- LazyVim default keymaps for compatibility
vim.keymap.set('n', '<leader>fe', M.open_float, { desc = "Explorer: Float (root)" })
vim.keymap.set('n', '<leader>fE', M.open_float, { desc = "Explorer: Float (cwd)" })

-- Replace default <leader>e with floating explorer (optional)
-- Uncomment the line below if you want <leader>e to open floating explorer:
-- vim.keymap.set('n', '<leader>e', M.open_float, { desc = "Explorer: Float" })

return M
