return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = { 'FzfLua' },
  opts = function()
    require('fzf-lua').setup {
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.35,
        col = 0.50,
        border = 'rounded',
        backdrop = 60,
        fullscreen = false,
        treesitter = {
          enabled = true,
          fzf_colors = { ['hl'] = '-1:reverse', ['hl+'] = '-1:reverse' },
        },
        preview = {
          border = 'rounded',
          wrap = true,
          hidden = false,
          vertical = 'down:45%',
          horizontal = 'right:60%',
          layout = 'flex',
          flip_columns = 100,
          title = true,
          title_pos = 'center',
          scrollbar = 'float',
          scrolloff = -1,
          delay = 20,
          winopts = {
            number = true,
            relativenumber = false,
            cursorline = true,
            cursorlineopt = 'both',
            cursorcolumn = false,
            signcolumn = 'no',
            list = false,
            foldenable = false,
            foldmethod = 'manual',
          },
        },
      },
    }
  end,
}
