vim.o.tabline = "%!v:lua.BufferLine()"

local icon_map = {
  lua = "", py = "", js = "", ts = "",
  html = "", css = "", json = "", md = "",
  sh = "", vim = "", cpp = "", c = "",
  h = "", java = "", go = "", rs = "",
  toml = "", txt = "", lock = "", [""] = ""
}

local scroll_offset = 0
local max_visible_buffers = 8

local function get_icon(name)
  local ext = name:match("^.+(%..+)$")
  ext = ext and ext:sub(2) or ""
  return icon_map[ext] or ""
end

function _G.BufferLine()
  local buflist = {}
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'buflisted') then
      table.insert(buflist, bufnr)
    end
  end

  if scroll_offset > #buflist - max_visible_buffers then
    scroll_offset = math.max(0, #buflist - max_visible_buffers)
  end

  local start_idx = scroll_offset + 1
  local end_idx = math.min(#buflist, scroll_offset + max_visible_buffers)

  local s = ''

  if scroll_offset > 0 then
    s = s .. '%#TabLine#%0@v:lua.ScrollLeft@ ‹ %X'
  else
    s = s .. '%#TabLineFill#   '
  end

  for i = start_idx, end_idx do
    local bufnr = buflist[i]
    local name = vim.api.nvim_buf_get_name(bufnr)
    local short = vim.fn.fnamemodify(name, ":t")
    local icon = get_icon(short)
    local is_current = bufnr == vim.api.nvim_get_current_buf()
    local is_modified = vim.api.nvim_buf_get_option(bufnr, "modified")

    s = s .. '%' .. bufnr .. '@v:lua.SwitchBuffer@'
    s = s .. (is_current and '%#TabLineSel#' or '%#TabLine#')

    local label = string.format(" %s %s%s ", icon, short, is_modified and " ●" or "")
    s = s .. label

    s = s .. '%' .. bufnr .. '@v:lua.CloseBuffer@ × %X'
    s = s .. '%X'
  end

  if end_idx < #buflist then
    s = s .. '%#TabLine#%999@v:lua.ScrollRight@ › %X'
  else
    s = s .. '%#TabLineFill#   '
  end

  s = s .. '%#TabLineFill#%='
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

function _G.CloseCurrentBuffer()
  local bufnr = vim.api.nvim_get_current_buf()
  _G.CloseBuffer(bufnr)
end

function _G.ScrollLeft()
  local buflist = {}
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'buflisted') then
      table.insert(buflist, bufnr)
    end
  end
  local max_scroll = math.max(0, #buflist - max_visible_buffers)

  if scroll_offset <= 0 then
    scroll_offset = max_scroll
  else
    scroll_offset = scroll_offset - 1
  end
  vim.cmd("redrawtabline")
end

function _G.ScrollRight()
  local buflist = {}
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'buflisted') then
      table.insert(buflist, bufnr)
    end
  end
  local max_scroll = math.max(0, #buflist - max_visible_buffers)

  if scroll_offset >= max_scroll then
    scroll_offset = 0
  else
    scroll_offset = scroll_offset + 1
  end
  vim.cmd("redrawtabline")
end

local function wrap_bnext()
  local buflist = {}
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'buflisted') then
      table.insert(buflist, bufnr)
    end
  end

  local current_buf = vim.api.nvim_get_current_buf()
  local current_index = nil
  for i, bufnr in ipairs(buflist) do
    if bufnr == current_buf then
      current_index = i
      break
    end
  end
  if not current_index then return end

  local next_index = current_index + 1
  if next_index > #buflist then
    next_index = 1
  end

  vim.api.nvim_set_current_buf(buflist[next_index])
end

local function wrap_bprev()
  local buflist = {}
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'buflisted') then
      table.insert(buflist, bufnr)
    end
  end

  local current_buf = vim.api.nvim_get_current_buf()
  local current_index = nil
  for i, bufnr in ipairs(buflist) do
    if bufnr == current_buf then
      current_index = i
      break
    end
  end
  if not current_index then return end

  local prev_index = current_index - 1
  if prev_index < 1 then
    prev_index = #buflist
  end

  vim.api.nvim_set_current_buf(buflist[prev_index])
end

function _G.EnsureBufferVisible()
  local current_buf = vim.api.nvim_get_current_buf()

  local buflist = {}
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'buflisted') then
      table.insert(buflist, bufnr)
    end
  end

  local current_index = nil
  for i, bufnr in ipairs(buflist) do
    if bufnr == current_buf then
      current_index = i
      break
    end
  end

  if not current_index then return end

  if current_index < scroll_offset + 1 then
    scroll_offset = current_index - 1
    vim.cmd("redrawtabline")
  elseif current_index > scroll_offset + max_visible_buffers then
    scroll_offset = current_index - max_visible_buffers
    vim.cmd("redrawtabline")
  end
end

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    _G.EnsureBufferVisible()
  end
})

local map = vim.keymap.set
map('n', '<space>x', CloseCurrentBuffer)
map('n', '<space>X', ':bdelete!<CR>')

map('n', '<S-Tab>', function()
  wrap_bprev()
  _G.EnsureBufferVisible()
end)
map('n', '<Tab>', function()
  wrap_bnext()
  _G.EnsureBufferVisible()
end)
