vim.pack.add({ "https://github.com/catppuccin/nvim" })
vim.pack.add({ "https://github.com/sainnhe/gruvbox-material" })
vim.pack.add({ "https://github.com/sainnhe/everforest" })
vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })
vim.pack.add({ "https://github.com/rebelot/kanagawa.nvim" })
vim.pack.add({ "https://github.com/shaunsingh/nord.nvim" })

vim.cmd.colorscheme("catppuccin")

require("kanagawa").setup({
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none",
                },
            },
        },
    },
})
