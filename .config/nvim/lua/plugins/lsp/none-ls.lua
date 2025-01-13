local conf = function()
  local null_ls = require("null-ls")
  local b = null_ls.builtins

  null_ls.setup({
    sources = {

      -- lua
      b.formatting.stylua,

      -- javascript / typescript
      -- b.formatting.biome,
      b.formatting.prettier,
      -- b.diagnostics.eslint,

      -- rust
      b.formatting.rustfmt,
      -- b.formatting.leptosfmt, -- leptos
    },
  })
end

return {
  "nvimtools/none-ls.nvim",
  config = conf,
  event = "InsertEnter",
}
