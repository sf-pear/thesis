current_dir = $(shell pwd)

print_dir:
	@echo "Dir is $(current_dir)"

add_datasets:
	python3 $(current_dir)/src/51_add_datasets.py

launch_51:
	python3 $(current_dir)/src/51_launch.py	

mamba_update:
	mamba env update -n ocean --file env.yaml