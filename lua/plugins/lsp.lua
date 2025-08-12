return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- Core languages
          "lua_ls",
          "pyright",
          "rust_analyzer",
          "ts_ls", -- TypeScript/JavaScript
          "denols", -- Deno TypeScript/JavaScript
          "clangd", -- C/C++
          
          -- Web development
          "html",
          "cssls",
          "tailwindcss",
          "emmet_ls",
          "eslint",
          
          -- Configuration files
          "jsonls",
          "yamlls",
          "taplo", -- TOML
          
          -- Other useful servers
          "marksman", -- Markdown
          "bashls", -- Bash
          "dockerls", -- Docker
        },
        automatic_installation = true,
      })
    end,
  },
  -- Note: Using blink.cmp from LazyVim instead of nvim-cmp
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      -- Use blink.cmp capabilities instead of cmp-nvim-lsp
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Setup LSP servers
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })

      -- Keymaps
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          javascript = { { "prettierd", "prettier" } },
          typescript = { { "prettierd", "prettier" } },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
}
