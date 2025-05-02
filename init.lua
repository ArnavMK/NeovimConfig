require 'core.options' -- Load general options
require 'core.keymaps' -- Load general keymaps
require 'core.snippets' -- Custom code snippets
-- visual mode highlight color
local colors = {
  blue = '#3b57a8',     -- AstroVim's light blue
}

vim.api.nvim_set_hl(0, 'WinSeparator', {
  fg = '#3b4252',  -- Match your theme's split color
  bg = 'NONE',
})

vim.api.nvim_set_hl(0, 'StatusLine', {
  bg = 'NONE',     -- Transparent background
})

vim.api.nvim_set_hl(0, 'StatusLineNC', {
  bg = 'NONE',     -- Transparent background for inactive splits
})

vim.api.nvim_set_hl(0, 'Visual', {
  fg = 'NONE',
  bg = colors.blue,
  blend = 30,           -- Transparency level
  ctermbg = 67,         -- Fallback for terminal
})

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'Visual', {
      fg = 'NONE',
      bg = '#3d59a1',
      blend = 30
    })
  end
})
-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)
-- Set up plugins
require('lazy').setup {
  require 'plugins.terminal',
  require 'plugins.colortheme',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.alpha',
  require 'plugins.misc',
  require 'plugins.comment',
  require 'plugins.preview-md'
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
