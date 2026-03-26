local map = vim.keymap.set

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Right window" })

-- Better indenting in visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Clear search highlight on Esc
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Buffer navigation
map("n", "<S-l>", "<cmd>bnext<CR>",    { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Move lines up/down
map("n", "<A-j>", "<cmd>m .+1<CR>==",     { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==",     { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv",    { desc = "Move lines down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv",    { desc = "Move lines up" })

-- Save / quit
map("n", "<leader>w", "<cmd>w<CR>",  { desc = "Save" })
map("n", "<leader>q", "<cmd>q<CR>",  { desc = "Quit" })

-- Diagnostics (navigate inline)
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
