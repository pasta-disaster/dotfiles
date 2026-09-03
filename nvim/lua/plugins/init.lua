return {
--    {
--        "nvim-treesitter/nvim-treesitter",
--        build = ":TSUpdate", -- Ensures parsers can be updated
--        event = "BufReadPost", -- Lazy load on file read
--        opts = {
--            -- Tell treesitter to install and enable the 'lua' parser
--            ensure_installed = { "lua", "vim", "vimdoc" },
--            highlight = { enable = true },
--        },
--        config = function(_, opts)
--          require("nvim-treesitter.configs").setup(opts)
--        end,
--    },

    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter")
            treesitter.setup()
            treesitter.install { "lua", "vim", "vimdoc" }

            vim.api.nvim_create_autocmd('FileType', {
                pattern = { "lua", "vim", "vimdoc" },
                callback = function()
                    vim.treesitter.start()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            })
        end
    },

    {
        "Bishop-Fox/colorblocks.nvim",
        config = function()
            require("colorblocks").setup({
                symbol = "v󱡕",
                virt_text_pos = "eol",
                mode = "fg",
                section = { "S", "  ", "The color is: ", "H" },
                filetypes = { "lua", "css" },
            })
        end,
    },
  
    {
        "catppuccin/nvim",
        lazy = false,      -- Load immediately on startup
        priority = 1000,   -- Ensure it loads before any other plugins
        config = function()
            -- Set terminal colors (optional but recommended)
            vim.opt.termguicolors = true

            -- The actual command to set the scheme
            -- Use the variant you want (e.g., 'tokyonight-night', 'tokyonight-storm')
            vim.cmd.colorscheme "catppuccin-macchiato" 
        end,
    },
  
    {
        "sidebar-nvim/sidebar.nvim",
        lazy = false,
        config = function(_)
            require("sidebar-nvim").setup({
                open = true,
                sections = { "datetime", "files", "git", "diagnostics", "todos" },
                files = {
    		        icon = "",
	    	        show_hidden = "true",
		            ignored_paths = { "%.git$" },
                }
	        })
        end
    },
   
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup{}
        end
    },
}
