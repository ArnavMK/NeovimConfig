-- return {
--   'shaunsingh/nord.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Example config in lua
--     vim.g.nord_contrast = true
--     vim.g.nord_borders = false
--     vim.g.nord_disable_background = true
--     vim.g.nord_italic = false
--     vim.g.nord_uniform_diff_background = true
--     vim.g.nord_bold = false
--
--     -- Load the colorscheme
--     require('nord').set()
--
--     -- Toggle background transparency
--     local bg_transparent = true
--
--     local toggle_transparency = function()
--       bg_transparent = not bg_transparent
--       vim.g.nord_disable_background = bg_transparent
--       vim.cmd [[colorscheme nord]]
--     end
--
--     vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--   end,
-- }


-- return {
--   'navarasu/onedark.nvim',
--   priority = 1000, -- Make sure to load this before all other plugins
--   config = function()
--     require('onedark').setup({
--       style = 'darker',
--       transparent = true, -- Enable transparent background
--       term_colors = true, -- Enable terminal colors
--       ending_tildes = false, -- Show end-of-buffer tildes
--       cmp_itemkind_reverse = false, -- Reverse item kind highlights in cmp menu
--
--       -- Override default highlights
--       highlights = {
--         -- General UI
--         Normal = { fg = '#abb2bf', bg = 'NONE' },
--         NormalFloat = { fg = '#abb2bf', bg = 'NONE' },
--         FloatBorder = { fg = '#5c6370', bg = 'NONE' },
--         ColorColumn = { bg = 'NONE' },
--         CursorLine = { bg = '#2c323c' },
--         CursorLineNr = { fg = '#abb2bf', bg = 'NONE' },
--         LineNr = { fg = '#4b5263', bg = 'NONE' },
--         SignColumn = { bg = 'NONE' },
--         VertSplit = { fg = '#1e222a', bg = 'NONE' },
--         WinSeparator = { fg = '#1e222a', bg = 'NONE' },
--
--         -- Syntax groups
--         Comment = { fg = '#5c6370', italic = true }, -- Only italics in comments
--         Constant = { fg = '#d19a66' },
--         String = { fg = '#98c379' },
--         Character = { fg = '#98c379' },
--         Number = { fg = '#d19a66' },
--         Boolean = { fg = '#d19a66' },
--         Float = { fg = '#d19a66' },
--         Identifier = { fg = '#e06c75' },
--         Function = { fg = '#61afef' },
--         Statement = { fg = '#c678dd' },
--         Conditional = { fg = '#c678dd' },
--         Repeat = { fg = '#c678dd' },
--         Label = { fg = '#e06c75' },
--         Operator = { fg = '#56b6c2' },
--         Keyword = { fg = '#c678dd' },
--         Exception = { fg = '#c678dd' },
--         PreProc = { fg = '#e06c75' },
--         Include = { fg = '#c678dd' },
--         Define = { fg = '#c678dd' },
--         Macro = { fg = '#c678dd' },
--         PreCondit = { fg = '#e06c75' },
--         Type = { fg = '#e5c07b' },
--         StorageClass = { fg = '#e06c75' },
--         Structure = { fg = '#e5c07b' },
--         Typedef = { fg = '#e5c07b' },
--         Special = { fg = '#56b6c2' },
--         SpecialChar = { fg = '#56b6c2' },
--         Tag = { fg = '#e06c75' },
--         Delimiter = { fg = '#abb2bf' },
--         SpecialComment = { fg = '#5c6370', italic = true }, -- Italics for special comments
--         Debug = { fg = '#e06c75' },
--         Underlined = { underline = true },
--         Ignore = { fg = '#5c6370' },
--         Error = { fg = '#e06c75', bg = 'NONE' },
--         Todo = { fg = '#c678dd', bg = 'NONE' },
--
--         -- LSP and Diagnostics
--         DiagnosticError = { fg = '#e06c75' },
--         DiagnosticWarn = { fg = '#e5c07b' },
--         DiagnosticInfo = { fg = '#61afef' },
--         DiagnosticHint = { fg = '#56b6c2' },
--         LspReferenceText = { bg = '#3e4452' },
--         LspReferenceRead = { bg = '#3e4452' },
--         LspReferenceWrite = { bg = '#3e4452' },
--
--         -- Cursor and Selection
--         Cursor = { reverse = true },
--         lCursor = { reverse = true },
--         CursorIM = { reverse = true },
--         Visual = { bg = '#3e4452' },
--         VisualNOS = { bg = '#3e4452' },
--
--         -- Status line
--         StatusLine = { fg = '#abb2bf', bg = '#1e222a' },
--         StatusLineNC = { fg = '#5c6370', bg = '#1e222a' },
--         WildMenu = { fg = '#282c34', bg = '#61afef' },
--
--         -- Pmenu (completion menu)
--         Pmenu = { fg = '#abb2bf', bg = 'NONE' },
--         PmenuSel = { fg = '#282c34', bg = '#61afef' },
--         PmenuSbar = { bg = 'NONE' },
--         PmenuThumb = { bg = '#5c6370' },
--
--         -- Tabline
--         TabLine = { fg = '#5c6370', bg = '#1e222a' },
--         TabLineSel = { fg = '#abb2bf', bg = '#282c34' },
--         TabLineFill = { bg = '#1e222a' },
--
--         -- Search
--         Search = { fg = '#282c34', bg = '#e5c07b' },
--         IncSearch = { fg = '#282c34', bg = '#d19a66' },
--         Substitute = { fg = '#282c34', bg = '#e06c75' },
--
--         -- Diff
--         DiffAdd = { fg = 'NONE', bg = '#283b4b' },
--         DiffChange = { fg = 'NONE', bg = '#272d43' },
--         DiffDelete = { fg = 'NONE', bg = '#3f2d3d' },
--         DiffText = { fg = 'NONE', bg = '#394b70' },
--
--         -- Fold
--         Folded = { fg = '#5c6370', bg = 'NONE' },
--         FoldColumn = { fg = '#5c6370', bg = 'NONE' },
--
--         -- Misc
--         Conceal = { fg = '#5c6370' },
--         SpecialKey = { fg = '#5c6370' },
--         NonText = { fg = '#3b4048' },
--         Directory = { fg = '#61afef' },
--         Title = { fg = '#61afef' },
--         ErrorMsg = { fg = '#e06c75', bg = 'NONE' },
--         ModeMsg = { fg = '#abb2bf' },
--         MoreMsg = { fg = '#98c379' },
--         Question = { fg = '#98c379' },
--         WarningMsg = { fg = '#e5c07b' },
--         MatchParen = { fg = '#abb2bf', bg = '#3e4452' },
--         Whitespace = { fg = '#3b4048' },
--         qfLineNr = { fg = '#5c6370' },
--       },
--
--       -- Plugin-specific highlights
--       diagnostics = {
--         darker = true, -- darker background for diagnostic floats
--         undercurl = true, -- use undercurl for diagnostics
--       },
--     })
--
--     -- Apply the colorscheme
--     require('onedark').load()
--   end
-- }
--
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- darkest variant
      transparent_background = true,
      show_end_of_buffer = false, -- don't show tildes at end of buffer
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = true, -- disable all italics
      no_bold = false,
      no_underline = false,
      styles = {
        comments = {}, -- no italics in comments either
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000", -- fully transparent
          mantle = "#000000", -- fully transparent
          crust = "#000000", -- fully transparent
        },
      },
      custom_highlights = function(colors)
        return {
          -- General UI
          Normal = { fg = colors.text, bg = "NONE" },
          NormalFloat = { fg = colors.text, bg = "NONE" },
          FloatBorder = { fg = colors.blue, bg = "NONE" },
          CursorLine = { bg = colors.surface0 },
          CursorLineNr = { fg = colors.lavender, bg = "NONE" },
          LineNr = { fg = colors.overlay1, bg = "NONE" },
          SignColumn = { bg = "NONE" },
          VertSplit = { fg = colors.surface1, bg = "NONE" },
          WinSeparator = { fg = colors.surface1, bg = "NONE" },

          -- Bufferline (fully transparent)
          BufferLineFill = { bg = "NONE" },
          BufferLineBackground = { bg = "NONE" },
          BufferLineBufferSelected = { fg = colors.text, bg = "NONE", bold = true },
          BufferLineBufferVisible = { fg = colors.overlay1, bg = "NONE" },
          BufferLineSeparator = { fg = colors.surface1, bg = "NONE" },
          BufferLineSeparatorSelected = { fg = colors.surface1, bg = "NONE" },
          BufferLineSeparatorVisible = { fg = colors.surface1, bg = "NONE" },
          BufferLineIndicatorSelected = { fg = colors.lavender, bg = "NONE" },

          -- Pmenu (completion menu)
          Pmenu = { fg = colors.text, bg = "NONE" },
          PmenuSel = { fg = colors.base, bg = colors.blue },
          PmenuSbar = { bg = "NONE" },
          PmenuThumb = { bg = colors.surface1 },

          -- Diagnostics
          DiagnosticError = { fg = colors.red },
          DiagnosticWarn = { fg = colors.yellow },
          DiagnosticInfo = { fg = colors.blue },
          DiagnosticHint = { fg = colors.teal },
          DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
          DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
          DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue },
          DiagnosticUnderlineHint = { undercurl = true, sp = colors.teal },

          -- LSP
          LspReferenceText = { bg = colors.surface1 },
          LspReferenceRead = { bg = colors.surface1 },
          LspReferenceWrite = { bg = colors.surface1 },

          -- Status line
          StatusLine = { fg = colors.text, bg = "NONE" },
          StatusLineNC = { fg = colors.overlay1, bg = "NONE" },

          -- Tabline
          TabLine = { fg = colors.overlay1, bg = "NONE" },
          TabLineSel = { fg = colors.lavender, bg = "NONE" },
          TabLineFill = { bg = "NONE" },

          -- Cursor
          Cursor = { fg = colors.base, bg = colors.text },
          lCursor = { fg = colors.base, bg = colors.text },
          CursorIM = { fg = colors.base, bg = colors.text },

          -- Search
          Search = { fg = colors.base, bg = colors.blue },
          IncSearch = { fg = colors.base, bg = colors.lavender },
          CurSearch = { link = "IncSearch" },
        }
      end,
      integrations = {
        bufferline = true,
        cmp = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        lsp_trouble = true,
        mason = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        navic = {
          enabled = false,
          custom_bg = "NONE",
        },
        neotree = true,
        noice = true,
        notify = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    })

    -- Apply the colorscheme
    vim.cmd.colorscheme("catppuccin")
  end,
}
