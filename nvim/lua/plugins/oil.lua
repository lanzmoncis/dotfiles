return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons

	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
			float = {
				padding = 2,
				border = "rounded",
			},
		})
		vim.keymap.set("n", "<space>-", require("oil").toggle_float)
	end,
}
