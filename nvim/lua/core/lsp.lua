vim.lsp.enable({
    "lua_ls",
    "fortls",
    "pyright",
    "texlab",
    "marksman",
})

vim.diagnostic.config({
    virtual_lines = true,
    -- virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        local fzf = require("fzf-lua")

        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
        vim.keymap.set("n", "<leader>ld", fzf.lsp_definitions, { desc = "[G]o to [D]efinition" })
        vim.keymap.set("n", "<leader>lT", fzf.lsp_typedefs, { desc = "[G]o to [T]ype Definition" })
        vim.keymap.set("n", "<leader>lD", fzf.lsp_declarations, { desc = "[G]o to [D]eclaration" })
        vim.keymap.set("n", "<leader>li", fzf.lsp_implementations, { desc = "[G]o to [I]mplementation" })
        vim.keymap.set("n", "<leader>la", fzf.lsp_code_actions, { desc = "[G]o to Code [A]ction" })
        vim.keymap.set("n", "<leader>lR", fzf.lsp_references, { desc = "[G]o to [R]eferences" })
        vim.keymap.set("n", "<leader>fs", fzf.lsp_document_symbols, { desc = "[F]ind Document [S]ymbols" })
        vim.keymap.set("n", "<leader>fS", fzf.lsp_workspace_symbols, { desc = "[F]ind Workspace [S]ymbols" })

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                end,
            })
        end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            vim.keymap.set("n", "<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, { desc = "[T]oggle Inlay [H]ints" })
        end
    end,
})
