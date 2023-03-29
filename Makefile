current_dir = $(shell pwd)

print_dir:
	@echo "Dir is $(current_dir)"

51_add_datasets:
	python3 $(current_dir)/src/51_add_datasets.py

51_launch:
	python3 $(current_dir)/src/51_launch.py	

51_delete_dataset:
	python3 $(current_dir)/src/51_delete_datasets.py	

mamba_update:
	mamba env update -n ocean --file env.yaml