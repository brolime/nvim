return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require("dashboard").setup({
            theme = 'hyper',
            disable_move = false,       -- default is false disable move keymap for hyper
            shortcut_type = 'letter',      -- shortcut type 'letter' or 'number'
            shuffle_letter = false,     -- default is false, shortcut 'letter' will be randomize, set to false to have ordered letter
            change_to_vcs_root = false, -- default is false,for open file in hyper mru. it will change to the root of vcs
            config = {
                week_header = { enable = true },
                packages = { enable = true },
            },
            hide = {
                statusline = false,       -- hide statusline default is true
                tabline = false,          -- hide the tabline
                winbar = false,           -- hide winbar
            },
            preview = {
                file_path = true,        -- preview file path
                file_height = true,      -- preview file height
                file_width = true,       -- preview file width
            },
        })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
