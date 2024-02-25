-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('gr', require('telescope.builtin').lsp_references)
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>de', vim.diagnostic.open_float, 'Get [d]iagnostic')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end, { desc = 'Format current buffer with LSP' })
end

-- Set up nvim-cmp.
local cmp = require'cmp'
local luasnip = require'luasnip'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

require('nvim-autopairs').setup({
  enable_check_bracket_line = false
})

-- local handlers = require('nvim-autopairs.completion.handlers')
--
-- cmp.event:on(
--   'confirm_done',
--   cmp_autopairs.on_confirm_done({
--     filetypes = {
--       -- "*" is a alias to all filetypes
--       ["*"] = {
--         ["("] = {
--           kind = {
--             cmp.lsp.CompletionItemKind.Function,
--             cmp.lsp.CompletionItemKind.Method,
--           },
--           handler = handlers["*"]
--         }
--       },
--       -- Disable for tex
--       tex = false
--     }
--   })
-- )

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- ["<Tab>"] = cmp.mapping(function(fallback)         -- https://github.com/neovim/nvim-lspconfig/wiki/Snippets
        --     if cmp.visible() then
        --         cmp.select_next_item()
        --     elseif luasnip.expand_or_jumpable() then
        --         luasnip.expand_or_jump()
        --     elseif has_words_before() then
        --         cmp.complete()
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'cmp_tabnine' },
        { name = 'nvim_lsp', keyword_length = 2 },
        { name = 'buffer' },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }), -- sort snippet https://www.reddit.com/r/neovim/comments/woih9n/how_to_set_lsp_autocomplete_priority/
})

-- local tabnine = require("cmp_tabnine.config")
-- tabnine:setup({
-- 	max_lines = 1000,
-- 	max_num_results = 20,
-- 	sort = true,
-- 	run_on_every_keystroke = true,
-- 	snippet_placeholder = "..",
--     show_prediction_strength = true
-- })

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
            { name = 'buffer' },
        })
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sql', 'mysql', 'plsql' },
  callback = function()
    cmp.setup.buffer({ sources = { { name = 'vim-dadbod-completion' } } })
  end,
  group = autocomplete_group,
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['pyright'].setup{}
require'lspconfig'.pyright.setup{
    on_attach=on_attach,
    capabilities=capabilities
}

require'lspconfig'.tsserver.setup{
    on_attach=on_attach,
    capabilities=capabilities,
    flags = {allow_incremental_sync = true, debounce_text_changes = 500},
    -- cmd = {'typescript-language-server', '--stdio'}
}

-- require'lspconfig'.sumneko_lua.setup {
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }
--

require'lspconfig'.rust_analyzer.setup({
  on_attach=on_attach,
  capabilities = capabilities,
})

local lspconfig = require('lspconfig')
lspconfig.gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        gopls = {
            gofumpt = true,
        },
    },
    flags = {
        debounce_text_changes = 150,
    },
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  on_attach=on_attach,
  capabilities = capabilities,
}

require'lspconfig'.marksman.setup{
    on_attach=on_attach,
    capabilities = capabilities,
}

-- require'lspconfig'.emmet_ls.setup({
--     -- on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
--     init_options = {
--       html = {
--         options = {
--           -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--           ["bem.enabled"] = true,
--         },
--       },
--     }
-- })

require("luasnip.loaders.from_vscode").lazy_load({
	include = nil, -- Load all languages
	exclude = {'javascript', 'html', 'python'},
})

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.prettier,
    },
})
