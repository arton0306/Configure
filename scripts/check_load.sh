run_task () {
    echo 'routine runs!'
}

low_load_min=0
wait_min=0
while true; do
    load=$(uptime | awk '{print $(NF-2)}' | awk -F . '{print $1}')
    is_low_load=$(echo "$load < 2" | bc)
    if (($is_low_load)); then
        echo "$HOST load=$load, low load for $low_load_min mins"
        if (($low_load_min>=10)); then
            ps aux > ps.snapshot
            echo "$HOST load is low for 10min. Time to kick off the task!"
            run_task
            break
        fi
    else
        low_load_min=0
        echo "$wait_min mins passed. Please wait... $HOST load=$load"
    fi

    sleep 1
    ((wait_min=$wait_min+1))
    if [ $is_low_load ]; then
        ((low_load_min=$low_load_min+1))
    fi
done
