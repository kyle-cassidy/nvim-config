return {
  -- Disable conflicting file explorers
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  
  -- Oil.nvim configuration
  {
    "stevearc/oil.nvim",
    lazy = false, -- Important: don't lazy load oil
    priority = 1000, -- Load early to take over directory buffers
    dependencies = { 
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      -- This runs before oil loads to ensure it takes over netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      require("oil").setup({
        -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
        default_file_explorer = true,
        
        -- Columns to show in the file list
        columns = {
          "icon",
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        
        -- Buffer-local options to use for oil buffers
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        
        -- Window-local options to use for oil buffers
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        
        -- Send deleted files to trash instead of permanently deleting
        delete_to_trash = false,
        
        -- Skip confirmation for simple operations
        skip_confirm_for_simple_edits = false,
        
        -- Prompt to save changes before selecting new entry
        prompt_save_on_select_new_entry = true,
        
        -- Oil will automatically delete hidden buffers after this delay
        cleanup_delay_ms = 2000,
        
        -- Constrain cursor to editable parts of the oil buffer
        constrain_cursor = "editable",
        
        -- Keymaps in oil buffer
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open in vertical split" },
          ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open in horizontal split" },
          ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open in new tab" },
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = { "actions.cd", opts = { scope = "tab" } },
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        
        -- Use default keymaps
        use_default_keymaps = true,
        
        -- View options
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = false,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return false
          end,
          -- Sort files and directories
          sort = {
            -- sort order can be "asc" or "desc"
            { "type", "asc" },
            { "name", "asc" },
          },
        },
        
        -- Configuration for the floating window
        float = {
          -- Padding around the floating window
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
        
        -- Preview window configuration
        preview = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = 0.9,
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
        
        -- Configuration for the progress window
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
      })
    end,
    keys = {
      {
        "-",
        "<CMD>Oil<CR>",
        desc = "Open parent directory",
      },
      {
        "<leader>-",
        function()
          require("oil").open_float()
        end,
        desc = "Open Oil in floating window",
      },
      {
        "<leader>e",
        "<CMD>Oil<CR>",
        desc = "Open file explorer (Oil)",
      },
    },
  },
}
