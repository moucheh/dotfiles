local api = vim.api
local o = vim.o

local mode_map = {
  ['n'] = 'NORMAL',
  ['i'] = 'INSERT',
  ['v'] = 'VISUAL',
  ['V'] = 'V-LINE',
  [''] = 'V-BLOCK',
  ['c'] = 'COMMAND',
  ['r'] = 'REPLACE',
  ['t'] = 'TERMINAL',
}

local function git_branch()
  local handle = io.popen('git rev-parse --abbrev-ref HEAD 2>/dev/null')
  if handle then
    local result = handle:read("*a"):gsub("\n", "")
    handle:close()
    if result ~= '' then return ' ' .. result end
  end
  return ''
end

local function lsp_diagnostics()
  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  return string.format("✘ %d ⚠ %d ℹ %d", errors, warnings, info)
end

local function lsp_clients()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then return "" end
  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  return "   LSP ~ " .. table.concat(names, ", ")
end

function Statusline()
  local mode = mode_map[vim.fn.mode()] or vim.fn.mode()
  local file = vim.fn.expand("%:t") ~= "" and vim.fn.expand("%:t") or "[No Name]"
  local readonly = vim.bo.readonly and "" or ""
  local modified = vim.bo.modified and "[+]" or ""
  local ft = vim.bo.filetype ~= "" and vim.bo.filetype or "none"
  local enc = vim.bo.fenc ~= "" and vim.bo.fenc or "none"
  local fmt = vim.bo.fileformat
  local branch = git_branch()
  local diag = lsp_diagnostics()
  local lsp = lsp_clients()
  local lineinfo = string.format("Ln %d, Col %d [%d%%%%]", vim.fn.line("."), vim.fn.col("."),
    vim.fn.line(".") * 100 / vim.fn.line("$"))

  return table.concat {
    "%#StatusMode#", -- Highlight group
    " ", mode, " ",
    "%#StatusFile#",
    " ", file, " ", modified, " ", readonly,
    " [", ft, " | ", enc, " | ", fmt, "] ",
    branch ~= "" and ("[" .. branch .. "] ") or "",
    "%#StatusDiag#",
    diag ~= "" and (" | " .. diag) or "",
    "%=",
    "%#StatusPos#",
    lsp ~= "" and (lsp .. " | ") or "",
    " ", lineinfo, " ",
  }
end

o.statusline = "%!v:lua.Statusline()"
o.laststatus = 3

local function set_statusline_colors()
  api.nvim_set_hl(0, "StatusMode", { fg = "#ffffff", bg = "#005f87", bold = true })
  api.nvim_set_hl(0, "StatusFile", { fg = "#ffffff", bg = "#003f5c" })
  api.nvim_set_hl(0, "StatusDiag", { fg = "#ffffff", bg = "#003f5c" })
  api.nvim_set_hl(0, "StatusPos", { fg = "#ffffff", bg = "#005f87", bold = true })
end

set_statusline_colors()

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = set_statusline_colors
})
