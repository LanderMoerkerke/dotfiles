require("lsp_signature").on_attach(
    {
        bind = true,
        fix_pos = false,
        handler_opts = {
            border = "single"
        }
        -- zindex = 50
    }
)
