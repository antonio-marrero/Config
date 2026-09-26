-- Set our leader keybinding to space
-- Anywhere you see <leader> in a keymapping specifies the space key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Exit Vim's terminal mode
-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- OPTIONAL: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Easily split windows
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "[W]indow Split [H]orizontal" })

vim.keymap.set("n", "<C-w>y", "<C-w>15>", { desc = "[W]indow enlarge horizontal" })
vim.keymap.set("n", "<C-w>u", "<C-w>10+", { desc = "[W]indow enlarge vertical" })

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Alternative key for Escape" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- Clrt-a to select all
vim.keymap.set("n", "<C-a>", 'ggVG', { desc = "Select All"})
-- Paste without losing the register
-- vim.keymap.set("x", "leader p", "\"_dP", { desc = "Keep register after pasting" })

-- To zoom in and out the current window
local is_zoomed = false
local zoom_restcmd = ""

-- Add a keybinding to toggle zooming the current window
vim.keymap.set("n", "<C-w>z", function()
  if is_zoomed then
    vim.cmd(zoom_restcmd)
    is_zoomed = false
  else
    zoom_restcmd = vim.fn.winrestcmd()
    vim.cmd("wincmd _ | wincmd |")
    is_zoomed = true
  end
end, { desc = "Toggle window [z]oom" })

-- Open the quickfix list with diagnostics
vim.keymap.set("n", "<leader>q", function()
  vim.diagnostic.setqflist()
end, { desc = "Add diagnostics to [q]uickfix list", silent = true })

-- Open and close the quickfix list
 vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>", { desc = "Qui[c]kfix [o]pen" })
 vim.keymap.set("n", "<leader>cc", "<cmd>cclose<CR>", { desc = "Qui[c]kfix [c]lose" })
