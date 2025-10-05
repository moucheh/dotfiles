return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = function(_, opts)
      local actions = require 'telescope.actions'
      local action_state = require 'telescope.actions.state'

      opts.defaults = vim.tbl_deep_extend('force', opts.defaults or {}, {
        initial_mode = 'normal',
        mappings = {
          n = {
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
