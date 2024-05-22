return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "honza/vim-snippets"
        },
        event = "VeryLazy",
        version = "2.*",
        build = "make install_jsregexp",
        opts = {},
        config = function()
            local ls = require("luasnip")

            ls.setup(
                {
                    update_events = "TextChanged,TextChangedI"
                }
            )

            require("luasnip.loaders.from_snipmate").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load({paths = {"./luasnip_snippets"}})

            -- stop jumping to snippet if going out of insert mode
            vim.api.nvim_create_autocmd(
                "ModeChanged",
                {
                    pattern = "*",
                    callback = function()
                        if
                            ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or
                                vim.v.event.old_mode == "i") and
                                require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()] and
                                not require("luasnip").session.jump_active
                         then
                            require("luasnip").unlink_current()
                        end
                    end
                }
            )

            vim.keymap.set(
                {"i", "s"},
                "<C-E>",
                function()
                    if ls.choice_active() then
                        ls.change_choice(1)
                    end
                end,
                {silent = true}
            )

            local s = ls.snippet
            local sn = ls.snippet_node
            local i = ls.insert_node
            local f = ls.function_node
            local c = ls.choice_node
            local d = ls.dynamic_node
            local fmt = require("luasnip.extras.fmt").fmt
            local fmta = require("luasnip.extras.fmt").fmta

            local generate_uuid = function()
                local random = math.random
                local function uuid()
                    return string.gsub(
                        "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx",
                        "[xy]",
                        function(item)
                            return string.format("%x", (item == "x") and random(0, 0xf) or random(8, 0xb))
                        end
                    )
                end

                return sn(nil, i(1, tostring(uuid())))
            end

            local todo_snippet_specs = {
                {{trig = "todo"}, "TODO"},
                {{trig = "fix"}, {"FIX", "BUG", "ISSUE", "FIXIT"}},
                {{trig = "hack"}, "HACK"},
                {{trig = "warn"}, {"WARN", "WARNING", "XXX"}},
                {{trig = "perf"}, {"PERF", "PERFORMANCE", "OPTIM", "OPTIMIZE"}},
                {{trig = "note"}, {"NOTE", "INFO"}}
            }

            local get_cstring = function()
                local cstring = vim.filetype.get_option(vim.bo.filetype, "commentstring")
                local left, right = string.match(tostring(cstring), "(.*)%%s(.*)")
                return {left, right}
            end

            local marks = {
                date_signature_with_email = function()
                    return fmt("<{}{}>", {i(1, os.date "%d-%m-%y"), i(2, ", " .. "Lander")})
                end
            }

            local todo_snippet_nodes = function(aliases)
                local aliases_nodes =
                    vim.tbl_map(
                    function(alias)
                        return i(nil, alias) -- generate choices for [name-of-comment]
                    end,
                    aliases
                )
                local sigmark_nodes = {} -- choices for [comment-mark]
                for _, mark in pairs(marks) do
                    table.insert(sigmark_nodes, mark())
                end
                -- format them into the actual snippet
                local comment_node =
                    fmta(
                    "<> <>: <> <> <><>",
                    {
                        f(
                            function()
                                return get_cstring()[1] -- get <comment-string[1]>
                            end
                        ),
                        c(2, aliases_nodes), -- [name-of-comment]
                        i(1), -- {comment-text}
                        c(3, sigmark_nodes), -- [comment-mark]
                        f(
                            function()
                                return get_cstring()[2] -- get <comment-string[2]>
                            end
                        ),
                        i(0)
                    }
                )
                return comment_node
            end

            local todo_snippet = function(context, aliases)
                aliases = type(aliases) == "string" and {aliases} or aliases -- if we do not have aliases, be smart about the function parameters
                context = context or {}
                local alias_string = table.concat(aliases, "|") -- `choice_node` documentation
                context.name = context.name or (alias_string .. " comment") -- generate the `name` of the snippet if not defined
                context.dscr = context.dscr or (alias_string .. " comment with a signature-mark") -- generate the `dscr` if not defined
                context.docstring = context.docstring or (" {1:" .. alias_string .. "}: {3} <{2:mark}>{0} ") -- generate the `docstring` if not defined
                local comment_node = todo_snippet_nodes(aliases)
                return s(context, comment_node)
            end

            local todo_comment_snippets = {}
            for _, v in ipairs(todo_snippet_specs) do
                table.insert(todo_comment_snippets, todo_snippet(v[1], v[2]))
            end

            ls.add_snippets("all", todo_comment_snippets, {type = "snippets", key = "todo_comments"})
            ls.add_snippets("all", {s("uuid", {d(1, generate_uuid)})})
        end
    }
    -- {
    --     "smjonas/snippet-converter.nvim",
    --     config = function()
    --         local template = {
    --             -- name = "t1", (optionally give your template a name to refer to it in the `ConvertSnippets` command)
    --             sources = {
    --                 ultisnips = {
    --                     vim.fn.stdpath("config") .. "/UltiSnips"
    --                 }
    --             },
    --             output = {
    --                 -- Specify the output formats and paths
    --                 vscode_luasnip = {
    --                     vim.fn.stdpath("config") .. "/luasnip_snippets"
    --                 }
    --             }
    --         }
    --         require("snippet_converter").setup {
    --             templates = {template}
    --             -- To change the default settings (see configuration section in the documentation)
    --             -- settings = {},
    --         }
    --     end
    -- },
}
