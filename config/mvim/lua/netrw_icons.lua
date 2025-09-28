vim.g.netrw_banner = 0
vim.g.netrw_fastbrowse = 0

vim.g.netrw_hide = 1
vim.g.netrw_list_hide = [[\v^\./|^\.\./]]

local ghregex=[[\(^\|\s\s\)\zs\.\S\+]]

vim.g.netrw_list_hide = vim.g.netrw_list_hide .. ',' .. ghregex

local icons = {
  lua = "",
  txt = "",
  md = "",
  json = "",
  html = "",
  css = "",
  js = "",
  sh = "",
  py = "",
  ["default"] = "",
  ["dir"] = "",
}

local function is_dir(name)
  return name:sub(-1) == "/"
end

local function add_icons_virtual_text()
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.bo[bufnr].filetype ~= "netrw" then return end

  local ns = vim.api.nvim_create_namespace("netrw_icons")
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  for i, line in ipairs(lines) do
    local name = line:match("%S+$") or ""
    local icon = icons["default"]

    if is_dir(name) then
      icon = icons["dir"]
    else
      local ext = name:match("%.([^%.]+)$")
      if ext and icons[ext] then
        icon = icons[ext]
      end
    end

    vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, -1, {
      virt_text = { { " " .. icon, "Directory" } },
      virt_text_pos = "eol",
      hl_mode = "combine",
    })
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.defer_fn(add_icons_virtual_text, 20)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end,
})
