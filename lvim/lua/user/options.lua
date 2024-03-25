lvim.log.level = "warn"
lvim.format_on_save = {
  enabled = true,
  pattern = { "*.lua", "*.ts", "*.tsx", "*.js", "*.jsx", "*.css", ".scss" },
  timeout = 1000,
}
lvim.colorscheme = "tokyonight-night"
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.textwidth = 120
vim.opt.wrap = true

vim.filetype.add({
  extension = {
    mdx = "markdown"
  }
})
vim.opt.hidden = true
vim.g.marked_app = "Marked"

-- TODO: User Config for predefined plugins
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.renderer.icons.show.file = true
lvim.builtin.nvimtree.setup.filters.dotfiles = false
lvim.builtin.nvimtree.setup.view.relativenumber = true
lvim.builtin.nvimtree.setup.view.number = true
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"


lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "live_grep_args")
  -- any other extensions loading
end

-- copilot
-- lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
-- table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })
