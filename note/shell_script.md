# common

## long alias
*  add '//' in the end of each line [ref][2]

# bash

## command execution order
1. relative/absolute path : /bin/ls or ./ls
2. alias
3. bash builtin
4. search path in $PATH

## configuration file reading order [ref][1]
### be invoked as a login shell
1. Login process calls /etc/profile
2. /etc/profile calls the scripts in /etc/profile.d/
3. Login process calls ~/.bash_profile
4. ~/.bash_profile calls ~/.bashrc
5. ~/.bashrc calls /etc/bashrc
### be invoked as a non login shell;
1. Non-login process(shell) calls ~/.bashrc
2. ~/.bashrc calls /etc/bashrc
3. /etc/bashrc calls the scripts in /etc/profile.d/

## built-in
*  type `<command>`: show the information about the command containing alias, function, ... etc
*  ulimit
   *  often with `-a` to list user limit containing core file size, file size, pipe size, stack size, ... etc
   *  `ulimit [options] [limit]`
   *  (the pipe size seems not to be the `pipe buffer size`)
   *  `k=0; while true; do dd if=/dev/zero bs=1k count=1 2>/dev/null; k=$(($k+1)); echo -en "\r$k KB" 1>&2; done | sleep 999`
*  `set -e` to exit whenever a command fails
*  `set -x` to trace each command executes

## IO redirection
*  `my_prog >a 2>b` : redirect stdout to file `a`, and redirect stderr to file `b`
*  `my_prog >& a` : redirect stdout&stderr to file `a`
*  `my_prog &> a` : redirect stdout&stderr to file `a`
*  `my_prog >a 2>a` : error, only redirect stdout fo file `a` and discard stderr
*  `>&1 my_prog` : redirect output to stdout 
*  `>&2 my_prog` : redirect output to stderr 

## for loop
* `for i in $(seq -w 00 20); do echo $i; done`
* `for i in {00..20}; do echo $i; done` (Note that zero-padding for brace expansions was introduced in bash 4)

## testing
*  do not concate "[" or "]" with the other char
*  [ is a executable, try `which [`
*  [ -f ] check is a file
*  [ -e ] check exsit
*  [ ... -a ... ] and
*  [ ... -o ... ] or
*  [ -d "xxxfolder" ] check if xxxfolder exists
*  [ ! -d "xxxfolder" ] check if xxxfolder does not exist
*  Refs: <https://sites.google.com/site/tiger2000/>

## var
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

## find a function
https://superuser.com/questions/144772/finding-the-definition-of-a-bash-function
1. shopt -s extdebug
2. declare -F foo
3. shopt -u extdebug
4. `declare` : list all functions

## add/remove trailing slash in path if needed
*  add: `STR="${STR%/}/"`
*  remove: `STR="${STR%/}"`
*  Refs: <https://gist.github.com/luciomartinez/c322327605d40f86ee0c>

## misc
*  sh -x ./myscript => -x debug( show all command ), or as below
*  #!/bin/bash -x => debug, 1st line
*  (ls -l /usr/bin; ls -l /usr/share) | wc -l => (...) grouping

# csh/tcsh

## common mistakes
*  `if (! $?im_undef_or_x || $im_undef_or_x == "x") then` If im_undef_or_x is undefined, we will get $im_undef_or_x undefind error. According to the tcsh manual, `If expr (an expression, as described under Expressions) evaluates true, then command is executed.  Variable substitution on command happens early, at the same time it does for the rest of the if command.`.

## using bash function, alias, commands, etc
*  i.g. `bash -i -c "gt"`

# popular commands
*  echo -n "abc" => -n print string and keep cursor at the same line

[1]:  <http://howtolamp.com/articles/difference-between-login-and-non-login-shell/>
[2]:  <https://home.adelphi.edu/sbloch/class/archive/271/fall2005/notes/aliases.html>
