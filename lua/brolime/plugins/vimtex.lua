return{
    'lervag/vimtex',
    lazy = true,
    event = "BufRead *.tex",
    init = function ()
        --vim.g.vimtex_view_method = 'zathura'
        --vim.g.vimtex_view_general_options = '<C-r>=expand("%:r")<cr>.pdf &<cr>'
        --vim.g.vimtex_syntax_conceal_disable = 1
    end
}
