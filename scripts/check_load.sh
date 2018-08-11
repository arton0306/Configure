run_task () {
    echo 'routine runs!'
}

low_load_counter=0
while true; do
    load=$(uptime | awk '{print $(NF-2)}' | awk -F . '{print $1}')
    if [ $(echo "$load < 1" | bc) ]; then
        echo "ok:) load=$load"
        low_load_counter=$low_load_counter+1
        if (($low_load_counter>=10)); then
            ps aux > ps.snapshot
            echo "$HOST load is low for 10min. Time to kick off the task!"
            run_task
            break
        fi
    else
        low_load_counter=0
        echo "wait... $HOST load=$load"
    fi
    sleep 1
done
