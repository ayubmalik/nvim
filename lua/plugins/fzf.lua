-- [[ start fzf ]]
return {
	'ibhagwan/fzf-lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('fzf-lua').setup {
			defaults = {
				file_icons = false,
				git_icons = false,
				color_icons = false,
			},
		}

		local fzf = require 'fzf-lua'
		-- vim.keymap.set('n', '<leader>sd', fzf.diagnostics_document, { desc = '[S]earch [D]iagnostics' })
		vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
		vim.keymap.set('n', '<leader>s.', fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		-- vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = '[S]earch [G]rep project files' })
		vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [H]elp' })
		vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
		vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = '[S]earch [R]esume' })
		vim.keymap.set('n', '<leader>ss', fzf.resume, { desc = '[S]earch [S]ymbols' })
		-- vim.keymap.set('n', '<leader>sw', fzf.grep_cword, { desc = '[S]earch current [W]ord' })
		vim.keymap.set('n', '<leader>s/', fzf.live_grep, { desc = '[S]earch [/] in Project Files' })
		vim.keymap.set('n', '<leader>/', fzf.lgrep_curbuf, { desc = '[/] Fuzzily search in current buffer' })
		vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = '[ ] Find existing buffers' })
	end,
}
