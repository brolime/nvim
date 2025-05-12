return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup {
                log_level = vim.log.levels.DEBUG
            }
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_nvim_lsp.default_capabilities()
            )

            vim.diagnostic.config({
                virtual_text = true
            })

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {}) -- also found in ../remap.lua 
            vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "<leader>to", function()
                vim.diagnostic.enable(not vim.diagnostic.is_enabled())
            end, { silent = true, noremap = true })
        end,
    },
}
