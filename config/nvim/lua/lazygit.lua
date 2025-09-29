function LazyGitFloating()
  if vim.fn.executable 'lazygit' == 0 then
    vim.notify('lazygit not found in PATH', vim.log.levels.ERROR)
    return
  end

  local width = math.floor(vim.o.columns * 0.9)
  local height = math.floor(vim.o.lines * 0.9)
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

  vim.fn.termopen('lazygit', {
    on_exit = function(_, code, _)
      vim.api.nvim_win_close(win, true)
      if code ~= 0 then
        vim.notify('lazygit exited with code ' .. code, vim.log.levels.WARN)
      end
    end,
  })

  vim.cmd 'startinsert'
end

vim.api.nvim_create_user_command('LazyGit', LazyGitFloating, {})
