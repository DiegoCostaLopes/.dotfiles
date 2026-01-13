return { -- Collection of various small independent plugins/modules
    {
        "nvim-mini/mini.nvim",
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            --  - ci'  - [C]hange [I]nside [']quote
            require("mini.ai").setup({ n_lines = 500 })
            require("mini.pairs").setup({
                skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
                skip_unbalanced = true,
                -- MiniPairs.map("i", "<", { action = "open", pair = "<>", register = { cr = false } }),
                -- Insert `<>` pair if `<` is typed at line start, don't register for <CR>
                mappings = {
                    ["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },
                    [">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
                },
            })

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require("mini.surround").setup()

            -- Adding functionality for mini.pairs
            local map_tex = function()
                MiniPairs.map_buf(0, "i", "$", { action = "closeopen", pair = "$$" })
            end
            vim.api.nvim_create_autocmd("FileType", { pattern = "tex", callback = map_tex })
        end,
    },
}
