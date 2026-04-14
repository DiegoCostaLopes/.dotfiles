local state = {
    floating = {
        buf = -1,
        win = -1,
    },
}

local function create_floating_terminal(opts)
    local buf
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
        -- vim.api.nvim_open_term(buf, {})
    end

    local columns = vim.o.columns
    local lines = vim.o.lines

    local width = opts.width or math.floor(columns * 0.8)
    local height = opts.height or math.floor(lines * 0.8)

    local pos_col = math.floor((columns - width) / 2)
    local pos_line = math.floor((lines - height) / 2)

    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        row = pos_line,
        col = pos_col,
        style = "minimal",
        border = "rounded",
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)
    return { buf = buf, win = win }
end

vim.api.nvim_create_user_command("FloatingTerminal", function()
    create_floating_terminal({})
end, {})

vim.keymap.set("n", "<Space>tt", function()
    if vim.api.nvim_win_is_valid(state.floating.win) then
        vim.api.nvim_win_hide(state.floating.win)
    else
        state.floating = create_floating_terminal({ buf = state.floating.buf })
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.term()
            vim.cmd("startinsert")
        end
    end
end, { desc = "Creates a floating terminal" })
