return {
  'iamcco/markdown-preview.nvim',
  build = 'cd app && npm install',
  ft = 'markdown', -- Only load for Markdown files
  config = function()
    vim.g.mkdp_theme = 'dark' -- GitHub-like dark theme
    vim.g.mkdp_browser = 'brave' -- or 'chrome', 'edge', etc.
  end
}
