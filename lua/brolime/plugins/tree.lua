return {
    "nvim-tree/nvim-tree.lua",
    name = 'nvim-tree',
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {}
        vim.keymap.set('n', '<leader>to' ,'<Cmd>NvimTreeOpen<CR>', {silent = true})
        vim.keymap.set('n', '<leader>tc' ,'<Cmd>NvimTreeClose<CR>', {silent = true})
    end,
}
