local indent_settings = {
	-- Two space languages
	lua = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true },
	nix = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true },
	wgsl = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true },
	c0 = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true },

	-- Four space languages
	python = { shiftwidth = 4, softtabstop = 4, expandtab = true },
	c = { shiftwidth = 4, softtabstop = 4, expandtab = true },
	cpp = { shiftwidth = 4, softtabstop = 4, expandtab = true },

	-- Languages with real tabs
	make = { shiftwidth = 4, softtabstop = 4, expandtab = false },
}

vim.api.nvim_create_autocmd("FileType", {
	desc = "Apply correct formatting for different file types",
	group = vim.api.nvim_create_augroup("indentation-rules", { clear = true }),

	-- Use keys from settings table as parameters
	pattern = vim.tbl_keys(indent_settings),
	callback = function(event)
		local settings = indent_settings[event.match]

		if settings then
			for key, value in pairs(settings) do
				vim.bo[event.buf][key] = value
			end
		end
	end,
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Changing RGB color by a percentage
--local function rgb_percent_change(hex_color)
--	local adj_red = math.floor(((hex_color >> 16) & 0xFF) * 0.5)
--	local adj_green = math.floor(((hex_color >> 8) & 0xFF) * 0.5)
--	local adj_blue = math.floor((hex_color & 0xFF) * 0.5)
--
--	return (adj_red << 16) | (adj_green << 8) | adj_blue
--end

-- Load dark background for buffers
vim.api.nvim_create_autocmd("ColorScheme", {
	desc = "Set the buffer backgrounds to be darker",
	callback = function()
		local back_color_int = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
		local adjusted_color_string = "#080808"
		if back_color_int ~= nil then
			--local adjusted_color = rgb_percent_change(back_color_int)
			-- adjusted_color_string = string.format("#%06X", adjusted_color)
		end

		vim.api.nvim_set_hl(0, "SnacksPicker", { bg = adjusted_color_string })
		vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = "#444444", bg = adjusted_color_string })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = adjusted_color_string })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = adjusted_color_string, fg = "#444444" })
	end,
})
