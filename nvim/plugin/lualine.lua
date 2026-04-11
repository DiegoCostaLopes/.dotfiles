vim.pack.add({
    "https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
    theme = "everforest",
})

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- config = function()
    -- 	require("lualine").setup({
    -- 		options = {
    -- 			theme = "nord",
    -- 		},
    -- 	})
    -- end,
    opts = {
        options = {
            theme = "catppuccin",
        },
    },
}
