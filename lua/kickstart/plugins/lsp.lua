-- Modern LSP Configuration for Neovim 0.11+
-- Uses vim.lsp.config instead of require('lspconfig')

return {
	{
		-- lazydev configures Lua LSP for Neovim config
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- Mason for installing LSP servers, formatters, linters
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		-- Auto-install LSP tools
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				-- LSP Servers (using Mason package names)
				"lua-language-server",
				"typescript-language-server",
				"tailwindcss-language-server",
				"eslint-lsp",
				"html-lsp",
				"css-lsp",
				"json-lsp",
				"pyright",
				"rust-analyzer",
				"gopls",
				"clangd",
				"bash-language-server",
				"marksman",
				"jdtls",
				"sqls",
				-- Formatters
				"stylua",
				"prettierd",
				"black",
				"clang-format",
			},
		},
	},
	{
		-- Useful status updates for LSP
		"j-hui/fidget.nvim",
		opts = {},
	},
}
