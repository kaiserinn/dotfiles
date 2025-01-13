local servers = {
	pyright = {},
	html = {},
	emmet_ls = {},
	cssls = {},
	tailwindcss = {},
	ts_ls = {},
	svelte = {},
	clangd = {},
	volar = {},
	-- html = { filetypes = { 'html', 'twig', 'hbs'} },

	rust_analyzer = {
		-- Other Configs ...
		settings = {
			["rust-analyzer"] = {
				-- Other Settings ...
				procMacro = {
					ignored = {
						leptos_macro = {
							-- optional: --
							-- "component",
							"server",
						},
					},
				},
				check = {
					command = { "clippy" },
				},
			},
		},
	},

	lua_ls = {
		Lua = {
			workspace = {
				checkThirdParty = false,
				library = {
					-- vim.env.VIMRUNTIME,
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					-- [vim.fn.expand "~/.local/share/nvim/lazy"] = true,
				},
			},
			telemetry = { enable = false },
			-- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
			-- diagnostics = { disable = { 'missing-fields' } },
		},
	},
}

local on_attach = function(client, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { silent = true, buffer = bufnr, desc = desc })
	end

	nmap("<leader>ra", ":Lspsaga rename<CR>", "[R]e[n]ame")
	nmap("<leader>ca", ":Lspsaga code_action<CR>", "[C]ode [A]ction")

	nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<leader>k", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })

	nmap("<leader>fm", vim.lsp.buf.format, "Format current buffer")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local lspconfig = function()
	local mason_lspconfig = require("mason-lspconfig")

	mason_lspconfig.setup({
		ensure_installed = vim.tbl_keys(servers),
	})

	-- LSP settings (for overriding per client)
	local handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
	}

	vim.diagnostic.config({
		virtual_text = false,
		update_in_insert = false,
		float = { border = "rounded" },
	})

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.max_width = 80
		opts.max_height = 20
		return orig_util_open_floating_preview(contents, syntax, opts, ...)
	end

	mason_lspconfig.setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = servers[server_name],
				filetypes = (servers[server_name] or {}).filetypes,
				handlers = handlers,
			})
		end,
	})

	require("lspconfig")["hls"].setup({
		filetypes = { "haskell", "lhaskell", "cabal" },
	})
end

return {
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		event = "BufRead",
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {},
			},
			{
				"williamboman/mason-lspconfig.nvim",
				config = lspconfig,
			},
			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},
	},
	-- {
	--   'simrat39/rust-tools.nvim',
	--   dependencies = "neovim/nvim-lspconfig",
	--   config = function ()
	--     require('rust-tools').setup({
	--       server = {
	--         on_attach = on_attach,
	--         capabilities = capabilities,
	--       },
	--     })
	--   end
	-- }
}
