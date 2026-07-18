return {
	"theHamsta/nvim-dap-virtual-text",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("nvim-dap-virtual-text").setup({
                enabled_commands = false,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                highlight_new_as_changed = true,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                show_stop_reason = true,               -- show stop reason when stopped for exceptions
                commented = true,                     -- prefix virtual text with comment string
                only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
                all_references = true,                -- show virtual text on all all references of the variable (not only definitions)
                clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
                -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
                virt_text_pos = 'inline',
                -- experimental features:
                -- all_frames = true,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
                -- virt_lines = true,                    -- show virtual lines instead of virtual text (will flicker!)
                -- virt_text_win_col = 80                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                                       -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
        })
	end,
}
