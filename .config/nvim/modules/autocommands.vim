augroup basic

    " Resize vim
    autocmd VimResized * :wincmd =

    autocmd FocusGained,BufEnter,CursorHold * checktime

    " Before saving
    autocmd BufWritePre * %s/\s\+$//e                   " deletes tralling whitespace on save

    autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
    autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
    autocmd BufWritePost *dwmbar-launch !killall dwmbar-launch; setsid dwmbar-launch &

augroup end
