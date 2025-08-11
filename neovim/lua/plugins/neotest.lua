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
				require("neotest-go")({
					experimental = {
						test_table = true,
					},
				}),
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
		vim.keymap.set("n", "<leader>tn", function()
			neotest.run.run()
		end, { noremap = true, silent = true, desc = "Run nearest test" })
		vim.keymap.set("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { noremap = true, silent = true, desc = "Run all tests in file" })
		vim.keymap.set("n", "<leader>td", function()
			neotest.run.run({ strategy = "dap" })
		end, { noremap = true, silent = true, desc = "Debug nearest test" })
		vim.keymap.set("n", "<leader>ts", function()
			neotest.run.stop()
		end, { noremap = true, silent = true, desc = "Stop running test" })
		vim.keymap.set("n", "<leader>ta", function()
			neotest.run.attach()
		end, { noremap = true, silent = true, desc = "Attach to running test" })

		-- Extra Neotest features
		vim.keymap.set("n", "<leader>tw", function()
			neotest.watch.watch()
		end, { noremap = true, silent = true, desc = "Watch test file" })

		vim.keymap.set("n", "<leader>to", function()
			neotest.output.open({ enter = true })
		end, { noremap = true, silent = true, desc = "Open test output" })
		vim.keymap.set("n", "<leader>tp", function()
			neotest.output_panel.open()
		end, { noremap = true, silent = true, desc = "Open output panel" })
		vim.keymap.set("n", "<leader>tsu", function()
			neotest.summary.open()
		end, { noremap = true, silent = true, desc = "Open test summary" })

		-- Toggle summary and output
		vim.keymap.set("n", "<leader>to", function()
			neotest.output_panel.toggle()
		end, { noremap = true, silent = true, desc = "Toggle output panel" })
		vim.keymap.set("n", "<leader>tsu", function()
			neotest.summary.toggle()
		end, { noremap = true, silent = true, desc = "Toggle test summary" })
	end,
}
