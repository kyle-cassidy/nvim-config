-- Markdown ergonomics: folding, rendering, preview, navigation
return {
  -- yazi.nvim: open yazi file manager from nvim
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      open_for_directories = false, -- let neo-tree handle directories
      floating_window_scaling_factor = 0.85,
      yazi_floating_window_border = "rounded",
      keymaps = {
        show_help = "<f1>",
      },
    },
    keys = {
      { "<leader>fy", "<cmd>Yazi<cr>", desc = "Open yazi at file" },
      { "<leader>fY", "<cmd>Yazi cwd<cr>", desc = "Open yazi at cwd" },
      { "<leader>y", "<cmd>Yazi<cr>", desc = "Open yazi" },
    },
  },

  -- nvim-ufo: proper treesitter-based folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufRead",
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        -- Use treesitter for markdown, indent as fallback
        if filetype == "markdown" then
          return { "treesitter", "indent" }
        end
        return { "treesitter", "indent" }
      end,
      -- Show fold preview on hover
      preview = {
        win_config = {
          border = "rounded",
          winhighlight = "Normal:Normal",
          winblend = 0,
        },
      },
    },
    keys = {
      { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
      { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
      { "zr", function() require("ufo").openFoldsExceptKinds() end, desc = "Open folds except kinds" },
      { "zm", function() require("ufo").closeFoldsWith() end, desc = "Close folds with" },
      { "zK", function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end, desc = "Peek fold or hover" },
    },
    init = function()
      -- Required for nvim-ufo
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
  },

  -- render-markdown: calm inline rendering
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown", "Avante" },
    opts = {
      heading = {
        enabled = true,
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        -- Different background for each heading level
        backgrounds = {
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "RenderMarkdownH3Bg",
          "RenderMarkdownH4Bg",
          "RenderMarkdownH5Bg",
          "RenderMarkdownH6Bg",
        },
      },
      code = {
        enabled = true,
        sign = true,
        style = "full",
        border = "thick",
        width = "block",
      },
      bullet = {
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
      },
      checkbox = {
        enabled = true,
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰄵 " },
      },
      quote = {
        enabled = true,
        icon = "▎",
      },
      -- Conceal markup for calmer reading
      pipe_table = {
        enabled = true,
        style = "full",
      },
    },
    keys = {
      { "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle markdown render" },
    },
  },

  -- glow.nvim: terminal preview
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    ft = "markdown",
    opts = {
      border = "rounded",
      width_ratio = 0.8,
      height_ratio = 0.8,
      width = 120,
      height = 100,
    },
    keys = {
      { "<leader>mp", "<cmd>Glow<cr>", desc = "Preview markdown (Glow)" },
    },
  },

  -- telescope-heading: navigate headings
  {
    "crispgm/telescope-heading.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    ft = "markdown",
    config = function()
      require("telescope").load_extension("heading")
    end,
    keys = {
      { "<leader>mh", "<cmd>Telescope heading<cr>", desc = "Jump to heading" },
      { "gh", "<cmd>Telescope heading<cr>", desc = "Jump to heading" },
    },
  },

  -- vim-table-mode: ergonomic table editing
  {
    "dhruvasagar/vim-table-mode",
    ft = "markdown",
    init = function()
      vim.g.table_mode_corner = "|"
    end,
    keys = {
      { "<leader>mt", "<cmd>TableModeToggle<cr>", desc = "Toggle table mode" },
    },
  },

  -- Additional markdown keymaps via which-key
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>m", group = "markdown", icon = "󰍔" },
      },
    },
  },
}
