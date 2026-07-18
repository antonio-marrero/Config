return {
	{
		"williamboman/mason.nvim",
		config = function()
			-- setup mason with default properties
			require("mason").setup()
		end,
	},
	-- mason lsp config utilizes mason to automatically ensure lsp servers you want installed are installed
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			-- ensure that we have lua language server, typescript launguage server, java language server, and java test language server are installed
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "jdtls", "sqls" },
			})
		end,
	},
	-- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed, mason-lspconfig will not automatically install debug adapters for us
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			-- ensure the java debug adapter is installed
			require("mason-nvim-dap").setup({
				ensure_installed = { "java-debug-adapter", "java-test" },
                automatic_installation = true
			})
		end,
	},
	-- utility plugin for configuring the java language server for us
	{
		"mfussenegger/nvim-jdtls",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- get access to the lspconfig plugins functions
			-- local lspconfig = require("lspconfig")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- setup the lua language server
			-- lspconfig.lua_ls.setup({
			-- 	capabilities = capabilities,
			-- })
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})

			-- setup the typescript language server
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
			})

			-- configure yamlls ls. Files containing k8 are considered that follow kubernetes schemas:
			vim.lsp.config("yamlls", {
				capabilities = capabilities,
				settings = {
					yaml = {
						schemas = {
							kubernetes = "*k8*.yaml",
							-- ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
							-- ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
							-- ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
							-- ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
							-- ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
							-- ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
							-- ["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
						},
					},
				},
			})

			-- setup the sqls language server
			vim.lsp.config("sqls", {
				capabilities = capabilities,
			})

			-- Set vim motion for <Space> + c + h to show code documentation about the code the cursor is currently over if available
			vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [h]over Documentation" })
			-- Set vim motion for <Space> + c + d to go where the code/variable under the cursor was defined
			vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [d]efinition" })
			-- Set vim motion for <Space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [a]ctions" })
			-- Set vim motion for <Space> + c + r to display references to the code under the cursor
			vim.keymap.set(
				"n",
				"<leader>cr",
				require("telescope.builtin").lsp_references,
				{ desc = "[C]ode Goto [r]eferences" }
			)
			-- Set vim motion for <Space> + c + i to display implementations to the code under the cursor
			vim.keymap.set(
				"n",
				"<leader>ci",
				require("telescope.builtin").lsp_implementations,
				{ desc = "[C]ode Goto [i]mplementations" }
			)
			-- Set a vim motion for <Space> + c + <Shift>R to smartly rename the code under the cursor
			vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
			-- Set a vim motion for <Space> + c + <Shift>D to go to where the code/object was declared in the project (class file)
			vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
		end,
	},
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" }, -- formatters will be installed and started when a correspoding file is opened
        dependencies = {
          "williamboman/mason.nvim",
          "nvimtools/none-ls.nvim",
        },
        config = function()
          require("mason-null-ls").setup({
              ensure_installed = { "prettier", "stylua", "eslint_d", "jq","google-java-format" }, -- formatters and linters to install
              automatic_installation = true
          })
        end,
    },
}
