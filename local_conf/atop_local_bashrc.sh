alias update=""
alias install=""

pathadd_head() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1:$PATH"
    fi
}

#pathadd_head /home/hawklee/tmp/SolarisStudio12.3-linux-x86-bin/solarisstudio12.3/bin/
pathadd_head /ads/arton/build/git/bin
pathadd_head /ads/arton/build/screen-4.2.1/bin
pathadd_head /ads/arton/build/bash-4.3.30/bin
pathadd_head /ads/arton/build/vim74/bin
pathadd_head /ads/arton/build/textinfo-5.2/bin
pathadd_head /ads/arton/build/python2.7/bin
pathadd_head /ads/arton/build/python3.5.0/bin
pathadd_head /ads/arton/build/llvm/bin
pathadd_head /ads/arton/build/bear/bin
pathadd_head /ads/arton/build/netbeans-8.0.2/bin
pathadd_head /home/arton/.local/bin
pathadd_head /ads/arton/build/help2man/bin
pathadd_head /ads/arton/build/cgdb/bin

AP_LOCAL_PATH="/ads/arton/AP_codebase/build/bin/rhel6-64"
AP_MASTER_PATH="/ads/arton/AP_master/build/bin/rhel6-64"
AP_1502_PATH="/ads/arton/AP/build1502/build.15.02/bin/rhel6-64"
AP_1510_PATH="/ads/arton/AP/build1510/build.15.10/bin/rhel6-64"

pathadd_head $RDDAILY

alias localAP="$AP_LOCAL_PATH/AP"
alias localAPdebug="$AP_LOCAL_PATH/APdebug"
alias localAPc="cp $AP_LOCAL_PATH/AP . && ./AP"
alias localAPc_="cp $AP_LOCAL_PATH/AP ."
alias localAPm="mv $AP_LOCAL_PATH/AP $AP_LOCAL_PATH/APm && $AP_LOCAL_PATH/APm"
alias local1502="$AP_1502_PATH/AP"
alias local1510="$AP_1510_PATH/AP"
alias mAP="$AP_MASTER_PATH/AP"
alias mAPdebug="$AP_MASTER_PATH/APdebug"

alias ddd="ddd -background BLACK -foreground GRAY --args "
alias ddd2="ddd --gdb --debugger '/ads/rel_tools2/standard-2014/rhel6-x86_64/bin/gdb' -background BLACK -foreground GRAY --args "

alias daily1206="$DAILY1206/AP"
alias daily1302="$DAILY1302/AP"
alias daily1311="$DAILY1311/AP"
alias daily1410="$DAILY1410/AP"
alias daily1502="$DAILY1502/AP"
alias daily1510="$DAILY1510/AP"
alias daily="$RDDAILY/AP"

alias ssh='ssh -X '
alias ctags='/usr/bin/ctags'

alias lslog='ll AP*.log AP*.sum'
alias rmlog='rm -f AP*.log AP*.sum AP*.tmp'
alias rmcvstmp='rm -f $(find . | grep \.#)'
alias reg_rt='/home/integ/p/bin/tcsh/cron.rt.tcsh -m --hour -local `pwd`/AP'

alias calibre="/ads/rel_tools2/eda_tools/mentor/calibre-$CALIBRE_REL/ixl_cal_$CALIBRE_REL/bin/calibre"

localAP="$AP_LOCAL_PATH/AP"
local1502="$AP_1502_PATH/AP" 
local1510="$AP_1510_PATH/AP" 
daily1206="$DAILY1206/AP"
daily1302="$DAILY1302/AP"
daily1311="$DAILY1311/AP"
daily1410="$DAILY1410/AP"
daily1502="$DAILY1502/AP"
daily1510="$DAILY1510/AP"
daily="$RDDAILY/AP"

cgrep() {
    grep -n $1 $(find . \( -name "*.cpp" -o -name "*.h" \) -a ! -name "$1.*" | sort)
}

make_ap_debug() {
    p=$(pwd | tail -c 4 | head -c 3)
    echo $p
    if [ "$p" != "src" ]; then 
        echo "You should enter src folder"
        return
    fi
    cd $1 && \
    make clean -j 18 && \
    make debug -j 18 && \
    cd .. && \
    make debug -j 18 && \
    cp ../bin/$(atop-arch)/AP ../bin/$(atop-arch)/APdebug
}

switch_env() {
    if [ "$1" == "09" ] || [ "$1" == "12" ] ||  [ "$1" == "14" ]; then
        pathadd_head /ads/rel_tools2/standard-20$1/$GPLAT/bin
        export LD_LIBRARY_PATH="/ads/rel_tools2/standard-20$1/$GPLAT/lib:/ads/rel_tools2/standard-20$1/$GPLAT/lib64:/ads/arton/build/python2.7/lib:/ads/arton/build/llvm/lib:/ads/arton/build/netbeans-8.0.2/cnd/bin/Linux-x86_64:/ads/arton/build/netbeans-8.0.2/cnd/bin/Linux-x86"
        export LD_PRELOAD="libBuildTrace.so"
        export C="/ads/rel_tools2/standard-20$1/$GPLAT/bin/gcc"
        export CXX="/ads/rel_tools2/standard-20$1/$GPLAT/bin/g++"
        #export DISTCC="/ads/rel_tools2/standard-20$1/$GPLAT/bin/distcc"
        export DISTCC="distcc"
        #set YouCompleteMe flag
        if [ "$1" == "12" ]; then
            export isYcmOn=YES
        else
            export isYcmOn=NO
        fi
    else
        echo "the para must be 09 || 12 || 14"
    fi
}



apenv() {
    echo "PATH=$PATH"
    echo "LD_LIBRARY_PATH=$LD_LIBRARY_PATH"
    echo "C=$C"
    echo "CXX=$CXX"
    echo "DISTCC=$DISTCC"
    echo gcc at $(which gcc)
}

# ref http://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash
if [ -z ${ap_env+x} ]; then
    ap_env=14
fi
switch_env "$ap_env"

alias env09='ap_env=09; source ~/.bashrc;'
alias env12='ap_env=12; source ~/.bashrc;'
alias env14='ap_env=14; source ~/.bashrc;'

pathadd_head $AP_LOCAL_PATH

