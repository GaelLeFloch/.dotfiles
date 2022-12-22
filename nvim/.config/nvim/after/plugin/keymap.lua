-- helper
local nnoremap = require("me.keymap").nnoremap
local vnoremap = require("me.keymap").vnoremap
local xnoremap = require("me.keymap").xnoremap
local silent = { silent = true }

-- Basic
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vnoremap("<leader>s", 'y:%s/<C-r>"//cg<Left><Left><Left>')
nnoremap('<leader>r', ':w | silent !tmux send-keys -t bottom-right "fc -e -" Enter<CR>', {noremap = true, silent=true})
xnoremap('p', '"_dP', silent) -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text
vnoremap('$', '$<Left>', silent)
-- vim.api.nvim_set_keymap('v', 'p', '"_dP', {noremap = true})

-- Telescope
local builtin = require('telescope.builtin')
nnoremap('<C-p>', builtin.find_files, { desc = '[S]earch [F]iles' })
nnoremap('<leader>p', builtin.live_grep, { desc = '[S]earch words' })
nnoremap("<leader>wp", ':lua require("telescope.builtin").find_files({hidden=false, search_dirs={"~/notes"}})<CR>', silent)
nnoremap("<leader>ww", ':e ~/notes/index.md<CR>', silent)
nnoremap("<leader>wd", '<cmd>lua require("me.keymap").daily()<CR>', silent)
nnoremap("<leader>e", ":e <C-R>=expand('%:p:h') . '/'<CR>")

-- Git
nnoremap('<leader>gg', ':LazyGit <CR>', {noremap = true, silent=true})
nnoremap('<leader>gs', ':Gitsigns stage_hunk <CR>', {noremap = true, silent=true})
nnoremap('<leader>gh', ':Gitsigns preview_hunk <CR>', {noremap = true, silent=true})
nnoremap('<esc>', ':nohlsearch <CR>', {noremap = true, silent=true})
nnoremap('<leader>u', ':UndotreeToggle<CR>', {noremap = true, silent=true})

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
-- Easier Moving between splits
-- nnoremap("<c-j>", "<c-w><c-j>")
-- nnoremap("<c-k>", "<c-w><c-k>")
-- nnoremap("<c-l>", "<c-w><c-l>")
-- nnoremap("<c-h>", "<c-w><c-h>")

vim.cmd[[
    function! NetrwMapping()
      nmap <buffer> h -^
      nmap <buffer> l <CR>

      nmap <buffer> . gh

    endfunction

    augroup netrw_mapping
      autocmd!
      autocmd filetype netrw call NetrwMapping()
    augroup END

    cabbr %% <C-R>=expand('%:p:h')<CR>

    imap <a-e> <plug>(emmet-expand-abbr)

]]
-- let g:user_emmet_expandabbr_key = '<a-e>'
