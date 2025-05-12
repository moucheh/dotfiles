local options = {
  formatters_by_ft = {
    c = { 'clang-format' },
    cpp = { 'clang-format' },
    objc = { 'clang-format' },
    objcpp = { 'clang-format' },
    lua = { 'stylua' },
    css = { 'prettierd', 'prettier', stop_after_first = true },
    html = { 'prettierd', 'prettier', stop_after_first = true },
    python = { 'black' },
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
    javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    typescript = { 'prettierd', 'prettier', stop_after_first = true },
    typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    vhdl = { 'vsg' },
  },
}

return options
