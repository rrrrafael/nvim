" Override $VIMRUNTIME/autoload/cargo.vim

" Do not use :terminal
function! cargo#cmd(args) abort
    let args = substitute(a:args, '\s\+$', '', '')
    let cmd = '!'
    execute cmd 'cargo' args
endfunction
