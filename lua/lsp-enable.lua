-- Enable LSP servers using vim.lsp.enable (Neovim 0.11+)

-- Enable all configured LSP servers
local servers = {
	'lua_ls',
	'ts_ls',
	'tailwindcss',
	'eslint',
	'html',
	'cssls',
	'jsonls',
	'pyright',
	'rust_analyzer',
	'gopls',
	'clangd',
	'bashls',
	'marksman',
	'jdtls',
	'sqls',
}

-- Enable each server
for _, server in ipairs(servers) do
	vim.lsp.enable(server)
end

return {}
