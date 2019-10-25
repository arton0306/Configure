### system related
* hwinfo : a good tool for listing hardware
* lsusb : list usb device
* lspci : list pci device
* pkill : kill process by name
* ulimit : user limit ( -a to list all limit info ), 0 means unlimited
* stty -a : ( setting tty ) list hotkey and tty info
* lsb_release

### some shell built-in
* bash: type

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

### grep
* -s diable the msg "No such file or directory"
* -I skip binary

### find
* find -iregex ".*[^(\.c)(\.o)(\.h)]"
* find . -maxdepth 1 -type f -name ".*" -exec grep set {} \;
* find . -name "*.cpp" -exec grep -n --color=auto "Slice" {} \; -print
* find . \( -name "*.cpp" -o -name "*.h" \) -a ! -name "guSlice.*" | sort

### xargs
* find -iname '*.a' | xargs -i ls -l {}  | grep service
* cat files_to_cp | xargs -i -t /bin/bash -c cp -r {} .

### service
* sudo service apache2 start

### sun studio analyzer
* collect -p 1.0 my_executable_file
* analyzer
