
vim.pack.add({"https://github.com/L3MON4D3/LuaSnip"})

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets" } })
