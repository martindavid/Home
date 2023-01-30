local telescope = require("telescope")
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

lvim.builtin.telescope.pickers.find_files = {
  layout_config = { width = 0.6, height = 0.6, preview_width = 0.5, prompt_position = "top" },
  layout_strategy = "horizontal",
}

lvim.builtin.telescope.pickers.live_grep = {
  layout_config = { height = 0.8, width = 0.8, preview_cutoff = 120, preview_width = 0.6, prompt_position = "top" },
  layout_strategy = "horizontal"
}

lvim.autocommands = {
  { "User",
    { pattern = { "TelescopePreviewerLoaded" }, command = "setlocal number" }
  }
}
