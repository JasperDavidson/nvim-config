--vim.pack.add({ "https://github.com/wtfox/jellybeans.nvim" })
--vim.cmd.colorscheme("jellybeans")
vim.pack.add({
	"https://github.com/daedlock/matugen.nvim",
})

require("matugen").setup({
	colors_path = "~/.config/matugen/colors.json",
})
vim.cmd.colorscheme("matugen")

-- Allow for transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
