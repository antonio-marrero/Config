return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugin_maps = true

    -- Or, disable per filetype (add as you like)
    -- vim.g.no_python_maps = true
    -- vim.g.no_ruby_maps = true
    -- vim.g.no_rust_maps = true
    -- vim.g.no_go_maps = true
  end,
  config = function()
    require("nvim-treesitter").setup({
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          include_surrounding_white_space = false,
        },

        swap = {
          enable = true,
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
        },
    })

    -- SELECTION keys
    vim.keymap.set({ "x", "o" }, "am", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
    end, {desc = "Select outer part of a method/function definition"})

    vim.keymap.set({ "x", "o" }, "im", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
    end, {desc = "Select inner part of a function call"})

    vim.keymap.set({ "x", "o" }, "ac", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
    end, {desc = "Select inner part of a class"})

    vim.keymap.set({ "x", "o" }, "ic", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
    end, {desc = "Select outer part of a class"})

    vim.keymap.set({ "x", "o" }, "as", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
    end, {desc = "Select local scope"})

    vim.keymap.set({ "x", "o" }, "ai", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@conditional.outer", "textobjects")
    end, {desc = "Select outer part of a conditional"})

    vim.keymap.set({ "x", "o" }, "ii", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@conditional.inner", "textobjects")
    end, {desc = "Select inner part of a conditional"})

    vim.keymap.set({ "x", "o" }, "al", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@loop.outer", "textobjects")
    end, {desc = "Select outer part of a loop"})

    vim.keymap.set({ "x", "o" }, "il", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@loop.inner", "textobjects")
    end, {desc = "Select inner part of a loop"})

    vim.keymap.set({ "x", "o" }, "af", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@call.outer", "textobjects")
    end, {desc = "Select outer part of a function call"})

    vim.keymap.set({ "x", "o" }, "if", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@call.inner", "textobjects")
    end, {desc = "Select inner part of a function call"})

    vim.keymap.set({ "x", "o" }, "a=", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@assignment.outer", "textobjects")
    end, {desc = "Select outer part of an assignment"})

    vim.keymap.set({ "x", "o" }, "i=", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@assignment.inner", "textobjects")
    end, {desc = "Select outer part of an assignment"})

    vim.keymap.set({ "x", "o" }, "l=", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@assignment.lhs", "textobjects")
    end, {desc = "Select left hand side of an assignment"})

    vim.keymap.set({ "x", "o" }, "r=", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@assignment.rhs", "textobjects")
    end, {desc = "Select right hand side of an assignment"})

    vim.keymap.set({ "x", "o" }, "a:", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@property.outer", "textobjects")
    end, {desc = "Select outer part of an object property"})

    vim.keymap.set({ "x", "o" }, "i:", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@property.inner", "textobjects")
    end, {desc = "Select inner part of an object property"})

    vim.keymap.set({ "x", "o" }, "l:", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@property.lhs", "textobjects")
    end, {desc = "Select left part of an object property"})

    vim.keymap.set({ "x", "o" }, "r:", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@property.rhs", "textobjects")
    end, {desc = "Select right hand side of an assignment"})

    vim.keymap.set({ "x", "o" }, "aa", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@parameter.outer", "textobjects")
    end, {desc = "Select outer part of a parameter/argument"})

    vim.keymap.set({ "x", "o" }, "ia", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@parameter.inner", "textobjects")
    end, {desc = "Select inner part of a parameter/argument"})


    -- MOVE keymaps
    vim.keymap.set({ "n", "x", "o" }, "]m", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
    end, {desc = "Next method/function def start"})

    vim.keymap.set({ "n", "x", "o" }, "]f", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@call.outer", "textobjects")
    end, {desc = "Next function call start"})

    vim.keymap.set({ "n", "x", "o" }, "]c", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
    end, {desc = "Next class start"})

    vim.keymap.set({ "n", "x", "o" }, "]l", function()
      require("nvim-treesitter-textobjects.move").goto_next_start({"@loop.inner", "@loop.outer"}, "textobjects")
    end, {desc = "Next loop"})

    vim.keymap.set({ "n", "x", "o" }, "]i", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer", "textobjects")
    end, {desc = "Next conditional start"})

    vim.keymap.set({ "n", "x", "o" }, "]a", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
    end, {desc = "Next parameter start"})

    vim.keymap.set({ "n", "x", "o" }, "]s", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
    end, {desc = "Next scope"})

    vim.keymap.set({ "n", "x", "o" }, "]z", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
    end, {desc = "Next fold"})

    vim.keymap.set({ "n", "x", "o" }, "[m", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
    end, {desc = "Prev method/function def start"})

    vim.keymap.set({ "n", "x", "o" }, "[c", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
    end, {desc = "Prev class start"})

    vim.keymap.set({ "n", "x", "o" }, "[f", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@call.outer", "textobjects")
    end, {desc = "Prev previous call start"})

    vim.keymap.set({ "n", "x", "o" }, "[l", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer", "textobjects")
    end, {desc = "Prev loop"})

    vim.keymap.set({ "n", "x", "o" }, "[i", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@conditional.outer", "textobjects")
    end, {desc = "Prev conditional end"})

    vim.keymap.set({ "n", "x", "o" }, "[a", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
    end, {desc = "Prev parameter start"})

    vim.keymap.set({ "n", "x", "o" }, "[s", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@local.scope", "locals")
    end, {desc = "Prev scope"})

    vim.keymap.set({ "n", "x", "o" }, "[z", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@fold", "folds")
    end, {desc = "Prev fold"})

    vim.keymap.set({ "n", "x", "o" }, "]M", function()
      require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
    end, {desc = "Next method/function def end"})

    vim.keymap.set({ "n", "x", "o" }, "]F", function()
      require("nvim-treesitter-textobjects.move").goto_next_end("@call.outer", "textobjects")
    end, {desc = "Next function call end"})

    vim.keymap.set({ "n", "x", "o" }, "]C", function()
      require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
    end, {desc = "Next class end"})

    vim.keymap.set({ "n", "x", "o" }, "L]", function()
      require("nvim-treesitter-textobjects.move").goto_next_end("@loop.outer", "textobjects")
    end, {desc = "Next loop end"})

    vim.keymap.set({ "n", "x", "o" }, "I]", function()
      require("nvim-treesitter-textobjects.move").goto_next_end("@conditional.outer", "textobjects")
    end, {desc = "Next conditional end"})

    vim.keymap.set({ "n", "x", "o" }, "A]", function()
      require("nvim-treesitter-textobjects.move").goto_next_end("@parameter.inner", "textobjects")
    end, {desc = "Next parameter end"})

    vim.keymap.set({ "n", "x", "o" }, "S]", function()
      require("nvim-treesitter-textobjects.move").goto_next_end("@local.scope", "locals")
    end, {desc = "Next scope end"})

    vim.keymap.set({ "n", "x", "o" }, "Z]", function()
      require("nvim-treesitter-textobjects.move").goto_next_end("@fold", "folds")
    end, {desc = "Next fold end"})


    vim.keymap.set({ "n", "x", "o" }, "[M", function()
      require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
    end, {desc = "Prev method/function def end"})

    vim.keymap.set({ "n", "x", "o" }, "[F", function()
      require("nvim-treesitter-textobjects.move").goto_previous_end("@call.outer", "textobjects")
    end, {desc = "Prev function call end"})

    vim.keymap.set({ "n", "x", "o" }, "[C", function()
      require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
    end, {desc = "Prev class end"})

    vim.keymap.set({ "n", "x", "o" }, "[L", function()
      require("nvim-treesitter-textobjects.move").goto_previous_end("@loop.outer", "textobjects")
    end, {desc = "Prev loop end"})

    vim.keymap.set({ "n", "x", "o" }, "[I", function()
      require("nvim-treesitter-textobjects.move").goto_previous_end("@conditional.outer", "textobjects")
    end, {desc = "Prev conditional end"})

    vim.keymap.set({ "n", "x", "o" }, "[A", function()
      require("nvim-treesitter-textobjects.move").goto_previous_end("@parameter.inner", "textobjects")
    end, {desc = "Prev parameter end"})

    vim.keymap.set({ "n", "x", "o" }, "[S", function()
      require("nvim-treesitter-textobjects.move").goto_previous_end("@local.scope", "locals")
    end, {desc = "Prev scope end"})

    vim.keymap.set({ "n", "x", "o" }, "[Z", function()
      require("nvim-treesitter-textobjects.move").goto_previous_end("@fold", "folds")
    end, {desc = "Prev fold end"})

    -- SWAP keys
    vim.keymap.set("n", "<leader>na", function()
      require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
    end, {desc = "swap parameters/argument with next"})

    vim.keymap.set("n", "<leader>pa", function()
      require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
    end, {desc = "swap parameters/argument with previous"})

    vim.keymap.set("n", "<leader>n:", function()
      require("nvim-treesitter-textobjects.swap").swap_next "@property.inner"
    end, {desc = "swap object property with next"})

    vim.keymap.set("n", "<leader>p:", function()
      require("nvim-treesitter-textobjects.swap").swap_previous "@property.outer"
    end, {desc = "swap object property with previous"})

    -- Tells Neovim to use Tree-sitter for code folding in functions and classes accurately
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    -- Tells Neovim to use Tree-sitter for indentation that understands language-specific rules instead of generic indentation based on brackets.
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

    local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"

    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

  end,
}
