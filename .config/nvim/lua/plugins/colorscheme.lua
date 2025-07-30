return {
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent_background = true,
	-- 		styles = {
	-- 			loops = { "italic" },
	-- 			functions = { "italic" },
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("catppuccin").setup(opts)
	-- 		vim.cmd([[colorscheme catppuccin-mocha]])
	-- 	end,
	-- },

	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	priority = 1000,
	-- 	enabled = true,
	-- 	opts = {
	-- 		theme = "lotus",
	-- 		transparent = true,
	-- 		styles = {
	-- 			loops = { "italic" },
	-- 			functions = { "italic" },
	-- 		},
	-- 		colors = {
	-- 			theme = {
	-- 				all = {
	-- 					ui = {
	-- 						bg_gutter = "none",
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("kanagawa").setup(opts)
	-- 		vim.cmd([[colorscheme kanagawa-dragon]])
	-- 	end,
	-- },

	{
		"rose-pine/neovim",
		name = "rose-pine",
		enabled = true,
		opts = {
			styles = {
				transparency = true,
			},
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd("colorscheme rose-pine")
		end,
	},
}
