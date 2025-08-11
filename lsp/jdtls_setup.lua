local M = {}

function M:setup()
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

      -- CHANGE_ME:
      '/home/ayub-coachusa/.sdkman/candidates/java/21.0.5-amzn/bin/java', -- or '/path/to/java17_or_newer/bin/java'
      -- depends on if `java` is in your $PATH env variable and if it points to the right version.

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

      -- CHANGE_ME:
      '-jar',
      jdtls_dir .. '/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar',
      -- Must point to the                                                     Change this to
      -- eclipse.jdt.ls installation                                           the actual version

      -- CHANGE_ME:
      '-configuration',
      jdtls_dir .. '/config_linux',
      -- Must point to the                      Change to one of `linux`, `win` or `mac`
      -- eclipse.jdt.ls installation            Depending on your system.

      -- CHANGE_ME:
      -- See `data directory configuration` section in the README
      '-data',
      jdtls_workpace_dir,
    },

    -- required for debug
    on_attach = function(client, bufnr)
      jdtls.setup_dap { hotcodereplace = 'auto' }
      require('jdtls.dap').setup_dap_main_class_configs()
      jdtls.add_commands()
    end,

    -- CHANGE_ME:
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew' },

    -- Here you can configure eclipse.jdt.ls specific settings
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
  jdtls.start_or_attach(config)
end
