return {
    "saghen/blink.cmp",
    version = "1.*", -- prebuilt binary release; avoids building the Rust matcher
    event = "InsertEnter",
    dependencies = {"L3MON4D3/LuaSnip"},
    opts = {
        snippets = {preset = "luasnip"},
        keymap = {
            preset = "none",
            ["<Tab>"] = {"select_next", "snippet_forward", "fallback"},
            ["<S-Tab>"] = {"select_prev", "snippet_backward", "fallback"},
            ["<CR>"] = {"accept", "fallback"},
            ["<C-Space>"] = {"show", "hide"},
            ["<C-e>"] = {"hide"}
        },
        sources = {default = {"lsp", "snippets", "path", "buffer"}},
        appearance = {nerd_font_variant = "mono"},
        completion = {
            documentation = {auto_show = true, auto_show_delay_ms = 200},
            menu = {border = "single"},
            list = {selection = {preselect = false, auto_insert = false}}
        },
        signature = {enabled = true, window = {border = "single"}},
        cmdline = {
            keymap = {preset = "cmdline"},
            completion = {menu = {auto_show = false}} -- manual (matches old behaviour)
        }
    }
}
