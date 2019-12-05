### bash command execution order
1. relative/absolute path : /bin/ls or ./ls
2. alias
3. bash builtin
4. search path in $PATH

### built-in
*  type `<command>`: show the information about the command containing alias, function, ... etc
*  ulimit
   *  often with `-a` to list user limit containing core file size, file size, pipe size, stack size, ... etc
   *  `ulimit [options] [limit]`

### IO redirection
*  `my_prog >a 2>b` : redirect stdout to file `a`, and redirect stderr to file `b`
*  `my_prog >& a` : redirect stdout&stderr to file `a`
*  `my_prog &> a` : redirect stdout&stderr to file `a`
*  `my_prog >a 2>a` : error, only redirect stdout fo file `a` and discard stderr

### xxx
*  sh -x ./myscript => -x debug( show all command ), or as below
*  #!/bin/bash -x => debug, 1st line
*  echo -n "abc" => -n print string and keep cursor at the same line
*  (ls -l /usr/bin; ls -l /usr/share) | wc -l => (...) grouping

### bash for
* `for i in $(seq -w 00 20); do echo $i; done`
* `for i in {00..20}; do echo $i; done` (Note that zero-padding for brace expansions was introduced in bash 4)

### testing
*  do concate "[" or "]" with the other char
*  [ -f ] check is a file
*  [ -e ] check exsit
*  [ ... -a ... ] and
*  [ ... -o ... ] or
*  Refs: <https://sites.google.com/site/tiger2000/>

### var
1. var and its content are separated by =
   *  myname=arton
2. there is no space at the 2 ends of =
   *  myname = arton (error!)
   *  myname=Chang Arton (error!)
3. the name of var must start with nondigit
4. " and '
   *  " expand the var
   *  ' remain the var
5. use \ to escape
6. `command` and $(command) can get the result of command
7. "$var" or ${var} can expand var
8. use "export" to make a var to be env var
9. traditionally ( not forcely )
   *  uppercase words are system default var
   *  lowercase words are user customized var
10. use "unset" to delete the content of a var
