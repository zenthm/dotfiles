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
        "williamboman/mason.nvim",
        opts = {},
        event = "VeryLazy",
    },
    {
        "andweeb/presence.nvim",
        opts = {},
        event = "VeryLazy",
    },
}
