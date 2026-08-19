return {
	"adibhanna/yukinord.nvim",
	priority = 1000,
	config = function()
		require("yukinord").setup({
			transparent = true,
			transparent_sidebar = true,
		})
		vim.cmd([[colorscheme yukinord]])
	end,
}
