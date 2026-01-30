-- LSP keymaps and autocommands using LspAttach (Neovim 0.11+)

-- LspAttach autocmd for setting up keymaps when LSP attaches
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if not client then
			return
		end

		-- Helper function for keymaps
		local map = function(keys, func, desc, mode)
			mode = mode or 'n'
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end

		-- Jump to definition
		if client:supports_method('textDocument/definition') then
			map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
		end

		-- Find references
		if client:supports_method('textDocument/references') then
			map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
		end

		-- Jump to implementation
		if client:supports_method('textDocument/implementation') then
			map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
		end

		-- Jump to type definition
		if client:supports_method('textDocument/typeDefinition') then
			map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
		end

		-- Document symbols
		if client:supports_method('textDocument/documentSymbol') then
			map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
		end

		-- Workspace symbols
		if client:supports_method('workspace/symbol') then
			map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
		end

		-- Rename
		if client:supports_method('textDocument/rename') then
			map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
		end

		-- Code action
		if client:supports_method('textDocument/codeAction') then
			map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
		end

		-- Go to declaration
		if client:supports_method('textDocument/declaration') then
			map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
		end

		-- Toggle inlay hints
		if client:supports_method('textDocument/inlayHint') then
			map('<leader>th', function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, '[T]oggle Inlay [H]ints')
		end

		-- Document highlight on cursor hold
		if client:supports_method('textDocument/documentHighlight') then
			local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd('LspDetach', {
				group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = 'kickstart-lsp-highlight', buffer = event2.buf })
				end,
			})
		end
	end,
})

-- Diagnostic configuration
vim.diagnostic.config({
	severity_sort = true,
	float = { border = 'rounded', source = 'if_many' },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = '󰅚 ',
			[vim.diagnostic.severity.WARN] = '󰀪 ',
			[vim.diagnostic.severity.INFO] = '󰋽 ',
			[vim.diagnostic.severity.HINT] = '󰌶 ',
		},
	} or {},
	virtual_text = {
		source = 'if_many',
		spacing = 2,
		format = function(diagnostic)
			return diagnostic.message
		end,
	},
})

return {}
