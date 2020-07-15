### default - no core dump
* ulimit -c 0

### enable core dump
* ulimit -c unlimited  => set core dump unlimit
* ulimit -c 1073741824 => set core dump max 1GB
* execute a improper process, the core dump will be produced under current folder (default)

### gdb using core dump
* gdb -c core.7561 ./a.out => run gdb with a.out and core.7561

### gdb GLIBCXX
* g++ -g -D_GLIBCXX_DEBUG <filename>

### gdb command
* info reg => list registers
* print $eax   => show register eax's content
* print/c $eax => print support different format xduotacfsi ( see help print )
* x/10i $pc    => x : show memory content ( see help print )
* watch => pause if changed
* awatch => pause if read or changed
* rwatch => pause if read
* set variable i = 10 => set variable i to 10, no need to modify source
* break ... if ...
* c/s/n <count>

### gdb process interaction command
* generate-core-file => generate core dump
* attach pid => attach gdb to process pid
* info proc
* detach

### history
* default position : ./.gdb_history
* set/show history filename/save
* set history size <n>
* show history size

### gdb fail
* info source

### tui
* ctrl+x a : turn on/off tui
* ctrl+x o : switch focus window

### log
* set logging <on/off>
* set logging file <filename>
* set logging overwrite <on/off>
* show logging
  
### screen size (https://sourceware.org/gdb/onlinedocs/gdb/Screen-Size.html)
* show pagination
* set pagination <on/off>
