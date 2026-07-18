 return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true }, -- Enables standard ghost text completion
        panel = { enabled = true },
      })
    end,
  }
