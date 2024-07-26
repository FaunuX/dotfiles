vim.api.nvim_set_keymap( "n", "<C-v>", '"+p', {noremap = true, silent = true})

function toggle_theme()
	if vim.o.background == 'light' then
		vim.o.background = 'dark'
		vim.cmd('colorscheme tokyonight-night')
	else
		vim.o.background = 'light'
		vim.cmd('colorscheme tokyonight-day')
	end
end

vim.g.mapleader = ' '

require("toggleterm").setup({
	size=20,
	direction="float"
})

local Terminal  = require('toggleterm.terminal').Terminal
local wordle = Terminal:new({ cmd = "~/go/bin/clidle", hidden = true })
local parrot = Terminal:new({ cmd = "curl parrot.live", hidden = true })
local ipython = Terminal:new({ cmd = "ipython", hidden = true })
local nushell = Terminal:new({ cmd = "nu", hidden = true })

function _wordle_toggle()
	wordle:toggle()
end

function _parrot_toggle()
	parrot:toggle()
end

function _ipython_toggle()
	ipython:toggle()
end

function _nushell_toggle()
	nushell:toggle()
end

require("nvim-tree").setup({ 
	sync_root_with_cwd = true, 
	view = { 
		float = { 
			enable = true ,
			open_win_config = {
				border = "none"
			}
		}
	}
})


vim.api.nvim_set_keymap( "n", "<leader>ter", "<cmd>lua _nushell_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap( "n", "<leader>fil", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap( "n", "<leader>out", ":w | qa!<CR>", {noremap = true, silent = true})
vim.keymap.set( "n", "<leader>tem", toggle_theme, {noremap = true, silent = true})
vim.api.nvim_set_keymap( "n", "<leader>git", ":Git add . | Git commit | Git push<CR>", {noremap = true, silent = true})
vim.keymap.set( "n", "<leader>def", vim.lsp.buf.definition, { noremap=true, silent=true, buffer=bufnr })
vim.api.nvim_set_keymap("n", "<leader>wor", "<cmd>lua _wordle_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>par", "<cmd>lua _parrot_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>ipy", "<cmd>lua _ipython_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>win", "<C-w><C-w>", {noremap = true, silent = true})

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
