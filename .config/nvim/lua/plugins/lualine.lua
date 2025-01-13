local function lsp_progress()
  local messages = vim.lsp.util.get_progress_messages()
  if #messages == 0 then
    return
  end
  local status = {}
  for _, msg in pairs(messages) do
    table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
  end
  local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

local opts = {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = "|",
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = { 'dashboard' },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {
      {
        "diagnostics",
        symbols = {
          error = " ",
          warn  = " ",
          hint  = " ",
          info  = " ",
        },
      },
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      'filename',
    },
    lualine_x = { { 'buffers', symbols = { alternate_file = '' } } },
    -- lualine_y = {'progress', 'location'},
    lualine_y = {},
    lualine_z = {
      function()
        return " " .. os.date("%R")
      end,
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

return {
  'nvim-lualine/lualine.nvim',
  opts = opts,
  event = "VeryLazy",
}
