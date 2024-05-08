local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  command = "GoFmt",
  group = format_sync_grp,
})

local nnoremap = require("me.keymap").nnoremap
-- nnoremap('<leader>r', ':w | silent !tmux send-keys -t bottom-right "fc -e -" Enter<CR>', {noremap = true, silent=true})
nnoremap('<leader>r', ':w | exe "silent !tmux send-keys -t bottom-right -X cancel" | SlimeSend1 fc -e -<CR>', {noremap = true, silent=true})
