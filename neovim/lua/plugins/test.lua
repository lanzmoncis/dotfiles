return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"mfussenegger/nvim-dap",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-jest",
		"marilari88/neotest-vitest",
	},
	config = function()
		local neotest = require("neotest")

		neotest.setup({
			adapters = {
				require("neotest-go"),
				require("neotest-vitest"),
				require("neotest-jest")({
					jestCommand = "npm test --",
					jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function()
						return vim.fn.getcwd()
					end,
				}),
			},
		})

		-- Keymaps for Neotest
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tn",
			":lua require('neotest').run.run()<CR>",
			{ noremap = true, silent = true }
		) -- Runs the nearest test.
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tf",
			":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
			{ noremap = true, silent = true }
		) -- Runs all tests in the current file.
		vim.api.nvim_set_keymap(
			"n",
			"<leader>td",
			":lua require('neotest').run.run({strategy = 'dap'})<CR>",
			{ noremap = true, silent = true }
		) -- Debugs the nearest test (requires nvim-dap).
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ts",
			":lua require('neotest').run.stop()<CR>",
			{ noremap = true, silent = true }
		) -- Stops the nearest running test.
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ta",
			":lua require('neotest').run.attach()<CR>",
			{ noremap = true, silent = true }
		) -- Attaches to the nearest running test.

		-- Keymaps for extra Neotest features
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tw",
			":lua require('neotest').watch.watch()<CR>",
			{ noremap = true, silent = true }
		) -- Watch tests
		vim.api.nvim_set_keymap(
			"n",
			"<leader>to",
			":lua require('neotest').output.open({ enter = true })<CR>",
			{ noremap = true, silent = true }
		) -- Output window
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tp",
			":lua require('neotest').output_panel.open()<CR>",
			{ noremap = true, silent = true }
		) -- Output panel
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tsu",
			":lua require('neotest').summary.open()<CR>",
			{ noremap = true, silent = true }
		) -- Summary window

		--Keymaps for summary and output toggle
		vim.api.nvim_set_keymap(
			"n",
			"<leader>to",
			":lua require('neotest').output_panel.toggle()<CR>",
			{ noremap = true, silent = true }
		) -- Toggle Output window
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tsu",
			":lua require('neotest').summary.toggle()<CR>",
			{ noremap = true, silent = true }
		) -- Toggle Summary window
	end,
}
