return {
  "mrjones2014/legendary.nvim",
  priority = 10000,
  lazy = false,
  dependencies = { "kkharji/sqlite.lua" },
  config = function()
    require("legendary").setup({
      include_builtin = true,
      include_legendary_cmds = true,
      sort = {
        most_recent_first = true,
        user_items_first = true,
        frecency = {
          db_root = vim.fn.stdpath("data") .. "/legendary/",
          max_timestamps = 20,
        },
      },
      extensions = {
        lazy_nvim = true,
        which_key = {
          auto_register = true,
          use_groups = true,
          expand = 0,
        },
        nvim_tree = false,
        smart_splits = false,
        op_nvim = false,
        diffview = false,
      },
      scratchpad = {
        view = "float",
        results_view = "float",
        float_config = { border = "rounded" },
        keep_contents = true,
      },
      cache_path = vim.fn.stdpath("cache") .. "/legendary/",
      log_level = "info",
    })
  end,
  keys = {
    { 
      "<C-S-p>", 
      function()
        require("legendary").find()
      end,
      mode = { "n", "v" },
      desc = "Command Palette (Legendary)" 
    },
    { 
      "<leader>P", 
      function()
        require("legendary").find()
      end,
      desc = "Command Palette" 
    },
    -- Add D- bindings for macOS Cmd key if your terminal supports it
    { 
      "<D-S-p>", 
      function()
        require("legendary").find()
      end,
      mode = { "n", "v" },
      desc = "Command Palette (Cmd+Shift+P)" 
    },
    -- Map F13 which Ghostty sends for Cmd+Shift+P
    { 
      "<F13>", 
      function()
        require("legendary").find()
      end,
      mode = { "n", "v", "i" },
      desc = "Command Palette (Cmd+Shift+P via Ghostty)" 
    },
  },
}