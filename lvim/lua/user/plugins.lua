lvim.plugins = {
  "olimorris/onedarkpro.nvim",
  "lewis6991/impatient.nvim",
  "wakatime/vim-wakatime",
  "mbbill/undotree",
  "tpope/vim-rhubarb",
  "itspriddle/vim-marked",
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    branch = "v2",
    config = function()
      require("hop").setup()

      vim.api.nvim_set_keymap("n", "f", ":HopChar1<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 25; -- Height of the floating window
        default_mappings = true; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>");
        vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>");
        vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>");
      }
    end
  },
}
