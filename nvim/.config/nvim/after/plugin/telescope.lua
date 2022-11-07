require('telescope').setup{
    defaults = {
        -- file_ignore_patterns = {".git"},
        mappings = {
            i = {
                ['<ESC>'] = require('telescope.actions').close, 
            }
        },
        preview = {
            timeout = 150, -- :help telescope.defaults.preview
            treesitter = false,
            -- filesize_limit = 0.5
        }
    },
    pickers = {
        find_files = {
            hidden = true,
        }
    }
}
