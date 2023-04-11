#!/bin/bash

# path to the directory containing the train files
train_dir=$(pwd)/datasets/processed/auv_increasing_random

# set the counter to 25
counter=25

# loop over each counter value and submit a SLURM job to train a yolov8 model
while [ $counter -le 450 ]
do
  # get the train.txt file for the current counter value
  train_file=$train_dir/train$counter.txt

  # replace the train field in dataset.yaml with the path to the current train file
  sed "s|train:.*|train: $train_file|" $train_dir/dataset.yaml > $train_dir/dataset$counter.yaml

  # print the value of train_file
  echo "Current train file: $train_file"

  # increment the counter by 25
  counter=$((counter+25))

done
