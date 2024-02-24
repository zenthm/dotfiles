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
        config = function(_, opts)
            require("neodev")

            local lspconfig = require("lspconfig")
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

            lsp_capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            }

            lspconfig.clangd.setup({
                capabilities = lsp_capabilities,
            })
            lspconfig.cmake.setup({
                capabilities = lsp_capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = lsp_capabilities,
            })
            lspconfig.html.setup({
                capabilities = lsp_capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = lsp_capabilities,
            })
            lspconfig.ruby_ls.setup({
                capabilities = lsp_capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = lsp_capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = lsp_capabilities,
            })
        end,
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
                "rust_analyzer",
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
                    "rust",
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
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        opts = {},
        config = function(_, opts)
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            local select_opts = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "luasnip" },
                },
                mapping = {
                    ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
                    ["<Down>"] = cmp.mapping.select_next_item(select_opts),
                    ["<Esc>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm(),
                },
            })
        end,
        event = { "BufNewFile", "BufReadPre", "VeryLazy" },
    },
    {
        "folke/neodev.nvim",
        dependencies = { "hrsh7th/nvim-cmp" },
        opts = {},
        event = { "BufNewFile", "BufReadPre", "VeryLazy" },
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        "simrat39/rust-tools.nvim",
        dependencies = "neovim/nvim-lspconfig",
        ft = "rust",
        config = function(_, opts)
            require("rust-tools").setup(opts)
        end
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
    {
        "windwp/nvim-autopairs",
        opts = {},
        event = { "InsertEnter", "VeryLazy" },
    },
    {
        "kylechui/nvim-surround",
        opts = {},
        event = { "BufNewFile", "BufReadPre", "VeryLazy" },
    },
}
