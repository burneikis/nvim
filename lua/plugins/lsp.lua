return {
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			progress = {
				display = {
					render_limit = 5,
					done_ttl = 2,
				},
			},
			notification = {
				window = {
					winblend = 0,
				},
			},
		},
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"vtsls",
					"pyright",
					"eslint",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- Formatters
					"stylua",
					"prettier",
					"black",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			"mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- LSP keymaps on attach
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					local map = function(keys, func, desc) vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc }) end

					map("gd", function() require("telescope.builtin").lsp_definitions() end, "Go to definition")
					map("gD", vim.lsp.buf.declaration, "Go to declaration")
					map("gi", function() require("telescope.builtin").lsp_implementations() end, "Go to implementation")
					map("gr", function() require("telescope.builtin").lsp_references() end, "Go to references")
					map("K", vim.lsp.buf.hover, "Hover documentation")
					-- map("<leader>ca", vim.lsp.buf.code_action, "Code action")
					-- map("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
					-- map("<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
					map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
					map("]d", vim.diagnostic.goto_next, "Next diagnostic")

					-- ESLint auto-fix on save
					if client and client.name == "eslint" then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = event.buf,
							callback = function()
								if vim.fn.exists(":EslintFixAll") > 0 then
									vim.cmd("EslintFixAll")
								end
							end,
						})
					end
				end,
			})

			-- Configure servers using vim.lsp.config (Neovim 0.11+)
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})

			vim.lsp.config("vtsls", {
				capabilities = capabilities,
			})

			vim.lsp.config("pyright", {
				capabilities = capabilities,
			})

			vim.lsp.config("eslint", {
				capabilities = capabilities,
			})

			-- Enable configured servers
			vim.lsp.enable({ "lua_ls", "vtsls", "pyright", "eslint" })

			-- Diagnostic signs
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
				},
				float = {
					border = "rounded",
				},
				severity_sort = true,
			})
		end,
	},
}
