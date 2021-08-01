require("lsp_signature").on_attach(
    {
        bind = true,
        fix_pos = true,
        handler_opts = {
            border = "single"
        }
    }
)
