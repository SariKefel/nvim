return {
	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({
				styles = {
					comments = { italic = false }, -- Disable italics in comments
				},
			})

			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			--vim.cmd.colorscheme 'tokyonight-night'
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				contrast = "hard", -- options: "hard", "soft", "medium"
				italic = {
					strings = false,
					comments = false,
					operators = false,
					folds = false,
				},
				overrides = {}, -- you can override specific highlights if you want
			})

			-- Load the colorscheme
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"oxfist/night-owl.nvim",
		priority = 1000, -- Load before all other plugins
		config = function()
			require("night-owl").setup({
				-- You can add customization options here if needed
				-- e.g., italic_comments = false
			})

			-- Set the colorscheme
			--vim.cmd.colorscheme("night-owl")

			-- Optional: make it transparent
			vim.cmd([[
        highlight Normal guibg=NONE ctermbg=NONE
        highlight NormalNC guibg=NONE ctermbg=NONE
        highlight Pmenu guibg=NONE ctermbg=NONE
        highlight PmenuSel guibg=NONE ctermbg=NONE
        highlight VertSplit guibg=NONE ctermbg=NONE
        highlight StatusLine guibg=NONE ctermbg=NONE
        highlight SignColumn guibg=NONE ctermbg=NONE
      ]])
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
