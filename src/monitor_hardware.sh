#!/bin/bash

# Run your inference script
python3 yolo_predict.py &

# Get the PID of the inference script
PID=$!

# Define the output CSV file name
start_time=$(date "+%Y-%m-%d_%H-%M-%S")
# csv_filename="hardware_stats_${start_time}.csv"
csv_filename="hardware_stats.csv"

# Write headers to the CSV file
echo "timestamp,CPU,Memory,GPU_Util,GPU_Mem,Power" > $csv_filename

# Monitor hardware utilization while the inference script is running
while [ -e /proc/$PID ]
do
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    
    # Get CPU and memory usage
    cpu_mem=$(ps -p $PID -o %cpu=,%mem= --no-headers)
    
    # Get GPU utilization, memory, and power usage (NVIDIA GPUs only)
    gpu_data=$(nvidia-smi --query-gpu=utilization.gpu,memory.used,power.draw --format=csv,noheader,nounits | sed 's%,%, %g' | tr '\n' ' ')
    
    # Write hardware utilization data to the CSV file
    echo "${timestamp},${cpu_mem},${gpu_data}" >> $csv_filename
    
    sleep 1
done
