#!/bin/bash

# path to the directory containing the train files
train_dir=$(pwd)/datasets/processed/auv_increasing_random

# loop over each train file and submit a SLURM job to train a yolov8 model
for train_file in $train_dir/train*.txt
do
  # replace the train field in dataset.yaml with the path to the current train file
  sed -i "s|train:.*|train: $train_file|" $train_dir/dataset.yaml

  # print the value of train_file
  echo "Current train file: $train_file"

  # submit a SLURM job to train yolov8 model
#   sbatch $(pwd)/jobs/auv_coco.job
done