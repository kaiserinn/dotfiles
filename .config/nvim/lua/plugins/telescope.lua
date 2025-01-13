local options = {
    defaults = {
      file_ignore_patterns = {
        "node_modules",
      },
    },
}

local configs = function(_, opts)
  -- Enable telescope fzf native, if installed
  pcall(require('telescope').load_extension, 'fzf')

  local map = function (key, func, desc)
    vim.keymap.set('n', key, func, { silent = true, desc = 'Telescope: ' .. desc } )
  end

  local builtin = require('telescope.builtin')
  map('<leader>ff', builtin.find_files, "Find files")
  map('<leader>gf', builtin.git_files, "Git files")
  map('<leader>fg', builtin.live_grep, "Live grep")
  map('<leader>km', builtin.keymaps, "Keymaps")

  require('telescope').setup(opts)
end

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  cmd = "Telescope",
  keys = {'<leader>ff', '<leader>gf', '<leader>fg', '<leader>km'},
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  opts = options,
  config = configs,
}
