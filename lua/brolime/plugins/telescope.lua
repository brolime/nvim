return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = false,
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files,{})
            vim.keymap.set('n', '<leader>ps', function()
                buitin.grep_string({ search = vim.fn.input('Grep > ')})
            end)
        end
    }
}
