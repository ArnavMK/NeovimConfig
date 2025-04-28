return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- Basic configuration
      size = 15,
      open_mapping = [[<C-\>]],
      direction = "horizontal",
      -- Proper border configuration
      float_opts = {
        border = "none",  -- or "none", "double", "rounded", "solid", "shadow"
        winblend = 0,
      },
      -- Correct highlight group syntax
      highlights = {
        Normal = {
          guibg = "NONE",  -- Use terminal background
        },
        NormalFloat = {
          link = "Normal",  -- Match regular window background
        },
        FloatBorder = {
          guifg = "#3b4261",  -- Example color (change to match your theme)
          guibg = "NONE",
        },
      },
      -- Terminal appearance
      shade_terminals = false,  -- Disable terminal shading
      persist_size = true,
      start_in_insert = true,
    })
  end
}
