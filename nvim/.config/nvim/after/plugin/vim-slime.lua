vim.g.slime_target = 'tmux'
vim.g.slime_no_mappings = 1
vim.g.slime_dont_ask_default = 1
vim.b.slime_bracketed_paste = 1

vim.cmd[[
    let g:slime_default_config = {"socket_name": "default", "target_pane": "bottom-right"}
]]
