return {
    {
        'nvim-telescope/telescope.nvim',
        -- pull a specific version of the plugin
        -- tag = '0.1.8',
        dependencies = {
            -- general purpose plugin used to build user interfaces in neovim plugins
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'BurntSushi/ripgrep',
            'sharkdp/fd',
            'nvim-telescope/telescope-live-grep-args.nvim',
        },
        config = function()
            -- get access to telescopes built in functions
            local builtin = require('telescope.builtin')

            -- set a vim motion to <Space> + f + f to search for files by their names
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "[F]ind [F]iles"})
            -- set a vim motion to <Space> + f + g to search for files based on the text inside of them
            -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "[F]ind by [G]rep"})
            vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",{desc = "[F]ind by [G]rep"})
            -- set a vim motion to <Space> + f + d to search for Code Diagnostics in the current project
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
            -- set a vim motion to <Space> + f + r to resume the previous search
            vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]inder [R]esume' })
            -- set a vim motion to <Space> + f + . to search for Recent Files
            vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
            -- set a vim motion to <Space> + f + b to search Open Buffers
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind Existing [B]uffers' })
            -- set a vim motion to <Space> + f + w to search for the word the cursor is hover
            vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind Word under Cursor" })
            -- set a vim motion to <Space> + f + s to search for the coding symbols in the current document
            vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "[F]ind coding [s]ymbols" })
            -- Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
            vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "[g]it [c]ommits"})
            -- Lists buffer's git commits with diff preview and checks them out on <cr>
            vim.keymap.set("n", "<leader>go", builtin.git_bcommits, { desc = "[g]it [o]pened file commits"})
            -- Lists all branches with log preview, checkout action <cr>, track action <C-t>, rebase action<C-r>, create action <C-a>, switch action <C-s>, delete action <C-d> and merge action <C-y>
            vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "[g]it [b]ranches"})

            -- set a vim motion to <Space> + f + t to search for the files containing tags. They start with "- tags: ["
            -- vim.keymap.set("n", "<leader>ft", ":lua require('telescope').extensions.live_grep_args.live_grep_args({vimgrep_arguments={'rg tags'} })<CR>" , { desc = "[F]ind [t]ags"})
            -- vim.keymap.set("n", "<leader>ft", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>" , { desc = "[F]ind [t]ags"})

            -- load live_grep_args extension to search grep by type
            require("telescope").load_extension("live_grep_args")
        end,
        -- opts = function(_, opts)
        --   local actions = require("telescope.actions")
        --
        --       opts.defaults.mappings.i["<M-S-Left>"] = actions.results_scrolling_left;
        --       opts.defaults.mappings.i["<M-S-Right>"] = actions.results_scrolling_right;
        --       opts.defaults.mappings.i["<M-S-Up>"] = actions.results_scrolling_up;
        --       opts.defaults.mappings.i["<M-S-Down>"] = actions.results_scrolling_down;
        --
        --       return opts;
        -- end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            -- get access to telescopes navigation functions
            local actions = require("telescope.actions")

            -- get access to live grep actions
            local lga_actions = require("telescope-live-grep-args.actions")

            require("telescope").setup({
                defaults = {
                    layout_config = {
                                        anchor = "center",
                                        height = 0.8,
                                        width = 0.9,
                                        preview_width = 0.6,
                                        prompt_position = "bottom",
                                    },
                    -- set keymappings to navigate through items in the telescope io
                    mappings = {
                        i = {
                             -- use <cltr> + n to go to the next option
                            -- ["<C-n>"] = actions.cycle_history_next,
                            -- use <cltr> + p to go to the previous option
                            -- ["<C-p>"] = actions.cycle_history_prev,
                            -- use <cltr> + j to go to the next preview
                            ["<C-j>"] = actions.cycle_history_next,
                            -- use <cltr> + k to go to the previous preview
                            ["<C-k>"] = actions.cycle_history_prev,
                        }
                    },
                    file_ignore_patterns = {
                      "node_modules",
                      "target"
                    }
                },
                -- use ui-select dropdown as our ui
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    },

                    live_grep_args = {
                          auto_quoting = true, -- enable/disable auto-quoting
                          -- define mappings, e.g.
                          mappings = { -- extend mappings
                            i = {
                              ["<C-j>"] = lga_actions.quote_prompt(),
                              ["<C-k>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                              -- freeze the current list and start a fuzzy search in the frozen list
                              ["<C-space>"] = lga_actions.to_fuzzy_refine,
                            },
                          }
                    }
                },
            --     -- Set theme
            --     pickers = {
            --       find_files = {
            --         theme = "dropdown",
            --       }
            --     },
                -- load the ui-select extension
                require("telescope").load_extension("ui-select")
            })
        end
    }
}
