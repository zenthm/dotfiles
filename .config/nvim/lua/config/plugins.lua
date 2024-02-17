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
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        event = "VimEnter",
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
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
}
