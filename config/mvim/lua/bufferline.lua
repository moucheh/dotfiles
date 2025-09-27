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

      s = s .. '%' .. bufnr .. '@v:lua.SwitchBuffer@'

      s = s .. (is_current and '%#TabLineSel#' or '%#TabLine#')

      local label = string.format(" %s %s%s ", icon, short, is_modified and " ●" or "")
      s = s .. label

      s = s .. '%' .. bufnr .. '@v:lua.CloseBuffer@'
      s = s .. ' × '
      s = s .. '%X'

      s = s .. '%X'
    end
  end

  s = s .. '%#TabLineFill#'
  return s
end

function _G.SwitchBuffer(bufnr, _)
  bufnr = tonumber(bufnr)
  if vim.api.nvim_buf_is_valid(bufnr) then
    vim.api.nvim_set_current_buf(bufnr)
  end
end

function _G.CloseBuffer(bufnr, _)
  bufnr = tonumber(bufnr)
  if not vim.api.nvim_buf_is_valid(bufnr) then return end

  local is_modified = vim.api.nvim_buf_get_option(bufnr, 'modified')
  local force = false

  if is_modified then
    local shortname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
    local choice = vim.fn.confirm("Buffer '" .. shortname .. "' has unsaved changes. Close it anyway?", "&Yes\n&No", 2)
    if choice ~= 1 then
      return
    end
    force = true
  end

  vim.api.nvim_buf_delete(bufnr, { force = force })
end

function CloseCurrentBuffer()
  local bufnr = vim.api.nvim_get_current_buf()
  _G.CloseBuffer(bufnr)
end

local map = vim.keymap.set
map('n', '<space>x', function() CloseCurrentBuffer() end)

map('n', '<space>X', ':bdelete!<CR>')
