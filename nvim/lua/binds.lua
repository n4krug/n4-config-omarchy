vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Linewrap
vim.keymap.set("n", "<leader>w", function()
  vim.wo.wrap = not vim.wo.wrap
end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set({ "n", "v", "i" }, "<C-c>", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set('n', '<leader>t', ':term bash<CR>')

vim.keymap.set("v", "<leader>p", "\"_dP")
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("n", "dd", "\"_dd")
vim.keymap.set("n", "<delete>", "\"_x")
vim.keymap.set("n", "x", "\"_x")
vim.keymap.set("n", "<leader>yy", "\"+yy")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

vim.keymap.set("n", "<leader><Left>", "<C-w>h")
vim.keymap.set("n", "<leader><Down>", "<C-w>j")
vim.keymap.set("n", "<leader><Up>", "<C-w>k")
vim.keymap.set("n", "<leader><Right>", "<C-w>l")

vim.keymap.set("n", "<leader>s", ":vsplit<CR>")
vim.keymap.set("n", "<leader>v", ":split<CR>")

vim.keymap.set("n", "<leader>bb", "<C-^><CR>") 

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input(" ") })
end)

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)


vim.api.nvim_create_user_command('QuickPush', '! git add . && git commit -m "note updates" && git push', {})
