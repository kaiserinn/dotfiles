local options = {
  ensure_installed = {
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "rust",
    "python",
  },
  highlight = { enable = true },
  indent = { enable = true },
  auto_install = true,
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    require("nvim-treesitter.configs").setup(options)
  end,
  event = "VeryLazy",
}
