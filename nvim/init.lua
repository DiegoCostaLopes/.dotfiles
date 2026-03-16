-- Diego Lopes - Personal config

require("config.colorschemes")
require("config.options")
require("config.keymaps")
require("config.autocmds")
-- lsp needs to come after plugin loads because it requires fzf-lua
require("config.lsp")

-- not needed because plugin/ folder is loaded automagically
-- require("plugin")

-- apply colorscheme and correct some highlight groups
vim.api.nvim_set_hl(0, "WhichKeyNormal", { link = "Normal" })
vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "Normal" })
vim.cmd.hi("Comment gui=none")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
