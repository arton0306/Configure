### session
* mksession ~/mysession.vim
* :source ~/mysession.vim
*  vim -S ~/mysession.vim

### find/replace
*  by default `:s` will only apply the substitution to the current line, `:%s` makes it address the whole file.
*  when searching, `\n` is newline, `\r` is CR (carriage return = Ctrl-M = ^M) [ref][1]
*  when replacing, `\r` is newline, `\n` is a null byte (0x00). [ref][1]
*  `:%sno/search_string/replace_string/g` [ref][2]
*  `:help /magic`

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

### register
*  `:register` to list the contents of all registers
*  default register for some operation:

### special file
*  `.viminfo` is used to store the information of last opened files, i.g. the cursor position

### others
* :h jumplist
* `.!<shell_cmd>` can print the output on current position of cursor
* `vim -q <(grep -rn --include="*.cpp" mystring)` [ref][3]
* insert tab when expandtab is on: `ctrl + v` tab (in insert mode)

[1]:  <https://stackoverflow.com/questions/71417/why-is-r-a-newline-for-vim>
[2]:  <https://stackoverflow.com/questions/6254820/perform-a-non-regex-search-replace-in-vim>
[3]:  <https://stackoverflow.com/questions/49152029/grep-for-string-and-open-at-the-corresponding-line>
