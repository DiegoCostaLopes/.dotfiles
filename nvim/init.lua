-- Diego Lopes - Personal config

require("config.colorschemes")
require("config.options")
require("config.keymaps")
require("config.autocmds")

require("plugins.treesitter")
require("plugins.fzf-lua")
require("plugins.which-key")
require("plugins.extras")
require("plugins.blink")
require("plugins.conform")
require("plugins.luasnip")
require("plugins.lualine")
require("plugins.lazydev")
require("plugins.gitsigns")
require("plugins.nvim-lint")
require("plugins.todo-comments")

require("config.lsp")
-- apply colorscheme and correct some highlight groups
vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, "WhichKeyNormal", { link = "Normal" })
vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "Normal" })
vim.cmd.hi("Comment gui=none")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
