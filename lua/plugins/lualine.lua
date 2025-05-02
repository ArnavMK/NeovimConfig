return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local colors = {
      blue   = '#80a0ff',
      cyan   = '#79dac8',
      black  = '#080808',
      white  = '#c6c6c6',
      red    = '#ff5189',
      violet = '#d183e8',
      grey   = '#303030',
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.blue },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },
        x = { fg = colors.white, bg = colors.grey }, -- For diagnostics section
      },
      insert = { a = { fg = colors.black, bg = colors.cyan } },
      visual = { a = { fg = colors.black, bg = colors.red } },
      replace = { a = { fg = colors.black, bg = colors.violet} },
      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
        x = { fg = colors.white, bg = colors.black },
      },
    }

    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { '%=', --[[ your center components ]] },
        lualine_x = {
          { -- This is the diagnostics section
            'diagnostics',
            sources = {'nvim_diagnostic'},
            symbols = {error = ' ', warn = ' ', info = ' '},
            colored = true,
            separator = { left = '', right = '' }, -- Both separators now
            left_padding = 2,
            right_padding = 2,
            color = { bg = colors.grey },
          }
        },
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {
          {
            'diagnostics',
            separator = { left = '', right = '' },
            left_padding = 2,
            color = { bg = colors.black },
          }
        },
        lualine_y = {},
        lualine_z = { 'location' },
      },
    }
  end
}
