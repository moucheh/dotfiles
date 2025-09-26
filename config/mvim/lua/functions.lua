function FzfGrepFloating()
  local tmpfile = vim.fn.tempname()

  local has_bat = vim.fn.executable("bat") == 1
  local preview_cmd = has_bat
    and [[bat --style=numbers --color=always --highlight-line {2} --line-range :500 {1}]]
    or [[head -n 100 {1}]]

  local fzf_cmd = string.format(
    "rg --line-number --no-heading --color=never '' | fzf --ansi --preview '%s' --delimiter ':' --bind tab:up,ctrl-j:down > %s",
    preview_cmd,
    vim.fn.shellescape(tmpfile)
  )

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    row = row,
    col = col,
    width = width,
    height = height,
    style = 'minimal',
    border = 'rounded',
  })

  vim.fn.termopen(fzf_cmd, {
    on_exit = function()
      vim.api.nvim_win_close(win, true)

      local f = io.open(tmpfile, "r")
      if not f then return end
      local result = f:read("*l")
      f:close()
      os.remove(tmpfile)

      if not result or result == "" then
        print("FzfGrep cancelled.")
        return
      end

      local file, lnum = result:match("([^:]+):(%d+):")
      if file and lnum then
        vim.cmd("edit " .. vim.fn.fnameescape(file))
        vim.cmd(lnum)
      else
        print("Invalid selection: " .. result)
      end
    end
  })

  vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("FzfGrep", FzfGrepFloating, {})

function LazyGitFloating()
  if vim.fn.executable("lazygit") == 0 then
    vim.notify("lazygit not found in PATH", vim.log.levels.ERROR)
    return
  end

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    row = row,
    col = col,
    width = width,
    height = height,
    style = 'minimal',
    border = 'rounded',
  })

  vim.fn.termopen("lazygit", {
    on_exit = function(_, code, _)
      vim.api.nvim_win_close(win, true)
      if code ~= 0 then
        vim.notify("lazygit exited with code " .. code, vim.log.levels.WARN)
      end
    end
  })

  vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("LazyGit", LazyGitFloating, {})
