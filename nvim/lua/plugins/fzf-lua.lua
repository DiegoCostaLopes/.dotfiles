return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
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
        vim.keymap.set("n", "<leader>fn", function()
            fzf.files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[F]ind [N]eovim Config Files" })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("fzf-lsp-attach", { clear = true }),
            callback = function(event)
                vim.keymap.set("n", "<leader>gd", fzf.lsp_definitions, { desc = "[G]o to [D]efinition" })
                vim.keymap.set("n", "<leader>gT", fzf.lsp_typedefs, { desc = "[G]o to [T]ype Definition" })
                vim.keymap.set("n", "<leader>gD", fzf.lsp_declarations, { desc = "[G]o to [D]eclaration" })
                vim.keymap.set("n", "<leader>gi", fzf.lsp_implementations, { desc = "[G]o to [I]mplementation" })
                vim.keymap.set("n", "<leader>ga", fzf.lsp_code_actions, { desc = "[G]o to Code [A]ction" })
                vim.keymap.set("n", "<leader>gr", fzf.lsp_references, { desc = "[G]o to [R]eferences" })
                vim.keymap.set("n", "<leader>fs", fzf.lsp_document_symbols, { desc = "[F]ind Document [S]ymbols" })
                vim.keymap.set("n", "<leader>fS", fzf.lsp_workspace_symbols, { desc = "[F]ind Workspace [S]ymbols" })
            end,
        })
    end,
}

-- :lua require('fzf-lua').files()
