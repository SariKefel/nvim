return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm", -- Available styles: night, storm, day, moon
        transparent = true, -- Enable transparent background
        terminal_colors = true, -- Set terminal colors
      })
      vim.cmd([[colorscheme tokyonight]]) -- Apply the colorscheme
    end,
  },
}
