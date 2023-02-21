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
vim.builtin.which_key.mappings.u = { "<CMD>UndotreeToggle<CR><CMD>UndotreeFocus<CR>", "Undo tree" }

lvim.builtin.which_key.mappings.s.t = {
  function()
    require("telescope").extensions.live_grep_args()
  end,
  "Search Text with Args",
}
