return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			code_action = {
				show_server_name = true,
			},
			lightbulb = {
				enable = false,
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	event = "LspAttach",
}
