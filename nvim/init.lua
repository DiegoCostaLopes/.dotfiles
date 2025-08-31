-- Diego Lopes - Personal config
-- Heavily inspired in kickstart-modular.nvim

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("core.lazy")
require("core.lsp")

-- apply colorscheme and correct some highlight groups
vim.cmd.colorscheme("gruvbox-material")
vim.api.nvim_set_hl(0, "WhichKeyNormal", { link = "Normal" })
vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "Normal" })

vim.cmd.hi("Comment gui=none")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
