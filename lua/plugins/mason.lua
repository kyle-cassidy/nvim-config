return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
      },
    },
  },
  opts = {
    auto_install = {
      "lua_ls", "clangd", "pyright", "cssls", "html",
      "emmet_ls", "jdtls", "yamlls", "vimls",
    },
    python3_host_prog = '~/.venv_nvim/bin/python3',
    mason_ui = {
      check_outdated_packages_on_open = false,
      border = "single",
      icons = {
        package_pending = " ",
        package_installed = " ",
        package_uninstalled = " ",
      },
    },
  },
  config = function(_, opts)
    vim.g.python3_host_prog = opts.python3_host_prog
    require("plugins.lsp.handlers").setup()

    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    require("lspconfig.ui.windows").default_options.border = "rounded"

    mason.setup({ ui = opts.mason_ui })
    mason_lspconfig.setup({ ensure_installed = opts.auto_install })

    mason_lspconfig.setup_handlers({
      function(server_name)
        local server_opts = {
          on_attach = require("plugins.lsp.handlers").on_attach,
          capabilities = require("plugins.lsp.handlers").capabilities,
        }

        if server_name == "debugpy" then
          server_opts.cmd = { opts.python3_host_prog, "-m", "debugpy.adapter" }
        else
          local require_ok, server_config = pcall(require, "plugins.lsp.settings." .. server_name)
          if require_ok then
            server_opts = vim.tbl_deep_extend("force", server_config, server_opts)
          end
        end

        lspconfig[server_name].setup(server_opts)
      end,
    })
  end,
}