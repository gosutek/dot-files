local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


require("lazy").setup({
    spec = {
        {
            'mikesmithgh/kitty-scrollback.nvim',
            enabled = true,
            lazy = true,
            cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
            event = { 'User KittyScrollbackLaunch' },
            config = function()
                require('kitty-scrollback').setup()
            end,
        },
        {
            'saghen/blink.cmp',
            version = '1.10.2',
            opts = {
                keymap = { preset = 'default' },

                completion = { documentation = { auto_show = false } },

                sources = {
                    default = { 'lsp' },
                },
            },
        },
        {
            'nvim-treesitter/nvim-treesitter',
            branch = 'main',
            lazy = false,
            build = ':TSUpdate',
            config = function ()
                require('nvim-treesitter').install({ 'c', 'cpp', 'cuda' })

                vim.api.nvim_create_autocmd('FileType', {
                    pattern = { 'c', 'cpp', 'cuda' },
                    callback = function ()
                        vim.treesitter.start()
                    end,
                })
            end,
        },
        {
            'wnkz/monoglow.nvim',
            lazy = false,
            priority = 1000,
            opts = {},
        },
        {
            'mason-org/mason.nvim',
            opts = {},
        }
    },
})

vim.o.clipboard = 'unnamedplus'

vim.o.number = true
vim.o.relativenumber = true

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'
vim.o.scrolloff = 8
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.cursorline = true

vim.o.undofile = true
vim.o.updatecount = 250

vim.o.list = true

vim.o.makeprg = 'cmake --build build/$*/'

vim.keymap.set({'n', 'x'}, '<C-d>', '<C-d>zz')
vim.keymap.set({'n', 'x'}, '<C-u>', '<C-u>zz')

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', 'init.lua', '.git' },
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
                library = { vim.env.VIMRUNTIME },
                checkThirdParty = false,
            },
        },
    },
})

vim.lsp.config('clangd', {
    cmd = { 'clangd', '--background-index', '--header-insertion=never', '--completion-style=detailed'},
    filetypes = { 'c', 'cuda', 'cpp' },
    root_markers = { 'compile_commands.json', '.clangd', 'CMakePresets.json', '.git' },
})

vim.lsp.config('taplo', {
    cmd = { 'taplo', 'lsp', 'stdio' },
    filetypes = { 'toml' },
    root_markers = { '.taplo.toml', 'taplo.toml', '.git' },
})

vim.lsp.enable({'lua_ls', 'clangd', 'taplo'})
vim.diagnostic.config({ virtual_text = true })

vim.cmd('colorscheme monoglow-z')
