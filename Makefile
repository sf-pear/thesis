DIR = $(shell pwd)

print_dir:
	@echo "Dir is $(DIR)"

51_add_datasets:
	python3 $(DIR)/src/51_add_datasets.py

51_launch:
	python3 $(DIR)/src/51_launch.py	

51_delete_dataset:
	python3 $(DIR)/src/51_delete_datasets.py	

mamba_create:
	mamba env create -n ocean --file env.yaml

mamba_update:
	mamba env update -n ocean --file env.yaml

# this only works for my local machine and hpc - version with args saved for later?
update_paths:
	./src/change_paths.sh

# send SLURM jobs to hpc for increasing number of AUV images
send_auv_jobs:
	./src/send_auv_jobs.sh