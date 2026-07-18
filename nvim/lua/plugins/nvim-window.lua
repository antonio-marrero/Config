return {
  "yorickpeterse/nvim-window",
  -- keys = {
  --   { "<leader>we", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
  -- },
  config = function ()
    -- <leader>we shows nvim-window options 
    vim.keymap.set("n", "<leader>wj", "<cmd>lua require('nvim-window').pick()<cr>", {desc = "[j]ump to window"})

  end,
}
