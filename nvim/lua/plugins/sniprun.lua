return {
  {
    "michaelb/sniprun",
    branch = "master",
    build = "sh ./install.sh",
    config = function()
      require("sniprun").setup({
        display = { "TempFloatingWindow" },
        -- display = { "Classic" },
        display_options = {
          border = "rounded",
        },
        -- Customise interpreters to catch new markdown block languages
        interpreter_options = {
          Generic = {
            -- Map the markdown tag "graph-easy" to use the system executable
            ["graph-easy"] = {
              command = "graph-easy",
              compiler = "", -- No compiler needed
              args = { "--as=boxart" }, -- Automatically output boxart
              extension = ".txt",
            }
          }
        }
      })
    end,
  }
}
