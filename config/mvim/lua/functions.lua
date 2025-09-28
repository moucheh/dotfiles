function FzfGrepFloating()
  local tmpfile = vim.fn.tempname()

  local has_bat = vim.fn.executable("bat") == 1
  local preview_cmd = has_bat
    and [[
      FILE={1}; LINE={2};
      if [ "$LINE" -eq "$LINE" ] 2>/dev/null; then
        START=$((LINE - 15)); [ $START -lt 1 ] && START=1;
        END=$((LINE + 15));
        bat --theme=Nord --style=numbers --color=always --highlight-line "$LINE" --line-range "$START:$END" "$FILE";
      else
        echo "Invalid line number: $LINE";
      fi
    ]]
    or [[
      FILE={1}; LINE={2};
      if [ "$LINE" -eq "$LINE" ] 2>/dev/null; then
        START=$((LINE - 10)); [ $START -lt 1 ] && START=1;
        END=$((LINE + 10));
        sed -n "${START},${END}p" "$FILE";
      else
        echo "Invalid line number: $LINE";
      fi
    ]]

  local rg_cmd = [[rg --line-number --no-heading --color=never '']]
  local clean_cmd = [[awk -F ':' 'BEGIN { OFS=":" } { sub(/^[ \t]+/, "", $3); print $1, $2, $3 }']]

  local fzf_cmd = string.format(
    "%s | %s | fzf --ansi --preview '%s' --delimiter ':' --with-nth 3.. " ..
    "--bind tab:up,ctrl-j:down > %s",
    rg_cmd,
    clean_cmd,
    preview_cmd,
    vim.fn.shellescape(tmpfile)
  )

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, "filetype", "fzf")

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

function FzfRegistersFloating()
  if vim.fn.executable("fzf") == 0 then
    vim.notify("fzf not found in PATH", vim.log.levels.ERROR)
    return
  end

  local registers = { '"', '0','1','2','3','4','5','6','7','8','9',
                      '-', '=', '*', '+', '#', '%', ':', '.', '/', '_' }

  local lines = {}
  for _, reg in ipairs(registers) do
    local val = vim.fn.getreg(reg)
    if val and val ~= "" then
      val = val:gsub("\n", "\\n"):sub(1, 300)
      table.insert(lines, string.format("%s: %s", reg, val))
    end
  end

  if #lines == 0 then
    vim.notify("No registers to show", vim.log.levels.INFO)
    return
  end

  local input_file = vim.fn.tempname()
  local output_file = vim.fn.tempname()
  vim.fn.writefile(lines, input_file)

  local orig_buf = vim.api.nvim_get_current_buf()
  local orig_win = vim.api.nvim_get_current_win()

  local width = math.floor(vim.o.columns * 0.7)
  local height = math.floor(vim.o.lines * 0.6)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local term_buf = vim.api.nvim_create_buf(false, true)
  local term_win = vim.api.nvim_open_win(term_buf, true, {
    relative = 'editor',
    row = row,
    col = col,
    width = width,
    height = height,
    style = 'minimal',
    border = 'rounded',
  })

  local fzf_cmd = string.format(
    [[bash -c 'cat "%s" | fzf --prompt="Registers> " > "%s"']],
    input_file, output_file
  )

  vim.fn.termopen(fzf_cmd, {
    on_exit = function()
      vim.schedule(function()
        if vim.api.nvim_win_is_valid(term_win) then
          vim.api.nvim_win_close(term_win, true)
        end
        if vim.fn.filereadable(input_file) == 1 then
          os.remove(input_file)
        end

        if vim.fn.filereadable(output_file) == 1 then
          local ok, result = pcall(vim.fn.readfile, output_file)
          os.remove(output_file)

          if ok and result and #result > 0 then
            local line = result[1]
            local reg = line:match("^(%S+):")
            if reg then
              local value = vim.fn.getreg(reg)

              if vim.api.nvim_win_is_valid(orig_win) then
                vim.api.nvim_set_current_win(orig_win)
              end
              if vim.api.nvim_buf_is_valid(orig_buf) then
                vim.api.nvim_set_current_buf(orig_buf)
              end

              vim.cmd("stopinsert")

              vim.fn.setreg('+', value)

              vim.notify(string.format("Yanked contents of register \"%s\" into register \"0\"", reg))
            else
              vim.notify("Failed to parse register", vim.log.levels.WARN)
            end
          else
            vim.notify("No register selected", vim.log.levels.INFO)
          end
        end
      end)
    end
  })

  vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("FzfRegisters", FzfRegistersFloating, {})
