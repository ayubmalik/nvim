-- setup LSP see :help lsp
vim.lsp.enable('luals')
vim.lsp.enable('gopls')

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
			vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
			vim.keymap.set('i', '<C-Space>', function()
				vim.lsp.completion.get()
			end)
		end
	end,
})


-- Java config is slightly different
-- We don't want to call vim.lsp.enable.
-- Rather attach to LSP on filetype


local function jdtls_setup()
	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	local workspace_dir = "/tmp/jdtls/data/" .. project_name
	local jdtls_dir = "/home/ayub-coachusa/.local/bin/jdtls"

	vim.opt_local.shiftwidth = 4
	vim.opt_local.tabstop = 4
	vim.opt_local.softtabstop = 4
	vim.opt_local.expandtab = true

	local config = {
		-- The command that starts the language server
		-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
		cmd = {

			-- 💀
			"/home/ayub-coachusa/.sdkman/candidates/java/21.0.5-amzn/bin/java", -- or '/path/to/java17_or_newer/bin/java'
			-- depends on if `java` is in your $PATH env variable and if it points to the right version.

			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
			"-Dosgi.bundles.defaultStartLevel=4",
			"-Declipse.product=org.eclipse.jdt.ls.core.product",
			"-Dlog.protocol=true",
			"-Dlog.level=ALL",
			"-Xms1g",
			"-Xmx1g",
			"--add-modules=ALL-SYSTEM",
			"--add-opens",
			"java.base/java.util=ALL-UNNAMED",
			"--add-opens",
			"java.base/java.lang=ALL-UNNAMED",

			-- 💀
			"-jar",
			jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar",
			-- Must point to the                                                     Change this to
			-- eclipse.jdt.ls installation                                           the actual version

			-- 💀
			"-configuration",
			jdtls_dir .. "/config_linux",
			-- Must point to the                      Change to one of `linux`, `win` or `mac`
			-- eclipse.jdt.ls installation            Depending on your system.

			-- 💀
			-- See `data directory configuration` section in the README
			"-data",
			workspace_dir,
		},

		-- 💀
		-- This is the default if not provided, you can remove it. Or adjust as needed.
		-- One dedicated LSP server & client will be started per unique root_dir
		-- root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

		-- Here you can configure eclipse.jdt.ls specific settings
		-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
		-- for a list of options
		settings = {
			java = {},
		},

		-- Language server `initializationOptions`
		-- You need to extend the `bundles` with paths to jar files
		-- if you want to use additional eclipse.jdt.ls plugins.
		--
		-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
		--
		-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
		init_options = {
			bundles = {},
		},
	}
	-- This starts a new client & server,
	-- or attaches to an existing client & server depending on the `root_dir`.
	require("jdtls").start_or_attach(config)
end

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'java',
	callback = function(args)
		jdtls_setup()
	end
})

vim.diagnostic.config({
	virtual_lines = false
	-- virtual_lines = {
	-- 	current_line = true,
	-- },
})
