-- helper
local nnoremap = require("me.keymap").nnoremap
local vnoremap = require("me.keymap").vnoremap
local silent = { silent = true }

-- Basic
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
nnoremap('<leader>r', ':w | silent !tmux send-keys -t bottom-right "fc -e -" Enter<CR>', {noremap = true, silent=true})
vnoremap('p', '"_dP', silent)
-- vim.api.nvim_set_keymap('v', 'p', '"_dP', {noremap = true})

-- Telescope
local builtin = require('telescope.builtin')
nnoremap('<C-p>', builtin.find_files, { desc = '[S]earch [F]iles' })
nnoremap('<leader>p', builtin.live_grep, { desc = '[S]earch words' })
nnoremap("<leader>wp", ':lua require("telescope.builtin").find_files({hidden=false, search_dirs={"~/Dendron-Tutorial/vault"}})<CR>', silent)

-- Git
nnoremap('<leader>gg', ':LazyGit <CR>', {noremap = true, silent=true})
nnoremap('<leader>gs', ':Gitsigns stage_hunk <CR>', {noremap = true, silent=true})
nnoremap('<leader>gh', ':Gitsigns preview_hunk <CR>', {noremap = true, silent=true})
nnoremap('<esc>', ':nohlsearch <CR>', {noremap = true, silent=true})

-- Harpoon
nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, silent)

nnoremap("&", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("é", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("\"", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("\'", function() require("harpoon.ui").nav_file(4) end, silent)
nnoremap("(", function() require("harpoon.ui").nav_file(5) end, silent)

nnoremap("<a-h>", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<a-j>", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<a-k>", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<a-l>", function() require("harpoon.ui").nav_file(4) end, silent)
-- nnoremap("<a-m>", ":e# <CR>", silent)

