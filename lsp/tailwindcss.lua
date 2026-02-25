vim.lsp.config['tailwindcss'] = {
  cmd = { 'tailwindcss-language-server', '--stdio' },
  filetypes = {
    'html',
    'css',
    'typescript',
    'typescriptreact',
    'javascript',
    'javascriptreact',
  },
  root_markers = { 'tailwind.config.js', 'tailwind.config.ts', 'package.json', '.git' },
}
