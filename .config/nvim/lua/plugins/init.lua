return {

  -- Git related plugins
  -- 'tpope/vim-fugitive',
  -- 'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  {
    'tpope/vim-sleuth',
    event = "BufReadPre",
  },

  -- Discord rich presence
  {
    'andweeb/presence.nvim',
    event = "BufRead",
  },

  -- colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        transparent_background = true,
        styles = {
          loops = { "italic" },
          functions = { "italic" },
        }
      })
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    event = 'BufReadPre',
    config = function()
      require('ibl').setup({
        exclude = {
          filetypes = { "dashboard" },
        },
      })
    end
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
    opts = {},
    keys = {
      { "gcc", mode = "n", desc = "Comment: toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment: toggle linewise" },
      { "gc", mode = "x", desc = "Comment: toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment: toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment: toggle blockwise" },
      { "gb", mode = "x", desc = "Comment: toggle blockwise (visual)" },
    },
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },

  {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    config = function()
      require('nvim-ts-autotag').setup({
        filetypes = { "html", "rust" }
      })
    end,
  },

  {
    "folke/persistence.nvim",
    -- event = "BufReadPre", -- this will only start session saving when an actual file was opened
    event = "VimEnter",
    config = function ()
      local opts = function (desc)
        return { desc = "Persistence: " .. desc }
      end

      -- restore the session for the current directory
      vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], opts("Load cwd's session"))

      -- restore the last session
      vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], opts('Load last session'))

      -- stop Persistence => session won't be saved on exit
      vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], opts('Stop session save'))

      require('persistence').setup()
    end
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "InsertEnter",
    opts = {},
    keys = { "ys", "ds", "cs" },
  },

  {
    "folke/flash.nvim",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x" }, function() require("flash").jump() end, desc = "Flash: Flash jump" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Flash: Remote Flash" },
      { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Flash: Toggle Flash Search" },
    },
  },

  {
    'Wansmer/treesj',
    -- event = "VeryLazy",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
    keys = { {'<space>m', desc = "Treesj: Toggle treesj"} },
  },
}
