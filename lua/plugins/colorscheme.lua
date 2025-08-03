-- [[ start tokyo night ]]
return {
	'folke/tokyonight.nvim',
	priority = 1000,                       -- Make sure to load this before all the other start plugins.
	init = function()
		vim.cmd.colorscheme 'tokyonight-night' -- 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
		vim.cmd.hi 'Comment gui=none'        -- You can configure highlights by doing something like:
	end,
	opts = {
		on_colors = function(colors)
			colors.bg = '#15151e'
		end,
	},
}
