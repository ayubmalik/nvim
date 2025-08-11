-- setup LSP see :help lsp
vim.lsp.enable 'luals'
vim.lsp.enable 'gopls'

-- TODO: apparently blink.cmp does not need the following
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
-- 			vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 			vim.keymap.set('i', '<C-Space>', function()
-- 				vim.lsp.completion.get()
-- 			end)
-- 		end
-- 	end,
-- })
--

-- Java config is slightly different
-- We don't want to call vim.lsp.enable.
-- Rather attach to LSP on filetype

local function jdtls_setup()
  local home_dir = vim.env.HOME
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
  local jdtls_workpace_dir = '/tmp/jdtls/data/' .. project_name
  local jdtls_dir = home_dir .. '/.local/bin/jdtls'
  local java_debug_dir = home_dir .. '/.local/bin/java-debug'
  local jdtls = require 'jdtls'

  local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {

      -- CHANGE_ME
      home_dir .. '/.sdkman/candidates/java/21.0.5-amzn/bin/java', -- or '/path/to/java17_or_newer/bin/java'

      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xms1g',
      '-Xmx2g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens',
      'java.base/java.util=ALL-UNNAMED',
      '--add-opens',
      'java.base/java.lang=ALL-UNNAMED',

      -- CHANGE_ME
      '-jar',
      jdtls_dir .. '/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar',

      -- CHANGE_ME
      '-configuration',
      jdtls_dir .. '/config_linux',

      '-data',
      jdtls_workpace_dir,
    },

    -- required for debug
    on_attach = function(client, bufnr)
      jdtls.setup_dap { hotcodereplace = 'auto' }
      require('jdtls.dap').setup_dap_main_class_configs()
    end,

    -- One dedicated LSP server & client will be started per unique root_dir
    -- root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
      java = {
        eclipse = {
          downloadSources = true,
        },
        configuration = {
          updateBuildConfiguration = 'interactive',
        },
        maven = {
          downloadSources = true,
        },
        format = {
          enabled = true,
        },
        saveActions = {
          organizeImports = true,
        },
        completion = {
          favoriteStaticMembers = {
            'org.junit.jupiter.api.Assertions.*',
            'org.mockito.Mockito.*',
            'java.util.Objects.requireNonNull',
          },
          importOrder = {
            'java',
            'javax',
            'com',
            'org',
          },
        },
        implementationsCodeLens = {
          enabled = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        references = {
          includeDecompiledSources = true,
        },
        signatureHelp = {
          enabled = true,
        },
        sources = {
          organizeImports = {
            starThreshold = 99,
            staticStarThreshold = 99,
          },
        },
      },
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
      bundles = {
        vim.fn.glob(java_debug_dir .. '/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.2.jar', true),
        -- Optionally add test runner support
        -- vim.fn.glob("/path/to/vscode-java-test/server/*.jar", 1)
      },
    },
  }
  -- This starts a new client & server,
  -- or attaches to an existing client & server depending on the `root_dir`.
  require('jdtls').start_or_attach(config)
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'java',
  callback = function(args)
    jdtls_setup()
  end,
})

vim.diagnostic.config {
  virtual_lines = false,
}

local function map(mode, lhs, rhs, description)
  local options = { noremap = true, silent = true, desc = description }
  vim.keymap.set(mode, lhs, rhs, options)
end

map('x', 'grm', '<cmd>lua require("jdtls").extract_method(true)<CR>', 'extract method')
map('n', 'gro', '<cmd>lua require("jdtls").organize_imports()<CR>', 'organise imports')
map('n', 'grv', '<cmd>lua require("jdtls").extract_variable()<CR>', 'extract variable')
map('v', 'grv', '<cmd>lua require("jdtls").extract_variable(true)<CR>', 'extract variable')
map('n', 'grc', '<cmd>lua require("jdtls").extract_constant()<CR>', 'extract constant')
map('v', 'grc', '<cmd>lua require("jdtls").extract_constant(true)<CR>', 'extract constant')
