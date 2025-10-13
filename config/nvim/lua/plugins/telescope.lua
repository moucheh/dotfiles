dofile(vim.g.base46_cache .. 'telescope')

return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = function(_, opts)
      local actions = require 'telescope.actions'
      local action_state = require 'telescope.actions.state'

      opts.defaults = vim.tbl_deep_extend('force', opts.defaults or {}, {
        prompt_prefix = '   ',
        selection_caret = ' ',
        entry_prefix = ' ',
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        initial_mode = 'normal',
        mappings = {
          n = {
            ['q'] = require('telescope.actions').close,
            ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
            ['<CR>'] = function(prompt_bufnr)
              local picker = action_state.get_current_picker(prompt_bufnr)
              local multi = picker:get_multi_selection()

              if vim.tbl_isempty(multi) then
                actions.select_default(prompt_bufnr)
              else
                actions.close(prompt_bufnr)
                for _, entry in ipairs(multi) do
                  vim.cmd('edit ' .. entry.path)
                end
              end
            end,
          },
        },
      })

      return opts
    end,
  },
}
