local hyper = {
  theme = 'hyper',
  config = {
    week_header = {
     enable = true,
    },
    shortcut = {
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        icon = ' ',
        desc = 'last session',
        action = 'lua require("persistence").load()',
        key = 's',
      },
      {
        icon = ' ',
        desc = 'config',
        group = 'Number',
        action = 'Config',
        key = 'd',
      },
      {
        icon = ' ',
        desc = 'quit',
        action = 'qa',
        key = 'q',
      }
    },
    packages = { enable = false },
    project = { enable = false },
    mru = { limit = 2 },
    -- footer = {
    --   "                  ",
    --   "🚀 Azhar Rizqullah",
    --   "                  ",
    -- }
    footer = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return { " ", "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
    end,
  },
}

local doom = {
  theme = "doom",
  config = {
    week_header = {
      enable = true,
      append = {"azhar"},
    },
    header = {"azhar"},
    center = {
      { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
      { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
      { action = "cd ~/.config/nvim | Telescope find_files",                 desc = " Config",          icon = " ", key = "d" },
      { action = "lua require('persistence').load()",                        desc = " Restore Session", icon = " ", key = "s" },
      { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
    },
    footer = {
      "                  ",
      "🚀 Azhar Rizqullah",
      "                  ",
    }
  },
}

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = hyper,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}
