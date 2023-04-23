#!/bin/bash

python3 yolo_predict.py &

# get the PID of the inference script
PID=$!

csv_filename="hardware_stats_tflite16.csv"

# write headers to the CSV file
echo "timestamp,CPU,Memory,GPU_Util,GPU_Mem,GPU_Mem_Free,Power" > $csv_filename

# monitor hardware utilization while the inference script is running
while [ -e /proc/$PID ]
do
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    
    # Get CPU and memory usage
    cpu_mem=$(ps -p $PID -o %cpu=,%mem= --no-headers | sed 's/ /,/')

    # GPU utilization, memory, free memory, and power usage - e.g.: 0 %, 32 MiB, 5935 MiB, 8.48 W
    gpu_data=$(nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.free,power.draw --format=csv,noheader,nounits | tr -d ' ')

    # write to file
    echo "${timestamp},${cpu_mem},${gpu_data}" >> $csv_filename
    
    # fetch info every 1 second
    sleep 1
done
