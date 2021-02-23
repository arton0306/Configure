set nu
imap jj <ESC>

set laststatus=2
set statusline=%2*\ [%{&encoding},\ " encoding
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]
set statusline+=%{HasPaste()}%*
set statusline+=%1*\ %f%m%r%h\ %w
set statusline+=%=
set statusline+=%3*%{CurDir()}
set statusline+=%2*\ [Row:%4.l/%4.L\ Col:%3.c\]\ %*

highlight User1 term=underline cterm=underline ctermfg=white ctermbg=darkblue guifg=white guibg=darkblue
highlight User2 term=underline cterm=underline ctermfg=yellow ctermbg=darkblue guifg=yellow guibg=darkblue
highlight User3 term=underline cterm=underline ctermfg=grey ctermbg=darkblue guifg=grey guibg=darkblue
highlight Pmenu ctermbg=gray ctermfg=234
highlight PmenuSel ctermbg=234 ctermfg=gray

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction
