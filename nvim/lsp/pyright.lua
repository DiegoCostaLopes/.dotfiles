return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python", 'py' },
  root_markers = { ".git" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        typeCheckingMode = 'off'
      },
    },
  },

}
