return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        -- ts-autotag utilizes treesitter to understand the code structure to automatically close tsx tags
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
    -- when the plugin builds run the TSUpdate command to ensure all our servers are installed and updated
    build = ':TSUpdate',
    config = function()
        -- gain access to the treesitter config functions
        local ts_config = require("nvim-treesitter")

        -- enable folding with option of foldlevel equals to 99 to show everything expanded by default
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.opt.foldlevel = 99

        -- call the treesitter setup function with properties to configure our experience
        ts_config.setup({
            -- make sure highlighting it enabled
            highlight = {enable = true},
            -- enable tsx auto closing tag creation
            autotag = { enable = true },
            -- enable indentation
            indent = {enable = true},
        })
        -- parsers are installed in ~/.local/share/nvim/site/parser/ as '.so' libraries
        require('nvim-treesitter').install {'vim', 'vimdoc', 'lua', 'java', 'javascript', 'typescript', 'html', 'css', 'json', 'tsx', 'markdown', 'markdown_inline', 'gitignore', 'yaml', 'bash', 'dockerfile', 'c_sharp','xml'}
    end
}
