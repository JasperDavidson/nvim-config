-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set font
vim.g.have_nerd_font = true

-- Line number configuration
vim.o.number = true
vim.o.relativenumber = true

-- Don't show mode (see status line)
vim.o.showmode = false

-- Sync clipboard between OS and nvim
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Keep signcolumn on
vim.o.signcolumn = "yes"

-- Highlight cursor line
vim.o.cursorline = true

-- Minimum lines above/below cursor
vim.o.scrolloff = 10

-- Confirm making unsaved changes
vim.o.confirm = true

-- Save undo history
vim.o.undofile = true

-- They call me verstappen
vim.opt.timeoutlen = 0 -- Adjust this to your preference

-- Enable native autocompletion
-- vim.o.autocomplete = true

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Window navigation keybinds
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Escape from highlight (e.g. after substitution)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Indent settings
local indent_settings = {
	-- Two space languages
	lua = { shiftwidth = 2, softtabstop = 2, expandtab = true },
	nix = { shiftwidth = 2, softtabstop = 2, expandtab = true },
	wgsl = { shiftwidth = 2, softtabstop = 2, expandtab = true },
	c0 = { shiftwidth = 2, softtabstop = 2, expandtab = true },

	-- Four space languages
	python = { shiftwidth = 4, softtabstop = 4, expandtab = true },
	c = { shiftwidth = 4, softtabstop = 4, expandtab = true },
	cpp = { shiftwidth = 4, softtabstop = 4, expandtab = true },

	-- Languages with real tabs
	make = { shiftwidth = 4, softtabstop = 4, expandtab = false },
}

-- Enable true colors
vim.o.termguicolors = true

require("core.autocmds")
require("core.andrew-sync")
