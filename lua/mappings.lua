require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
local nomap = vim.keymap.del
nomap("n", "<A-h>")  -- remove normal mode binding
nomap("t", "<A-h>")  -- remove terminal mode binding
-- nomap("i", "<A-l>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
