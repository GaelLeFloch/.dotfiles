local ls = require "luasnip"
-- Exemple snippets https://github.com/sbulav/dotfiles/blob/master/nvim/lua/config/snippets.lua 
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.add_snippets(nil, {
    javascript = {
        snip("cl", {
            text "console.log(",
            insert(0),
            text ");",
        }),
    },
})
