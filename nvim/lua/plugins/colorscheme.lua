return {
    -- Shortened Github Url
    "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- Make sure to set the color scheme when neovim loads and configures the kanagawa plugin
        vim.cmd.colorscheme "vague"
    end
}
