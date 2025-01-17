return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>n', ':Neotree toggle reveal<CR>', desc = 'NeoTree: toggle tree', silent = true },
    { '<leader>b', ':Neotree toggle buffers current<CR>', desc = 'NeoTree: toggle buffer tree', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        position = "current",
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["."] = "toggle_hidden",
          ["H"] = "set_root"
        }
      },
    },
  },
}
