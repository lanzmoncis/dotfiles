-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- Delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Copy inline diagnostic
vim.keymap.set("n", "<leader>cd", function()
	local diags = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
	if diags[1] then
		vim.fn.setreg("+", diags[1].message) -- System clipboard
		print("Copied diagnostic: " .. diags[1].message)
	else
		print("No diagnostic on this line")
	end
end, { desc = "Copy diagnostic on current line" })
