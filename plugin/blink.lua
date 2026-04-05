vim.pack.add({ "https://github.com/saghen/blink.cmp" })

require("blink.cmp").setup({
	keymap = { preset = "super-tab" },

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	signature = { enabled = true },
})
