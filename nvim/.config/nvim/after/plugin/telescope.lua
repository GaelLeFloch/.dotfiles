local fb_actions = require "telescope._extensions.file_browser.actions"
local actions = require "telescope.actions"

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
        },
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            width = 0.75,
            height = 0.70,
            preview_cutoff = 120,
        }
    },
    pickers = {
        find_files = {
            hidden = true,
        }
    },
    extensions = {
        file_browser = {
          theme = "ivy",
          hidden = { file_browser = true, folder_browser = true },
          hide_parent_dir = true,
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
              ["<a-h>"] = fb_actions.goto_parent_dir,
              ["<a-l>"] = actions.select_default,
              ["<a-j>"] = actions.move_selection_next,
              ["<a-k>"] = actions.move_selection_previous,
            },
            ["n"] = {
              -- your custom normal mode mappings
              ["h"] = fb_actions.goto_parent_dir,
              ["l"] = actions.select_default,
            },
          },
        },
      }
}

require("telescope").load_extension "file_browser"
