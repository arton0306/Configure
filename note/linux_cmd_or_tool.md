### system related
* sysctl : kernel information query/change
* hwinfo : a good tool for listing hardware
* lsusb : list usb device
* lspci : list pci device
* pkill : kill process by name
* ulimit : user limit ( -a to list all limit info ), 0 means unlimited
* stty -a : ( setting tty ) list hotkey and tty info
* lsb_release
* `quota -s`, `du -sh *`
* iotop : monitor i/o usage for all processes

### some shell built-in
* bash: type, var BASH_SOURCE
* csh, tcsh: rehash,unhash,hashstat
* bash/csh/tcsh support: temporarily disable an alias
   -  https://www.cyberciti.biz/faq/bash-shell-temporarily-disable-an-alias/
   -  \cp
   -  /bin/cp

#### shell cursor move
*  alt+f: move to next word
*  alt+b: move to previous word
*  crtl+a: move to head
*  crtl+e: move to end

#### path
*  `$PATH` and `$path` are both avavilable in `csh`
   -  the format of `$PATH` is `path1:path2:...:pathn` 
   -  the format of `$path` is `path1 path2 ... pathn` 
   -  test this behavior with redhat 6
*  `bash` only uses `$PATH`

### for user
* crontab -e : every user can set their own cron jobs
* `/var/spool/mail/<user>` : check message of crontab, etc <https://stackoverflow.com/questions/1486088/cron-fails-on-single-apostrophe>

### date
* date +%Y%m%d_%H%M%S `20191027_194021`

### zip & unzip
* tar -xvjf OpenCV-2.4.3.tar.bz2
* zcat log.gz

### ! in shell script
* <https://pangea.stanford.edu/computing/unix/shell/processes/retry.php>
* ! is a token related to the history. If we use "!", shell will output the expanded command and execute it. 
* !! : execute previous command
* !5 : execute the 5th command in history
* !* : get the args in previous command

### dpkg
* dpkg -i packagename
* dpkg -r packagename
* dpkg --list "foo*"
* dpkg --status packagename
* dpkg --search filename

### ctags
* ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .

### awk
* awk -F' ' '{print $1}'

### convert
* convert rose.jpg -resize 50% rose.png

### sed, tr
* `ls -1 ../*.py | sed -e 's/..\///g ; s/\.py//g' | tr '\n' ',' | sed -e 's/,$//'`

### vim
* %! xxd      hex mode
* %! xxd -r   back to normal mode

### cp
* copy all contents in a source folder to a existed target folder:
    - `mkdir /home/<new_user>`
    - `cp -r /etc/skel/. /home/<new_user>`
    - <https://superuser.com/questions/61611/how-to-copy-with-cp-to-include-hidden-files-and-hidden-directories-and-their-con>

### grep
* -s diable the msg "No such file or directory"
* -I skip binary
* `grep -r -i --include \*.cpp --include \*.hpp mystr .`

### find
* `find -iregex ".*[^(\.c)(\.o)(\.h)]"`
* `find . -maxdepth 1 -type f -name ".*" -exec grep set {} \;`
* `find . -name "*.cpp" -exec grep -n --color=auto "Slice" {} \; -print`
* `find . \( -name "*.cpp" -o -name "*.h" \) -a ! -name "guSlice.*" | sort`
* `find -L "$BASE_RUN" -maxdepth 1 -mtime +2 -type f -delete`
* `find -L "$BASE_DATA" -mtime "+$CLEANUP_PERIOD" -type d -exec rm -rf {} \;`
* `find -L /home/arton/webservice/log -maxdepth 1 -mtime +0 -type d -exec mv -t /home/arton/bak/log {} +`
    - <https://unix.stackexchange.com/questions/154818/how-to-integrate-mv-command-after-find-command>

### xargs
* find -iname '*.a' | xargs -i ls -l {}  | grep service
* cat files_to_cp | xargs -i -t /bin/bash -c cp -r {} .
* find -iname "script*" | xargs -0 grep -i "arton_debug"

### find working dir of a process
* https://unix.stackexchange.com/questions/94357/find-out-current-working-directory-of-a-running-process
* pwdx `pid`

### tmux
* resolve re-size window issue: `tmux attach -d -t <session name>`

### service
* sudo service apache2 start

### sun studio analyzer
* collect -p 1.0 my_executable_file
* analyzer

### pbcopy
* `cat ~/.ssh/id_rsa.pub | pbcopy`

### command usage convection - some commands need to specify a new name(e.g. new filename, new tagname) and a existed name(e.g. filename, tagname)

####  existed name before new name
* `ln -s <target> <link_name>`

####  new name before existed name
* `git tag <tag_name> <commit>`
