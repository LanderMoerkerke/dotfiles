Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

let NERDTreeShowHidden=1
let g:NERDTreeWinSize=25
let NERDTreeBookmarksFile=expand('~/.config/nvim/NERDTreeBookmarks.txt')

nmap <silent> <Leader>f :call g:WorkaroundNERDTreeToggle()<CR>

function! NERDTreeOnBufferOpen()
  if exists('b:noNERDTree')
    return
  endif
  call WorkaroundNERDTreeToggle()
endfun

function! g:WorkaroundNERDTreeToggle()
  try
    NERDTreeToggle
  catch
    silent! NERDTree
  endtry
endfunction

augroup Nerdtree

  " Close vim when nerdtree is last window
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  autocmd VimEnter ~/.config/joplin/tmp/*,/tmp/*,~/Git/wiki,*/.git/COMMIT_EDITMSG,*.md let b:noNERDTree=1
  autocmd VimEnter * call NERDTreeOnBufferOpen()

  autocmd VimEnter * wincmd p

  " disables keybindings when focussing on nerdtree
  autocmd FileType nerdtree noremap <buffer> <c-n> <nop>
  autocmd FileType nerdtree noremap <buffer> <c-p> <nop>

augroup end
