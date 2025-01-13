return {
  "folke/trouble.nvim",
  opts = {
    focus = true
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>tt",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Trouble: Diagnostics",
    },
    {
      "<leader>ct",
      "<cmd>Trouble diagnostics focus filter.buf=0<cr>",
      desc = "Trouble: Buffer Diagnostics",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Trouble: Symbols",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "Trouble: LSP Definitions / references / ...",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Trouble: Location List",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Trouble: Quickfix List",
    },
  },
}

