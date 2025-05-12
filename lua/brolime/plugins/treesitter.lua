return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			auto_install = true,
			ensure_installed = {},
			sync_install = false,
			highlight = {
                enable = true,
            },
			indent = { enable = true },
		})
	end,
}
