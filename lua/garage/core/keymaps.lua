vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-c>")

keymap.set("n", "<leader>sh", "<C-w>v") -- split window hoirzontally
keymap.set("n", "<leader>sv", "<C-w>s") -- split window vertically
keymap.set("n", "<leader>se", "<C-w>=") --make equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close window

keymap.set("n", "<leader>pf", ":Ex<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

--nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
