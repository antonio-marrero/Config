return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- ui plugins to make debugging simplier
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio"
    },
    config = function()
        -- gain access to the dap plugin and its functions
        local dap = require("dap")
        -- gain access to the dap ui plugin and its functions
        local dapui = require("dapui")

        -- Setup the dap ui with default configuration
        dapui.setup()

         -- setup an event listener for when the debugger is launched
        dap.listeners.before.launch.dapui_config = function()
            -- when the debugger is launched open up the debug ui
            dapui.open()
        end

        -- set a vim motion for <Space> + d + t to toggle a breakpoint at the line where the cursor is currently on
        vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebug [t]oggle Breakpoint" })

        vim.keymap.set("n", "<leader>dr", dap.clear_breakpoints, {desc = "[D]ebug [r]emove Breakpoints"})

        -- set a vim motion for <Space> + d + s to start the debugger and launch the debugging ui
        vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "[D]ebug [s]tart" })

        -- set a vim motion to open  the debugging ui
        vim.keymap.set("n", "<leader>duo", dapui.open, {desc = "[D]ebug [U]i [o]pen"})

        -- set a vim motion to close the debugging ui
        vim.keymap.set("n", "<leader>duc", dapui.close, {desc = "[D]ebug [U]i [c]lose"})
 
        vim.keymap.set("n", "<leader>dk", dap.terminate, { desc = "[D]ebug [k]ill" })

        vim.keymap.set("n", "<leader>di", dap.repl.open, { desc = "[D]ebug [i]nspect" })

        vim.keymap.set("n", "<leader>d5", dap.step_into, {desc = "[D]ebug F[5] Step Into"})

        vim.keymap.set("n", "<leader>d6", dap.step_over, {desc = "[D]ebug F[6] Step Over"})

        vim.keymap.set("n", "<leader>d7", dap.step_out, {desc = "[D]ebug F[7] Step Out"})

        vim.keymap.set("n", "<leader>d8", dap.continue, {desc = "[D]ebug F[8] Continue"})

    end
}
