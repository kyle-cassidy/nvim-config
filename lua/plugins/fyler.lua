return {
  "A7Lavinraj/fyler.nvim",
  dependencies = {
    "nvim-mini/mini.icons",
    "nvim-tree/nvim-web-devicons", -- Add as fallback
  },
  branch = "stable",
  init = function()
    -- Workaround for cursor position error
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "Fyler",
      callback = function()
        vim.opt_local.modifiable = true
        vim.opt_local.cursorline = true
      end,
    })
  end,
  opts = {
    icon_provider = false, -- Disable icons to avoid rendering issues
  },
  keys = {
    { "<space>fd", "<cmd>Fyler<cr>", desc = "Open Fyler file explorer" },
  },
}