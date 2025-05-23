return {
    'alexghergh/nvim-tmux-navigation',
    config = function()
        local nvim_tmux_nav = require('nvim-tmux-navigation')
        nvim_tmux_nav.setup {
            disable_when_zoomed = false -- defaults to false
        }
        vim.keymap.set('n', "<C-a>h", nvim_tmux_nav.NvimTmuxNavigateLeft)
        vim.keymap.set('n', "<C-a>j", nvim_tmux_nav.NvimTmuxNavigateDown)
        vim.keymap.set('n', "<C-a>k", nvim_tmux_nav.NvimTmuxNavigateUp)
        vim.keymap.set('n', "<C-a>l", nvim_tmux_nav.NvimTmuxNavigateRight)
    end
}
