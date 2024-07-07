vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move hilighted block with J and K --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J keeps cursor at begining --
vim.keymap.set("n", "J", "mzJ`z")

-- better cursor jumping for paging and searching--
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- TEST THIS BEFORE USE greatest remap ever
--vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to system clipboard --
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- fix <C-v> insert --
vim.keymap.set("i", "<C-c>", "<Esc>")

-- I hate capital Q --
vim.keymap.set("n", "Q", "<nop>")
-- TEST THIS -> vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format buffer --
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- easy exit --
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

-- replace current word --
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

