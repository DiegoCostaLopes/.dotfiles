-- Diego Lopes - Personal config

require("config.colorschemes")
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lsp")

-- apply colorscheme and correct some highlight groups
vim.api.nvim_set_hl(0, "WhichKeyNormal", { link = "Normal" })
vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "Normal" })
vim.cmd.hi("Comment gui=none")
