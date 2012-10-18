set history=500 " Sets how many lines of history VIM has to rememberset

set nocompatible

colorscheme desert256 " set scheme
syntax on
set t_Co=256

set guifont=Consolas:h12:cANSI " set font

set nu " show line number

set et sw=4 ts=4 sts=4 " tab control ( expandtab, shiftwidth, tabstop, smarttab )

set ai " auto indent
set si " smart indent
set wrap " wrap lines

set whichwrap+=<,>,h,l
set backspace=eol,start,indent " Set backspace config

set ruler " Always show current position
set showmode " show which mode

set smartcase
set hlsearch "Highlight search things

set noerrorbells " no sound on errors
set novisualbell

set cpoptions+=$ " add a $ sign to the end of the change destination

set ve=all " let ctrl + v be more convenient and powerful

set ttymouse=xterm2                     " For using mouse=a with screen

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
nmap <leader>vimrc     :e $MYVIMRC<CR>
nmap <leader>sorc      :source $MYVIMRC<CR>
nmap <leader>ff        :ff FufFile
imap jj                <ESC>
inoremap {<CR> {<CR><END><CR>}<UP><END>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" press F11 to toggle specails charactor show
noremap <F11> :set list!<CR>

" search multiple line
vnoremap * :<C-U>set hlsearch<CR>:call <SID>search_selected_text_literaly('n')<CR>
vnoremap # :<C-U>set hlsearch<CR>:call <SID>search_selected_text_literaly('N')<CR>

" plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=%2*\ [%{&encoding},\ " encoding
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]
set statusline+=%{HasPaste()}%*
set statusline+=%1*\ %F%m%r%h\ %w
set statusline+=%=
set statusline+=%3*<Cwd>%{CurDir()}
set statusline+=%2*\ [%y\ \ Row:%4.l/%4.L\ Col:%3.c\ ]\ %*

highlight User1 term=underline cterm=underline ctermfg=white ctermbg=darkblue guifg=white guibg=darkblue
highlight User2 term=underline cterm=underline ctermfg=yellow ctermbg=darkblue guifg=yellow guibg=darkblue
highlight User3 term=underline cterm=underline ctermfg=grey ctermbg=darkblue guifg=grey guibg=darkblue

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Highlight specail characters
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lcs=tab:>-,trail:-
set list
hi SpecialKey ctermbg=red ctermfg=red guibg=red guifg=red

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => a function to search multiple line ( by: ptt - bootleq )
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:search_selected_text_literaly(search_command)

  normal! gvy
  let pattern = escape(@0, '\')
  let pattern = substitute(pattern, '\V\n', '\\n', 'g')
  let @/ = pattern
  call histadd('/', '\V' . pattern)
  execute 'normal!' a:search_command
  let v:searchforward = a:search_command ==# 'n'

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabpage command
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showtabline=2
set tabline=%!SetTabLine()


function! SetTabLine()
  let s:tabLineTabs = []

  let tabCount = tabpagenr('$')
  let tabSel = tabpagenr()

" fill s:tabLineTabs with {n, filename, split, flag} for each tab
  for i in range(tabCount)
    let tabnr = i + 1
    let buflist = tabpagebuflist(tabnr)
    let winnr = tabpagewinnr(tabnr)
    let bufnr = buflist[winnr - 1]

    let filename = bufname(bufnr)
    let filename = fnamemodify(filename, ':p:t')
    let buftype = getbufvar(bufnr, '&buftype')
    if filename == ''
      if buftype == 'nofile'
        let filename .= 'Scratch'
      else
        let filename .= 'New'
      endif
    endif
    let split = ''
    let winCount = tabpagewinnr(tabnr, '$')
    if winCount > 1 " has split windows
      let split .= winCount
    endif
    let flag = ''
    if getbufvar(bufnr, '&modified') " modified
      let flag .= '+'
    endif
    if strlen(flag) > 0 || strlen(split) > 0
      let flag .= ''
    endif

    call add(s:tabLineTabs, {'n': tabnr, 'split': split, 'flag': flag, 'filename': filename})
  endfor

" variables for final oupout
  let s = ''

" final ouput
  unlet i
  for i in s:tabLineTabs

    let type = i.split . i.flag
    if strlen(type) == 0
      let text = ' ' . i.n . ' ' . i.filename . i.split . i.flag . ' '
    else
      let text = ' ' . i.n . ' ' . i.filename . ' [' . i.split . i.flag . '] '
    endif

    let s .= '%' . i.n . 'T'  " start of tab N

    if i.n == tabSel
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    let s .= text

  endfor

  let s .= '%#TabLineFill#%T'
  return s
endf

highlight TabLine           cterm=bold         ctermfg=white           ctermbg=darkcyan
highlight TabLineSel        cterm=bold         ctermfg=lightred        ctermbg=black
highlight TabLineFill       cterm=bold         ctermbg=darkcyan

map <F5> :tabpre<CR>
map <F6> :tabnext<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rename a buffer within Vim and on the disk
" Copyright June 2007-2011 by Christian J. Robinson <heptite@gmail.com>
" Distributed under the terms of the Vim license.  See ":help license".
" Usage:
" :Rename[!] {newname}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=* -complete=file -bang Rename call Rename(<q-args>, '<bang>')

function! Rename(name, bang)
     let l:name    = a:name
     let l:oldfile = expand('%:p')

     if bufexists(fnamemodify(l:name, ':p'))
          if (a:bang ==# '!')
               silent exe bufnr(fnamemodify(l:name, ':p')) . 'bwipe!'
          else
               echohl ErrorMsg
               echomsg 'A buffer with that name already exists (use ! to override).'
               echohl None
               return 0
          endif
     endif

     let l:status = 1

     let v:errmsg = ''
     silent! exe 'saveas' . a:bang . ' ' . l:name

     if v:errmsg =~# '^$\|^E329'
          let l:lastbufnr = bufnr('$')

          if expand('%:p') !=# l:oldfile && filewritable(expand('%:p'))
               if fnamemodify(bufname(l:lastbufnr), ':p') ==# l:oldfile
                    silent exe l:lastbufnr . 'bwipe!'
               else
                    echohl ErrorMsg
                    echomsg 'Could not wipe out the old buffer for some reason.'
                    echohl None
                    let l:status = 0
               endif

               if delete(l:oldfile) != 0
                    echohl ErrorMsg
                    echomsg 'Could not delete the old file: ' . l:oldfile
                    echohl None
                    let l:status = 0
               endif
          else
               echohl ErrorMsg
               echomsg 'Rename failed for some reason.'
               echohl None
               let l:status = 0
          endif
     else
          echoerr v:errmsg
          let l:status = 0
     endif

     return l:status
endfunction

