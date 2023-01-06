require('lualine').setup {
  options = {
    icons_enabled = false,
    section_separators = '',
    component_separators = '',
    theme = 'onedark',
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
        {
          'filename',
          file_status = true,      -- Displays file status (readonly status, modified status)
          newfile_status = false,   -- Display new file status (new file means no write after created)
          path = 0,                -- 0: Just the filename
                                   -- 1: Relative path
                                   -- 2: Absolute path
                                   -- 3: Absolute path, with tilde as the home directory

          shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                                   -- for other components. (terrible name, any suggestions?)
          symbols = {
            modified = '[+]',      -- Text to show when the file is modified.
            readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New]',     -- Text to show for new created file before first writting
          }
        }
    },
    lualine_c = {'branch', 'diff'},
    lualine_x = {'encoding'},
    lualine_y = {'filetype'},
    lualine_z = {
        'progress', 'location',
        {
          'diagnostics',
          sections = { 'error', 'warn', 'info', 'hint' },
          diagnostics_color = {
            error = { bg = '#1d2021', fg = '#cc241d' }, -- Changes diagnostics' error color.
            warn  = { bg = '#1d2021', fg = '#fabd2f' },  -- Changes diagnostics' warn color.
            info  = { bg = '#1d2021', fg = '#fbf1c7' },  -- Changes diagnostics' info color.
            hint  = { bg = '#1d2021', fg = '#8ec07c' },  -- Changes diagnostics' hint color.
          },
          symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
          colored = true,           -- Displays diagnostics status in color if set to true.
          update_in_insert = false, -- Update diagnostics in insert mode.
          always_visible = false,   -- Show diagnostics even if there are none.
        }
      }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}