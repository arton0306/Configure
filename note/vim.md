### session
* mksession ~/mysession.vim
* :source ~/mysession.vim
*  vim -S ~/mysession.vim

### find/replace
*  by default `:s` will only apply the substitution to the current line, `:%s` makes it address the whole file.
*  when searching, `\n` is newline, `\r` is CR (carriage return = Ctrl-M = ^M) [ref][1]
*  when replacing, `\r` is newline, `\n` is a null byte (0x00). [ref][1]

### ctags
*  generate database
*  vim setting (refer to the other's .vimrc)
*  `ctrl+]` : jump to definition (hopefully)
*  `:ts` : list all possible definitions
*  `ctrl+i`, `ctrl+o`: vim hot keys (go forward/back)

### cscope
*  http://cscope.sourceforge.net/cscope_vim_tutorial.html
*  https://vimhelp.org/if_cscop.txt.html
*  `ctrl-\ s` : search all usage for the word on the cursor

### others
* :h jumplist

[1]:  <https://stackoverflow.com/questions/71417/why-is-r-a-newline-for-vim>
