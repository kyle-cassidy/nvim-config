return {
  -- Themery: theme switcher with live preview
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          {
            name = "Catppuccin Mocha",
            colorscheme = "catppuccin-mocha",
          },
          {
            name = "Catppuccin Latte",
            colorscheme = "catppuccin-latte",
          },
          {
            name = "One Dark",
            colorscheme = "onedark",
          },
          {
            name = "One Dark Vivid",
            colorscheme = "onedark_vivid",
          },
          {
            name = "One Dark Dark",
            colorscheme = "onedark_dark",
          },
          {
            name = "One Light",
            colorscheme = "onelight",
          },
          {
            name = "Gruvbox Dark",
            colorscheme = "gruvbox",
          },
          {
            name = "Tokyo Night",
            colorscheme = "tokyonight",
          },
          {
            name = "Tokyo Night Storm",
            colorscheme = "tokyonight-storm",
          },
          {
            name = "Tokyo Night Day",
            colorscheme = "tokyonight-day",
          },
          {
            name = "Kanagawa",
            colorscheme = "kanagawa",
          },
          {
            name = "Kanagawa Dragon",
            colorscheme = "kanagawa-dragon",
          },
          {
            name = "Rose Pine",
            colorscheme = "rose-pine",
          },
          {
            name = "Rose Pine Moon",
            colorscheme = "rose-pine-moon",
          },
          {
            name = "Rose Pine Dawn",
            colorscheme = "rose-pine-dawn",
          },
          {
            name = "Nord",
            colorscheme = "nord",
          },
          {
            name = "Everforest",
            colorscheme = "everforest",
          },
          {
            name = "Nightfox",
            colorscheme = "nightfox",
          },
          {
            name = "Dracula",
            colorscheme = "dracula",
          },
          {
            name = "Solarized Osaka",
            colorscheme = "solarized-osaka",
          },
        },
        livePreview = true,
      })
    end,
  },

  -- High quality themes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night", -- night, storm, day, moon
      transparent = false,
    },
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "main", -- main, moon, dawn
    },
  },

  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "medium" -- hard, medium, soft
      vim.g.everforest_better_performance = 1
    end,
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
    },
  },
}