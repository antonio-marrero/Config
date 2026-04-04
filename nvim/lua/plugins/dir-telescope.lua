return {
	"princejoogie/dir-telescope.nvim",
	-- telescope.nvim is a required dependency
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
        -- It runs telescope finding a directory and then finding the file inside that directory 
		vim.keymap.set("n", "<leader>fp", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true,desc ="[F]ind By Grep in a [P]ointer" })
		vim.keymap.set("n", "<leader>fi", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true,desc ="[F]ind By File in a D[I]r" })
		require("dir-telescope").setup({
			-- these are the default options set
			hidden = true,
			no_ignore = false,
			show_preview = true,
			follow_symlinks = false,
		})
	end,
}
