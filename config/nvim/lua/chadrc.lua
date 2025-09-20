-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = 'poimandres',
  transparency = true,

  hl_override = {
    Comment = { italic = true },
    ['@comment'] = { italic = true },
  },
}

M.nvdash = {
  header = {
    ' ███╗   ███╗ ██████╗ ██╗   ██╗ ██████╗██╗  ██╗███████╗██╗  ██╗ ',
    ' ████╗ ████║██╔═══██╗██║   ██║██╔════╝██║  ██║██╔════╝██║  ██║ ',
    ' ██╔████╔██║██║   ██║██║   ██║██║     ███████║█████╗  ███████║ ',
    ' ██║╚██╔╝██║██║   ██║██║   ██║██║     ██╔══██║██╔══╝  ██╔══██║ ',
    ' ██║ ╚═╝ ██║╚██████╔╝╚██████╔╝╚██████╗██║  ██║███████╗██║  ██║ ',
    ' ╚═╝     ╚═╝ ╚═════╝  ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ',
    '                                                               ',
  },

  load_on_startup = true,
  buttons = {
    { txt = '  Find File', keys = 'ff', cmd = 'Telescope find_files' },
    { txt = '  Recent Files', keys = 'fo', cmd = 'Telescope oldfiles' },
    { txt = '󰈭  Find Word', keys = 'fw', cmd = 'Telescope live_grep' },
    { txt = '󱥚  Themes', keys = 'th', cmd = ":lua require('nvchad.themes').open()" },
    { txt = '  Mappings', keys = 'ch', cmd = 'NvCheatsheet' },
    { txt = '  LazyGit', keys = 'lg', cmd = 'LazyGit' },
    { txt = '  Neogit', keys = 'ng', cmd = 'Neogit' },
    { txt = '  Show Registers', keys = 'tr', cmd = ':Telescope registers<CR>' },

    { txt = '─', hl = 'NvDashFooter', no_gap = true, rep = true },

    {
      txt = function()
        local stats = require('lazy').stats()
        local ms = math.floor(stats.startuptime) .. ' ms'
        return '  Loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms
      end,
      hl = 'NvDashFooter',
      no_gap = true,
    },

    { txt = '─', hl = 'NvDashFooter', no_gap = true, rep = true },
  },
}

M.ui = {
  tabufline = {
    lazyload = false,
  },
  statusline = {
    theme = 'vscode_colored',
    order = { 'mode', 'file', 'git', '%=', 'lsp_msg', '%=', 'diagnostics', 'cursor', 'lsp', 'cwd' },
  },
}

return M
