return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {
      'bash',
      'cmake',
      'cpp',  -- Explicitly added to fix the error
      'css',
      'gitignore',
      'go',
      'html',
      'java',
      'javascript',
      'json',
      'lua',
      'make',
      'markdown',
      'markdown_inline',
      'python',
      'regex',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'rust'
    },
    auto_install = true,
    highlight = {
      enable = true,
      disable = { 'cpp' },  -- Temporarily disable if errors persist
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, },  -- Disable indent for problematic langs
  },
}
