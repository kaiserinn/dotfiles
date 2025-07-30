return {
	"nvim-tree/nvim-tree.lua",
	enabled = false,
	version = "*",
	lazy = true,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.set("n", "l", function()
				api.node.open.edit(nil, { quit_on_open = true })
			end, opts("Edit Or Open"))
			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Collapse Parent"))
			vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
		end,
	},
	keys = {
		{
			"<leader>n",
			function()
				require("nvim-tree.api").tree.toggle({
					current_window = true,
					find_file = true,
				})
			end,
			desc = "NvimTree: Toggle tree",
			silent = true,
		},
	},
}
