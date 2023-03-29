import os
import fiftyone as fo
import fiftyone.brain as fob

abs_path = f"{os.getcwd()}/datasets/processed" # get pwd so it works anywhere with the same file structure without changing the code
rov_path = "/rov"
auv_path = "/auv"

existent_datasets = fo.list_datasets()

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

    fob.compute_uniqueness(dataset)
    dataset.persistent = True
    return dataset

if __name__ == "__main__":
    rov = create_fiftyone_dataset(abs_path + rov_path, "rov", ["train", "val", "test"])
    auv = create_fiftyone_dataset(abs_path + auv_path, "auv", ["train", "val"])

    merged = fo.Dataset("merged")
    merged.merge_samples(auv)
    merged.merge_samples(rov)
    merged.persistent = True