"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Environment
" use "help command' to get vim doc, ex:
" help expandtab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on " smart tab with Makefile

set history=500 " Sets how many lines of history VIM has to rememberset

set nocompatible

colorscheme desert256 " set scheme
syntax on
set t_Co=256

set guifont=Consolas:h12:cANSI " set font

set nu " show line number

set et sw=4 ts=8 sts=8 " tab control ( expandtab, shiftwidth, tabstop, smarttab )

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
" => vim temp file folder
" ref -
" http://stackoverflow.com/questions/607435/why-does-vim-save-files-with-a-extension
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Key Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
nmap <leader>vimrc     :e $MYVIMRC<CR>
nmap <leader>tcl       :tabnew ~/aptcl/test.tcl<CR>
nmap <leader>sorc      :source $MYVIMRC<CR>
imap jj                <ESC>
inoremap {<CR> {<CR><END><CR>}<UP><END>

" scroll conveniently
nmap ff <c-f>
nmap FF <c-b>

" Smart way to move to split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" search multiple line
vnoremap * :<C-U>set hlsearch<CR>:call <SID>search_selected_text_literaly('n')<CR>
vnoremap # :<C-U>set hlsearch<CR>:call <SID>search_selected_text_literaly('N')<CR>
noremap % #*

" toggle paste mode
noremap <F3> <ESC>:set paste!<CR>

" source header switcher
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" tab
noremap <leader>ts <ESC>:tab split<CR>

" ctags ( <c-]> find definition )
" noremap <leader>ctags <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
noremap <leader>ctags <ESC>:!ctags -R --fields=+iaS --extra=+q .<CR>

" note
noremap <leader>note <ESC>:tabe ~/Configure/note/note<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Key Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " FuzzyFinder
" noremap <leader>ff <ESC>:FufCoverageFile<CR>
" noremap <leader>mff <ESC>:FufCoverageFile!<CR>
" noremap <leader>fb <ESC>:FufBuffer<CR>
" noremap <leader>mfb <ESC>:FufBuffer!<CR>
" noremap <silent> <c-\> :FufTag <c-r>=expand('<cword>')<cr><cr>

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
hi SpecialKey ctermbg=red ctermfg=red guibg=red guifg=red
" use :set list! to toggle specails charactor show
noremap <F2> <ESC>:set list!<CR>
set nolist


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

" highlight TabLine           cterm=bold         ctermfg=white           ctermbg=darkcyan
" highlight TabLineSel        cterm=bold         ctermfg=lightred        ctermbg=black
" highlight TabLineFill       cterm=bold         ctermbg=darkcyan
" map <F5> :tabpre<CR>
" map <F6> :tabnext<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => add Grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cabbrev grep <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Grep' : 'grep')<CR>
map ,s :execute " grep -srnw --exclude=tags --exclude=*.html --exclude-dir=framework_addon --exclude-dir=network_addon --exclude-dir=runtime_addon --exclude-dir=build --exclude-dir=bin --binary-files=without-match --exclude-dir=.git --exclude-dir=.repo . -e " . expand("<cword>") . " " <bar> cwindow<CR>

function! Grep(name)
  execute ":grep -isrn --exclude=tags --exclude=*.html --exclude-dir=framework_addon --exclude-dir=network_addon --exclude-dir=runtime_addon --exclude-dir=build --exclude-dir=bin --exclude-dir=.git --exclude-dir=.repo --binary-files=without-match . -e ".a:name
  execute ":copen"
endfunction
command! -nargs=1 Grep :call Grep("<args>")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => auto remove trailing white space if save *.c *.cpp *.h *.hpp
" http://unix.stackexchange.com/questions/75430/vi-vim-how-to-automatically-strip-trailing-spaces-on-save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre *.c,*.cpp,*.hpp,*.h :call <SID>StripTrailingWhitespaces()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle ( https://github.com/gmarik/vundle )
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

if $isYcmOn == "YES"
    Bundle 'Valloric/YouCompleteMe'
    let g:ycm_global_ycm_extra_conf = '~/Configure/vim/.ycm_extra_conf.py'
    noremap <leader>yr             :YcmDiags<CR>
    noremap <leader>yd             :YcmShowDetailedDiagnostic<CR>
    noremap <leader>build          :YcmForceCompileAndDiagnostics<CR>
    noremap <leader>ycmrestart     :YcmRestartServer<CR>
    noremap <leader>flag           :YcmDebugInfo<CR>
    noremap <leader>rr             :YcmCompleter GoTo<CR>
    noremap <leader>tt             :YcmCompleter GoToImprecise<CR>
    noremap <leader>gg             :YcmCompleter GoToDefinition<CR>
    noremap <leader>reflag         :YcmCompleter ClearCompilationFlagCache<CR>
    noremap <leader>type           :YcmCompleter GetType<CR>
endif

filetype plugin indent on     " required
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

set tags=tags;../tags


" let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'
