return {
  cmd = {
    'fortls',
    '--lowercase_intrinsics',
    '--hover_signature',
    '--hover_language=fortran',
    '--use_signature_help',
  },
  filetypes = { 'f', 'f90', 'fortran' },
  root_markers = { ".git" },
  settings = {}
}
