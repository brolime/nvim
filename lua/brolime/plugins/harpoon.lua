return {
    'ThePrimeagen/harpoon',
    name = 'harpoon',
    lazy = true,
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        -- harpoon menu --
        vim.keymap.set("n", "<leader>ha", mark.add_file)
        vim.keymap.set("n", "<leader>hl", ui.toggle_quick_menu)
        -- harpoon quick navigation --
        vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end)
        vim.keymap.set("n", "<leader>h5", function() ui.nav_file(5) end)
        vim.keymap.set("n", "<leader>h6", function() ui.nav_file(6) end)
        vim.keymap.set("n", "<leader>h7", function() ui.nav_file(7) end)
        vim.keymap.set("n", "<leader>h8", function() ui.nav_file(8) end)
        vim.keymap.set("n", "<leader>h9", function() ui.nav_file(9) end)
    end,
}
