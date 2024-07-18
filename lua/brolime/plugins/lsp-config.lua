return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = false,
        config = function()
            local lsp = require("lsp-zero")
            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
            end)
        end,
        init = function()
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_cmp()

            local cmp = require("cmp")
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                }),
                preselect = "item",
                completion = { completeopt = "menu,menuone,noinsert" },
                sources = {
                    { name = "buffer" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require("mason-lspconfig").setup({
                ensure_installed = { "clangd", "lua_ls" },
                handlers = {
                    lsp_zero.default_setup,
                    clangd = function()
                        require("lspconfig").clangd.setup({
                            cmd = { "clangd" },
                        })
                    end,

                    rust_analyzer = function()
                        require("lspconfig").rust_analyzer.setup({
                            on_attach = on_attach,
                            settings = {
                                ["rust-analyzer"] = {
                                    imports = {
                                        granularity = {
                                            group = "module",
                                        },
                                        prefix = "self",
                                    },
                                    cargo = {
                                        buildScripts = {
                                            enable = true,
                                        },
                                    },
                                    procMacro = {
                                        enable = true,
                                    },
                                },
                            },
                        })
                    end,

                    lua_ls = function()
                        require("lspconfig").lua_ls.setup({
                            on_init = function(client)
                                local path = client.workspace_folders[1].name
                                if
                                    vim.loop.fs_stat(path .. "/.luarc.json")
                                    or vim.loop.fs_stat(path .. "/.luarc.jsonrc")
                                then
                                    return
                                end

                                client.config.settings.Lua = vim.tbl_deep_exten("force", client.config.settings.Lua, {
                                    runtime = {
                                        version = "LuaJIT",
                                    },
                                    workspace = {
                                        checkThirdParty = false,
                                        library = {
                                            vim.env.VIMRUNTIME,
                                        },
                                    },
                                })
                            end,
                            settings = {
                                Lua = {},
                            },
                        })
                    end,
                },
            })
        end,
    },
}
