vim.o.tabline = "%!v:lua.BufferLine()"

local icon_map = {
  lua = "", py = "", js = "", ts = "",
  html = "", css = "", json = "", md = "",
  sh = "", vim = "", cpp = "", c = "",
  h = "", java = "", go = "", rs = "",
  toml = "", txt = "", lock = "", [""] = ""
}

local function get_icon(name)
  local ext = name:match("^.+(%..+)$")
  ext = ext and ext:sub(2) or ""
  return icon_map[ext] or ""
end

function _G.BufferLine()
  local s = ''
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'buflisted') then
      local name = vim.api.nvim_buf_get_name(bufnr)
      local short = vim.fn.fnamemodify(name, ":t")
      local icon = get_icon(short)
      local is_current = bufnr == vim.api.nvim_get_current_buf()
      local is_modified = vim.api.nvim_buf_get_option(bufnr, "modified")

      local label = string.format(" %s %s%s ", icon, short, is_modified and " ●" or "")

      s = s .. (is_current and '%#TabLineSel#' or '%#TabLine#') .. label
    end
  end
  s = s .. '%#TabLineFill#'
  return s
end
