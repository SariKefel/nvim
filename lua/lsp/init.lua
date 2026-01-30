-- LSP Configuration using new vim.lsp.config API (Neovim 0.11+)
-- Placed in lua/lsp/ so Neovim can auto-discover them

-- Global settings for ALL servers
vim.lsp.config('*', {
	root_markers = { '.git' },
	capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Lua Language Server
vim.lsp.config('lua_ls', {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			completion = { callSnippet = 'Replace' },
			workspace = { checkThirdParty = false },
		},
	},
})

-- TypeScript/JavaScript
vim.lsp.config('ts_ls', {
	cmd = { 'typescript-language-server', '--stdio' },
	filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
	root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
})

-- Tailwind CSS
vim.lsp.config('tailwindcss', {
	cmd = { 'tailwindcss-language-server', '--stdio' },
	filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
	root_markers = { 'tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', '.git' },
})

-- ESLint
vim.lsp.config('eslint', {
	cmd = { 'vscode-eslint-language-server', '--stdio' },
	filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
	root_markers = { '.eslintrc.js', '.eslintrc.json', 'eslint.config.js', 'package.json', '.git' },
})

-- HTML
vim.lsp.config('html', {
	cmd = { 'vscode-html-language-server', '--stdio' },
	filetypes = { 'html' },
	root_markers = { '.git' },
})

-- CSS
vim.lsp.config('cssls', {
	cmd = { 'vscode-css-language-server', '--stdio' },
	filetypes = { 'css', 'scss', 'less' },
	root_markers = { '.git' },
})

-- JSON
vim.lsp.config('jsonls', {
	cmd = { 'vscode-json-language-server', '--stdio' },
	filetypes = { 'json', 'jsonc' },
	root_markers = { '.git' },
})

-- Python
vim.lsp.config('pyright', {
	cmd = { 'pyright-langserver', '--stdio' },
	filetypes = { 'python' },
	root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
})

-- Rust
vim.lsp.config('rust_analyzer', {
	cmd = { 'rust-analyzer' },
	filetypes = { 'rust' },
	root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
})

-- Go
vim.lsp.config('gopls', {
	cmd = { 'gopls' },
	filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
	root_markers = { 'go.work', 'go.mod', '.git' },
})

-- C/C++
vim.lsp.config('clangd', {
	cmd = { 'clangd' },
	filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
	root_markers = { '.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json', 'compile_flags.txt', '.git' },
})

-- Bash
vim.lsp.config('bashls', {
	cmd = { 'bash-language-server', 'start' },
	filetypes = { 'sh' },
	root_markers = { '.git' },
})

-- Markdown
vim.lsp.config('marksman', {
	cmd = { 'marksman', 'server' },
	filetypes = { 'markdown', 'markdown.mdx' },
	root_markers = { '.marksman.toml', '.git' },
})

-- Java
vim.lsp.config('jdtls', {
	cmd = { 'jdtls' },
	filetypes = { 'java' },
	root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' },
})

-- SQL
vim.lsp.config('sqls', {
	cmd = { 'sqls' },
	filetypes = { 'sql', 'mysql' },
	root_markers = { '.git' },
})

return {}
