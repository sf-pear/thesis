import fiftyone as fo

abs_path = "/mnt/c/Users/sabri/Documents/github/thesis"

rov_path = "/datasets/rov"
auv_path = "/datasets/auv"

def create_fiftyone_dataset(path_to_dataset, dataset_name, splits):
    # check if the dataset already exists
    if dataset_name in existent_datasets:
        dataset = fo.load_dataset(dataset_name)
        print(f"Dataset loaded: {dataset_name}.\n")
    else:
        # the splits to load
        splits = splits

        # load the dataset, using tags to mark the samples in each split
        dataset = fo.Dataset(dataset_name)
        for split in splits:
            dataset.add_dir(
                dataset_dir=path_to_dataset,
                dataset_type=fo.types.YOLOv5Dataset,
                split=split,
                tags=[split, dataset_name],
                label_field="ground_truth",
            )
        print(f"Dataset created: {dataset_name}.\n")

    dataset.persistent = True
    return dataset

existent_datasets = fo.list_datasets()

rov = create_fiftyone_dataset(abs_path + rov_path, "rov2", ["train", "val", "test"])
auv = create_fiftyone_dataset(abs_path + auv_path, "auv2", ["train", "val"])

merged = fo.Dataset("merged")
merged.merge_samples(auv)
merged.merge_samples(rov)

if __name__ == "__main__":
    # ensures that the App processes are safely launched on Windows
    session = fo.launch_app(merged)
    session.wait()