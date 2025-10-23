local options = {
  formatters_by_ft = {
    c = { 'clang-format' },
    cpp = { 'clang-format' },
    objc = { 'clang-format' },
    objcpp = { 'clang-format' },
    java = { 'google-java-format' },
    lua = { 'stylua' },
    css = { 'prettierd' },
    html = { 'prettierd' },
    python = { 'black' },
    javascript = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    typescript = { 'prettierd' },
    typescriptreact = { 'prettierd' },
    vhdl = { 'vsg' },
    typst = { 'prettypst' },
    fsharp = { 'fsautocomplete' },
    sql = { 'sleek' },
  },
}

return options
