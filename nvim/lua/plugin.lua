local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print('Installing packer...')
	local packer_url = 'https://github.com/wbthomason/packer.nvim' vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path}) print('Done.')
	vim.cmd('packadd packer.nvim')
	install_plugins = true
end

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'vim-airline/vim-airline'
	use 'm4xshen/autoclose.nvim'        
	use 'ryanoasis/vim-devicons'

	use "akinsho/toggleterm.nvim"
	use "nvim-lua/plenary.nvim"

	use 'mhinz/vim-startify'

	use 'tpope/vim-fugitive'
	use 'neovim/nvim-lspconfig'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'airblade/vim-rooter'

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	if install_plugins then
		require('packer').sync()
	end
end)

if install_plugins then
	return 
end

vim.g.godot_executable = '/Applications/Godot.app'

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

require('lualine').setup {
	options = {
		theme = 'tokyonight'
	},
	tabline = {
		lualine_a = {},
		lualine_b = {'branch'},
		lualine_c = {'filename'},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	sections = {lualine_c = {'lsp_progress'}, }
}

require'lspconfig'.pyright.setup{}
require'lspconfig'.rust_analyzer.setup{}
