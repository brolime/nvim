return{
    'mbbill/undotree',
    name = 'undotree',
    lazy = true,
    config = function()
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
}


