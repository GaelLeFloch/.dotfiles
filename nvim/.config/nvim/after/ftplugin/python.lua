local vnoremap = require("me.keymap").vnoremap
local nnoremap = require("me.keymap").nnoremap
vnoremap('<leader>r', '<Plug>SlimeRegionSend', {noremap = true, silent=true})
nnoremap('<leader>r', ':SlimeSend<CR>', {noremap = true, silent=true})
