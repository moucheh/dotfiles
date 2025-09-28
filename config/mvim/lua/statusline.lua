local api = vim.api
local o = vim.o

local icon_map = {
  lua = "", py = "", js = "", ts = "",
  html = "", css = "", json = "", md = "",
  sh = "", vim = "", cpp = "", c = "",
  h = "", java = "", go = "", rs = "",
  toml = "", txt = "", lock = "", [""] = "",
  fzf = "󰈞"
}

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
    if result ~= '' then return ' ' .. result end
  end
  return ''
end

local function git_diff_stats()
  local handle = io.popen('git diff --numstat 2>/dev/null')
  if not handle then return "" end

  local added, removed, file_count = 0, 0, 0

  for line in handle:lines() do
    local a, d, _ = line:match("^(%d+)%s+(%d+)%s+(.+)")
    if a and d then
      added = added + tonumber(a)
      removed = removed + tonumber(d)
      file_count = file_count + 1
    end
  end

  handle:close()

  if file_count == 0 then return "" end
  return string.format("󰈢 %d  %d  %d", file_count, added, removed)
end

local function lsp_diagnostics()
  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  return string.format(" %d  %d 󰋽 %d", errors, warnings, info)
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
  local mode = (' ' .. mode_map[vim.fn.mode()]) or vim.fn.mode()
  local file =
    vim.fn.expand("%:t") ~= "" and (string.find(vim.fn.expand("%:t"), "FZF")
    and "FZF" or vim.fn.expand("%:t")) or "[No Name]"
  local readonly = vim.bo.readonly and "" or ""
  local modified = vim.bo.modified and "[+]" or ""
  local ft = icon_map[vim.bo.filetype ~= "" and vim.bo.filetype] or ""
  local branch = git_branch()
  local gitdiff = git_diff_stats()
  local diag = lsp_diagnostics()
  local lsp = lsp_clients()
  local lineinfo = string.format("Ln %d, Col %d [%d%%%%]", vim.fn.line("."), vim.fn.col("."),
    vim.fn.line(".") * 100 / vim.fn.line("$"))

  return table.concat {
    "%#StatusMode#",
    " ", mode, " ",
    "%#StatusFile#",
    " ", ft,
    " ", file,
    " ", modified,
    " ", readonly,
    "%#StatusGit#",
    branch ~= "" and (" [" .. branch .. "] ") or "",
    gitdiff ~= "" and (" [" .. gitdiff .. "] ") or "",
    "%#StatusDiag#",
    diag ~= "" and (" | " .. diag) or "",
    "%=",
    lsp ~= "" and (lsp .. " | ") or "",
    "%#StatusPos#",
    " ", lineinfo, " ",
  }
end

o.statusline = "%!v:lua.Statusline()"
o.laststatus = 3

local function set_statusline_colors()
  api.nvim_set_hl(0, "StatusMode", { fg = "#333333", bg = "LightBlue", bold = true })
  api.nvim_set_hl(0, "StatusFile", { fg = "#ffffff", bg = "none", bold = false })
  api.nvim_set_hl(0, "StatusGit",  { fg = "#ffffff", bg = "none", bold = false })
  api.nvim_set_hl(0, "StatusDiag", { fg = "#ffffff", bg = "none", bold = false })
  api.nvim_set_hl(0, "StatusPos",  { fg = "#ffffff", bg = "none", bold = false })
  vim.cmd[[
    hi StatusLine   guifg=#FFFFFF guibg=none ctermfg=White ctermbg=none
    hi StatusLineNC guifg=#FFFFFF guibg=none ctermfg=White ctermbg=none
  ]]
end

set_statusline_colors()

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = set_statusline_colors
})
