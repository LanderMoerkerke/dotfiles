scriptencoding utf-8

call plug#begin('~/.config/nvim/plugged')
" let g:vimspector_base_dir = expand( '<sfile>:p:h' ) . '/vimspector'

source ~/.config/nvim/modules/basic_settings.vim
source ~/.config/nvim/modules/basic_commands.vim
source ~/.config/nvim/modules/basic_functions.vim
source ~/.config/nvim/modules/basic_mappings.vim
source ~/.config/nvim/modules/function_mappings.vim
source ~/.config/nvim/modules/diff.vim
source ~/.config/nvim/modules/templates.vim

" Misc plugins
source ~/.config/nvim/modules/plugins.vim

" Basic plugins
source ~/.config/nvim/modules/delimitmate.vim
source ~/.config/nvim/modules/easy_align.vim
source ~/.config/nvim/modules/fzf.vim

source ~/.config/nvim/modules/external_scripts.vim

" Colour
source ~/.config/nvim/modules/colour.vim
source ~/.config/nvim/modules/hexokinase.vim

" Appearance
source ~/.config/nvim/modules/indentline.vim
source ~/.config/nvim/modules/airline.vim

" Filetypes
source ~/.config/nvim/modules/polyglot.vim

" Snippets
source ~/.config/nvim/modules/ultisnips.vim

" Coding
source ~/.config/nvim/modules/commantary.vim
source ~/.config/nvim/modules/doge.vim
source ~/.config/nvim/modules/echodoc.vim
source ~/.config/nvim/modules/function_expander.vim

" Git
source ~/.config/nvim/modules/fugitive.vim

" Sideabar
" source ~/.config/nvim/modules/nerdtree.vim
" source ~/.config/nvim/modules/netrw.vim

source ~/.config/nvim/modules/markdown_toc.vim
" source ~/.config/nvim/modules/multiple_cursors.vim
source ~/.config/nvim/modules/ripgrep.vim
source ~/.config/nvim/modules/rooter.vim
source ~/.config/nvim/modules/suda.vim
source ~/.config/nvim/modules/vista.vim

source ~/.config/nvim/modules/autocommands.vim

call plug#end()

source ~/.config/nvim/modules/appendix.vim

luafile ~/.config/nvim/modules/lsp.lua

luafile ~/.config/nvim/modules/compe.lua
luafile ~/.config/nvim/modules/diagnostics.lua

luafile ~/.config/nvim/modules/nvim-test.lua

" Git
luafile ~/.config/nvim/modules/gitsigns.lua

" luafile ~/.config/nvim/modules/lualine.lua

luafile ~/.config/nvim/modules/telescope.lua

luafile ~/.config/nvim/modules/formatter.lua
luafile ~/.config/nvim/modules/tree.lua

luafile ~/.config/nvim/modules/dap.lua
