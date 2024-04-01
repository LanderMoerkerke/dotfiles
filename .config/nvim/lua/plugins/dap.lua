return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "mfussenegger/nvim-dap-python",
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "LiadOz/nvim-dap-repl-highlights"
    },
    event = "VeryLazy",
    config = function()
        local dap = require("dap")
        local dap_ui = require("dapui")

        local dap_python = require("dap-python")
        local dap_virtual_text = require("nvim-dap-virtual-text")

        local py = "/bin/python"
        local virtual_py = (os.getenv("VIRTUAL_ENV") or "") .. "/bin/python"
        local opts = {noremap = true, silent = true}

        require("nvim-dap-repl-highlights").setup()

        dap_virtual_text.setup(
            {
                enabled = true, -- enable this plugin (the default)
                enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                show_stop_reason = true, -- show stop reason when stopped for exceptions
                commented = false, -- prefix virtual text with comment string
                only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
                all_references = false, -- show virtual text on all all references of the variable (not only definitions)
                --- A callback that determines how a variable is displayed or whether it should be omitted
                --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
                --- @param buf number
                --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
                --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
                --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
                display_callback = function(variable, _buf, _stackframe, _node)
                    return variable.name .. " = " .. variable.value
                end,
                -- experimental features:
                virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
                all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
                virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
                virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
                -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
            }
        )

        dap_ui.setup()

        dap_python.setup(py)
        dap_python.test_runner = "pytest"

        vim.api.nvim_set_keymap("n", "<leader>tb", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
        vim.api.nvim_set_keymap(
            "n",
            "<leader>tB",
            "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
            opts
        )
        vim.api.nvim_set_keymap("n", "<leader>tc", "<cmd>lua require'dap'.continue()<CR>", opts)
        vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>lua require'dap'.step_over()<CR>", opts)
        vim.api.nvim_set_keymap("n", "<leader>ts", "<cmd>lua require'dap'.step_into()<CR>", opts)
        vim.api.nvim_set_keymap("n", "<leader>to", "<cmd>lua require'dap'.step_out()<CR>", opts)

        vim.keymap.set(
            "n",
            "<Leader>Tf",
            function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.frames)
            end
        )
        vim.keymap.set(
            "n",
            "<Leader>Ts",
            function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.scopes)
            end
        )

        vim.api.nvim_set_keymap("n", "<leader>Tt", "<cmd>lua require('dapui').toggle()<CR>", opts)
        vim.api.nvim_set_keymap("v", "<leader>Te", "<cmd>lua require('dapui').eval()<CR>", opts)

        vim.api.nvim_set_keymap("n", "<leader>Tn", "<cmd>lua require('dap-python').test_method()<CR>", opts)
        vim.api.nvim_set_keymap("v", "<leader>Ts", "<cmd>lua require'dap'.run_last()<CR>", opts)

        -- dap.set_exception_breakpoints({"raised", "uncaught"})
        dap.configurations.python = {
            {
                -- The first three options are required by nvim-dap
                type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
                request = "launch",
                name = "Launch file",
                -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
                justMyCode = false,
                program = "${file}", -- This configuration will launch the current file if used.
                pythonPath = virtual_py
            }
        }

        vim.fn.sign_define("DapBreakpoint", {text = "🛑", texthl = "", linehl = "", numhl = ""})

        vim.api.nvim_exec(
            [[
                    au FileType dap-repl lua require('dap.ext.autocompl').attach()
                ]],
            true
        )
    end
}
