return {
  -- Start screen dashboard
  {
    'glepnir/dashboard-nvim',
    priority = 100,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('dashboard').setup {
        disable_move = false,    --  default is false disable move keymap for hyper
        shortcut_type = 'number',   --  shorcut type 'letter' or 'number'
        change_to_vcs_root = false, -- default is false,for open file in hyper mru. it will change to the root of vcs
        hide = {
          statusline = true,    -- hide statusline default is true
          tabline = false,       -- hide the tabline
          winbar = false,        -- hide winbar
        },
        -- preview = {
        --   command,       -- preview command
        --   file_path,     -- preview file path
        --   file_height,   -- preview file height
        --   file_width,    -- preview file width
        -- },
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
          },
        },
      }
    end
  },

}
