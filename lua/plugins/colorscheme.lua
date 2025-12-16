-- Claude-Gruvbox: warm terracotta meets earthy gruvbox
return {
  -- Gruvbox with Claude-inspired customizations
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      terminal_colors = true,
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true,
      contrast = "hard", -- "hard", "soft" or empty
      palette_overrides = {
        -- Claude terracotta/coral tones
        bright_orange = "#DA7756", -- Claude's signature coral
        neutral_orange = "#CC5A36", -- Deeper terracotta
        faded_orange = "#B8533A",
        -- Warmer cream foreground
        light0 = "#E8DFD0", -- Warm cream (fg in dark mode)
        light1 = "#DDD5C6",
        light2 = "#D1C9BA",
        light3 = "#C5BDAE",
        light4 = "#B9B1A2",
        -- Slightly warmer dark backgrounds
        dark0_hard = "#1D1D1D", -- Deep charcoal
        dark0 = "#242424", -- Main bg
        dark0_soft = "#2A2A2A",
        dark1 = "#3A3632", -- Warm dark brown
        dark2 = "#4A4640",
        dark3 = "#5A564E",
        dark4 = "#6A665C",
      },
      overrides = {
        -- Make strings use the Claude coral
        String = { fg = "#DA7756" },
        -- Warmer orange for numbers
        Number = { fg = "#E8985A" },
        Float = { fg = "#E8985A" },
        -- Functions get a warm gold
        Function = { fg = "#E8B85A", bold = true },
        -- Keywords stay gruvbox aqua for contrast
        Keyword = { fg = "#8ec07c" },
        -- Types get warm yellow
        Type = { fg = "#fabd2f" },
        -- Comments stay muted
        Comment = { fg = "#7c7c7c", italic = true },
        -- Cursor line subtle warmth
        CursorLine = { bg = "#2E2A26" },
        CursorLineNr = { fg = "#DA7756", bold = true },
        -- Visual selection with terracotta tint
        Visual = { bg = "#4A3A32" },
        -- Search highlights
        Search = { fg = "#1D1D1D", bg = "#DA7756" },
        IncSearch = { fg = "#1D1D1D", bg = "#E8B85A" },
        -- Matching parens
        MatchParen = { fg = "#DA7756", bold = true, underline = true },
        -- Git signs
        GitSignsAdd = { fg = "#b8bb26" },
        GitSignsChange = { fg = "#DA7756" },
        GitSignsDelete = { fg = "#fb4934" },
        -- Telescope
        TelescopeSelection = { bg = "#3A3632", fg = "#DA7756" },
        TelescopeMatching = { fg = "#DA7756", bold = true },
        TelescopeBorder = { fg = "#5A564E" },
        -- Markdown headings
        ["@markup.heading.1.markdown"] = { fg = "#DA7756", bold = true },
        ["@markup.heading.2.markdown"] = { fg = "#E8B85A", bold = true },
        ["@markup.heading.3.markdown"] = { fg = "#8ec07c", bold = true },
        ["@markup.heading.4.markdown"] = { fg = "#83a598", bold = true },
        -- Status line
        StatusLine = { fg = "#E8DFD0", bg = "#2E2A26" },
        StatusLineNC = { fg = "#7c7c7c", bg = "#242424" },
        -- Floats and popups
        NormalFloat = { bg = "#2A2626" },
        FloatBorder = { fg = "#5A564E", bg = "#2A2626" },
        -- Which-key
        WhichKey = { fg = "#DA7756" },
        WhichKeyGroup = { fg = "#8ec07c" },
        WhichKeyDesc = { fg = "#E8DFD0" },
        -- Indent guides
        IblIndent = { fg = "#3A3632" },
        IblScope = { fg = "#5A564E" },
        -- Treesitter context
        TreesitterContext = { bg = "#2E2A26" },
      },
    },
  },

  -- Keep others as fallbacks
  { "olimorris/onedarkpro.nvim", lazy = true },
  { "catppuccin/nvim", lazy = true, name = "catppuccin" },

  -- Set Claude-Gruvbox as default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
