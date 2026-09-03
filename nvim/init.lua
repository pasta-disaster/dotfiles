require("config.lazy")

-- 4 spaces instead of tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- navigate to previous/next line with left/right arrow keys
vim.opt.whichwrap:append("<,>,[,]")

-- Switch to next/previous buffer
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { silent = true })

-- Or use leader key combinations
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { silent = true })
