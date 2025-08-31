return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    lazy = false,
    opts = {},
    config = function()
        local fzf = require("fzf-lua")
        vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "[ ] Find existing buffers" })
        vim.keymap.set("n", "<leader>fg", fzf.global, { desc = "[F]ind [G]lobal" })
        vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "[F]ind [F]iles" })
        vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "[F]ind [H]elp tags" })
        vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "[F]ind [K]eymaps" })
        vim.keymap.set("n", "<leader>fw", fzf.grep_project, { desc = "[F]ind [W]ord" })
        vim.keymap.set("n", "<leader>fd", fzf.diagnostics_workspace, { desc = "[F]ind [D]iagnostics" })
        vim.keymap.set("n", "<leader>ft", fzf.tags, { desc = "Find tags" })
        vim.keymap.set("n", "<leader>fn", function()
            fzf.files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[F]ind [N]eovim Config Files" })
    end,
}
