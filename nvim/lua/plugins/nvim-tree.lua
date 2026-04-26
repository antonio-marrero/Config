return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle [E]xplorer" })
		require("nvim-tree").setup({
			update_focused_file = {
				enable = true,
			},
			hijack_netrw = true,
			auto_reload_on_write = true,
            actions = {
                open_file = {
                    resize_window = false,
            }},
            view = {
                preserve_window_proportions = false,
            }
		})
	end,
}
