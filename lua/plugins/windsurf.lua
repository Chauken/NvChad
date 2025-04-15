return {
    {
    "Exafunction/windsurf.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
            -- Keep nvim-cmp source enabled (this is the default)
            enable_cmp_source = true,
            -- Enable virtual text completions
            virtual_text = {
                enabled = true,
                -- These are the defaults
                manual = false,
                -- Enable for all filetypes by default
                filetypes = {},
                default_filetype_enabled = true,
                -- How long to wait before requesting completions
                idle_delay = 75,
                -- Virtual text priority (high to show above other plugins)
                virtual_text_priority = 65535,
                -- Key bindings enabled
                map_keys = true,
                -- Key bindings for managing completions
                key_bindings = {
                    -- Accept the current completion
                    accept = "<M-f>",
                    -- Accept the next word
                    accept_word = false,
                    -- Accept the next line
                    accept_line = false,
                    -- Clear the virtual text
                    clear = false,
                    -- Cycle to next completion
                    next = "<M-]>",
                    -- Cycle to previous completion
                    prev = "<M-[>",
                }
            }
        })
    end
    },
}
