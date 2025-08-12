-- Performance optimizations for Neovim
-- Source: Modern Neovim best practices

-- Faster startup
vim.loader.enable()

-- Optimize providers
vim.g.loaded_ruby_provider = 0     -- Disable Ruby provider
vim.g.loaded_perl_provider = 0     -- Disable Perl provider
-- vim.g.loaded_python3_provider = 0  -- Keep Python enabled for plugins

-- Memory optimizations
vim.opt.updatetime = 250            -- Faster completion
vim.opt.timeoutlen = 300           -- Faster key sequence timeout
vim.opt.redrawtime = 10000         -- Allow more time for syntax highlighting

-- File handling optimizations
vim.opt.backup = false             -- Don't create backup files
vim.opt.writebackup = false        -- Don't create backup before overwriting
vim.opt.swapfile = false          -- Don't create swap files
vim.opt.undofile = true           -- But do create undo files

-- UI optimizations
-- vim.opt.lazyredraw = true      -- Disabled: conflicts with Noice plugin
vim.opt.ttyfast = true            -- Faster terminal
vim.opt.termguicolors = true      -- True color support

return {}
