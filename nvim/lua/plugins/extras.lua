
vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-mini/mini.nvim",
})

require("mini.ai").setup({ n_lines = 500 })
require("mini.pairs").setup({
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    skip_unbalanced = true,
    -- MiniPairs.map("i", "<", { action = "open", pair = "<>", register = { cr = false } }),
    -- Insert `<>` pair if `<` is typed at line start, don't register for <CR>
    -- mappings = {
    --     ["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },
    --     [">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
    -- },
})

-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
require("mini.surround").setup()

MiniPairs = require("mini.pairs")
local map_tex = function()
    MiniPairs.map_buf(0, "i", "$", { action = "closeopen", pair = "$$" })
end
vim.api.nvim_create_autocmd("FileType", { pattern = "tex", callback = map_tex })
