return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-\>]],
      direction = "float",
      shell = "pwsh",
      float_opts = {
        border = "rounded",
        width = function() return math.floor(math.min(100, vim.o.columns * 0.8)) end,
        height = function() return math.floor(math.min(30, vim.o.lines * 0.8)) end,
        winblend = 5,
        offsets = {
          top = 0,
          bottom = 0,
          left = 0,
          right = 0,
        },
      },
      highlights = {
        FloatBorder = {
          guifg = "#8baac7",  -- Tokyo Night blue
        },
      },
      winbar = {
        enabled = false
      },
      shade_terminals = false,
      persist_size = true,
      start_in_insert = true,
    })

    -- Custom keymaps for better terminal navigation
    vim.api.nvim_set_keymap('t', 'kj', [[<C-\><C-n>]], {noremap = true, silent = true})
  end
}
