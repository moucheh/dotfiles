vim.g['fsharp#fsautocomplete_command'] = {
  'fsautocomplete',
  '--background-service-enabled',
}

return {
  'ionide/Ionide-vim',
  ft = { 'fsharp', 'fsharp_project' },
}
