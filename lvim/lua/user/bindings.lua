-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
vim.keymap.set("i", "jk", "<Esc>")
lvim.keys.normal_mode["q"] = ":quit<cr>"

lvim.builtin.terminal.open_mapping = [[<c-t>]]
lvim.builtin.which_key.mappings["U"] = { "<CMD>UndotreeToggle<CR><CMD>UndotreeFocus<CR>", "Undo tree" }

local opts = { noremap = true, silent = true }
-- Normal-mode commands
-- vim.keymap.set('n', '<C-j>', ':MoveLine(1)<CR>', opts)
-- vim.keymap.set('n', '<C-k>', ':MoveLine(-1)<CR>', opts)
-- vim.keymap.set('n', '<C-h>', ':MoveHChar(-1)<CR>', opts)
-- vim.keymap.set('n', '<C-l>', ':MoveHChar(1)<CR>', opts)
-- vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
-- vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<C-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<C-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<C-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<C-l>', ':MoveHBlock(1)<CR>', opts)
