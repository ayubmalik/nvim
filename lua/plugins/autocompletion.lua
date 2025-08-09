-- [[ start blink.cmp ]]
return {
	'saghen/blink.cmp',
	enabled = true,
	dependencies = { 'rafamadriz/friendly-snippets' },
	opts = {
		keymap = { preset = 'enter' },
		appearance = {
			nerd_font_variant = 'mono'
		},

		completion = {
			documentation = { auto_show = false },
			menu = {
				draw = {
					columns = {
						{ "label",     "label_description", gap = 1 },
						{ "kind_icon", "kind" }
					},
				}
			},
		},
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
		fuzzy = { implementation = "lua" }
	},
	opts_extend = { "sources.default" }
}
