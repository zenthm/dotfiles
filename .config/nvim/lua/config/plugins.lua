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
        "nvim-tree/nvim-tree.lua",
        opts = {
            hijack_cursor = true,
        },
        event = "VeryLazy",
    },
}
