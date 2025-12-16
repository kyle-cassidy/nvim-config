return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      -- open file_browser with the path of the current buffer
      -- Commented out - using fyler.nvim with <space>fd instead
      -- vim.api.nvim_set_keymap(
      --   "n",
      --   "<space>fd",
      --   ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      --   { noremap = true }
      -- )

      require("telescope").load_extension("ui-select")
    end,
  },
}
