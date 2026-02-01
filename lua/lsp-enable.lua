-- Enable LSP servers using vim.lsp.enable (Neovim 0.11+)

-- Enable all configured LSP servers
local servers = {
	'lua_ls',
	'ts_ls',
	'tailwindcss',
	'eslint',
	'cssls',
	'jsonls',
	'pyright',
	'rust_analyzer',
	'gopls',
	'clangd',
	'bashls',
	'jdtls',
	'emmet_language_server',
}

-- Enable each server
for _, server in ipairs(servers) do
	vim.lsp.enable(server)
end

return {}
