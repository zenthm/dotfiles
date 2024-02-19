return {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
        priority = 1000,
    },
    {
        "nvimdev/dashboard-nvim",
        enabled = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        event = "VimEnter",
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "folke/which-key.nvim",
        config = function()
            local mappings = require("config.mappings")
            local wk = require("which-key")

            wk.setup()
            wk.register(mappings)
        end,
        event = "VeryLazy",
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            hijack_cursor = true,
            renderer = {
                root_folder_label = false,
            },
        },
        event = "VeryLazy",
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        event = "VeryLazy",
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                mode = "buffers",
                close_command = "Bdelete! %d",
                right_mouse_command = "Bdelete! %d",
                left_mouse_command = "buffer %d",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "center",
                    },
                },
            },
        },
        event = "VeryLazy",
    },
    {
        "famiu/bufdelete.nvim",
        dependencies = { "akinsho/bufferline.nvim" },
        event = "VeryLazy",
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufNewFile", "BufReadPre", "VeryLazy" },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function(_, opts)
            local null_ls = require("null-ls")

            null_ls.setup()
        end,
        event = { "BufNewFile", "BufReadPre", "VeryLazy" },
    },
    {
        "williamboman/mason.nvim",
        opts = {},
        event = "VeryLazy",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "clangd",
                "cmake",
                "cssls",
                "html",
                "lua_ls",
                "pyright",
                "ruby_ls",
                "tsserver",
            },
        },
        event = "VeryLazy",
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        opts = {
            ensure_installed = {
                "black",
                "ruff",
                "stylua",
            },
        },
        event = "VeryLazy",
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {},
        config = function(_, opts)
            require("nvim-treesitter").setup(opts)
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "cmake",
                    "cpp",
                    "css",
                    "html",
                    "javascript",
                    "lua",
                    "python",
                },
                highlight = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
                textobjects = {
                    select = {
                        enable = true,
                    },
                },
            })
        end,
        build = ":TSUpdate",
        event = { "BufNewFile", "BufReadPre", "VeryLazy" },
    },
    {
        "andweeb/presence.nvim",
        opts = {},
        event = "VeryLazy",
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
        event = { "BufNewFile", "BufReadPre", "VeryLazy" },
    },
    {
        "numToStr/Comment.nvim",
        opts = {},
        event = { "BufNewFile", "BufReadPre", "VeryLazy" },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        event = { "BufNewFile", "BufReadPre", "VeryLazy" },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {},
        main = "ibl",
        event = { "BufNewFile", "BufReadPre", "VeryLazy" },
    },
}
