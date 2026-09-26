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
				ensure_installed = { "lua_ls", "ts_ls", "jdtls", "sqls", "copilot" },
			})
		end,
	},
	-- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed
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
            -- GET GLOBAL CAPABILITIES WITHOUT THE DEPRECATED REQUIRE('LSPCONFIG')
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- ── PURE NEOVIM 0.11+ SERVER REGISTRATION VIA VIM.LSP.CONFIG ──
            -- 1. Apply capabilities globally using the default config wildcard '*'
            vim.lsp.config("*", { capabilities = capabilities })

			-- 2. Setup standard servers
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("sqls")

			-- 3. Configure Yamlls with settings tables
			vim.lsp.config("yamlls", {
				settings = {
					yaml = {
						schemas = {
							kubernetes = "*k8*.yaml",
						},
					},
				},
			})
            vim.lsp.enable("yamlls")

            -- 4. Configure HTML with filetypes
            vim.lsp.config("html", {
                filetypes = { "html" },
            })

            vim.lsp.enable("html")

			-- 5. Configure copilot natively
			vim.lsp.config("copilot", {
				cmd = { "copilot-language-server", "--stdio" },
				root_markers = { ".git" },
				filetypes = { "javascript", "typescript", "typescriptreact", "python", "lua" , "java" , "yaml","json", "html", "sh", "markdown", "markdown.mdx" },
				init_options = {
					editorInfo = {
						name = "Neovim",
						version = tostring(vim.version()),
					},
					editorPluginInfo = {
						name = "nvim-lspconfig",
						version = "1.0"
					},
				},
			})
			vim.lsp.enable("copilot")
			-- ───────────────────────────────────────────────────────────────

            -- 1. Enable Neovim's native inline ghost text completion engine
			if vim.lsp.inline_completion then
				vim.lsp.inline_completion.enable()
			end

			-- 2. Map 'Alt + a' to accept the native ghost text suggestion
			vim.keymap.set("i", "<M-a>", function()
				if vim.lsp.inline_completion then
					vim.lsp.inline_completion.get()
				end
			end, { desc = "Accept Copilot Inline Suggestion" })

			-- Your standard workspace navigation mappings remain completely untouched below
			vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[c]ode [h]over Documentation" })
			vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[c]ode Goto [d]efinition" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ctions" })
			vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[c]ode Goto [r]references" })
			vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "[c]ode Goto [i]mplementations" })
			vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[c]ode [R]ename" })
			vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[c]ode Goto [D]eclaration" })
		end,
	},
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
          "williamboman/mason.nvim",
          "nvimtools/none-ls.nvim",
        },
        config = function()
          require("mason-null-ls").setup({
              ensure_installed = { "prettier", "stylua", "eslint_d", "jq","google-java-format" },
              automatic_installation = true
          })
        end,
    },
}
