vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
          vim.env.XDG_DATA_HOME .. '/nvim/site/pack',
        },
        checkThirdParty = false,
      },
      diagnostics = {
        disable = { 'missing-fields' },
        globals = { 'vim' },
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.enable 'lua_ls'

vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.mod', '.git' },
  single_file_support = true,
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
      codelenses = {
        test = true,
        tidy = true,
      },
    },
  },
})

vim.lsp.enable 'gopls'

vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  root_markers = { 'tsconfig.json', 'package.json', '.git' },
  single_file_support = true,
  init_options = {
    preferences = {
      quotePreference = 'single',
      importModuleSpecifierPreference = 'relative',
    },
  },
})

vim.lsp.enable 'ts_ls'

-- tailwindcss: enable with `vim.lsp.enable 'tailwindcss'`
vim.lsp.config('tailwindcss', {
  cmd = { 'tailwindcss-language-server', '--stdio' },
  filetypes = { 'html', 'css', 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  root_markers = { 'tailwind.config.js', 'tailwind.config.ts', 'package.json', '.git' },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gW', vim.lsp.buf.workspace_symbol, opts)
    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })

    -- autocompletion
    vim.opt.complete:append 'o'

    if client and client:supports_method 'textDocument/completion' then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

vim.diagnostic.config {
  virtual_lines = { current_line = true },
  virtual_text = false,
}
