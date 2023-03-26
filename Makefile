current_dir = $(shell pwd)

print_dir:
	@echo "Dir is $(current_dir)/"

add_datasets:
	python3 ./src/add_datasets.py

launch_51:
	python3 ./src/launch_51.py	