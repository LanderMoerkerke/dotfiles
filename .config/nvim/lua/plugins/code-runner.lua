return {
    "CRAG666/code_runner.nvim",
    opts = {
        filetype = {
            java = {
                "cd $dir &&",
                "javac $fileName &&",
                "java $fileNameWithoutExt"
            },
            python = "python -u",
            typescript = "deno run",
            rust = {
                "cd $dir &&",
                "rustc $fileName &&",
                "$dir/$fileNameWithoutExt"
            }
        }
    },
    keys = {
        {"<F5>", ":RunFile<CR>"}
    }
}
