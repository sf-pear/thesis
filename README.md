# Fine-tuning object detector on deep ocean data

This is the code for my Bachelors thesis at the IT University of Copenhagen.

In this project I explore the fine-tuning of object detectors in deep sea environments, and how they can be adapted for deployement in underwater vehicles.

## Environment set up
Personally, I use mamba, but conda will work as well. To create a new env with all the dependencies use the following command:
```bash
mamba env create -f env.yaml
```
To update the env is new packages are added to yaml file: 
```bash
mamba env update -n ocean --file env.yaml
```

## Explore the datasets

- `make add_datasets` Add datasets to FiftyOne.
- `make launch_51` Launch FiftyOne app. You will be prompted to choose which dataset you want to look at, AUV, ROV or both merged into one.
- The app will launch in the browser automatically. It can be accessed at [http://localhost:5151/](http://localhost:5151/)
- The process shuts down when you exit the app.

### FiftyOne CLI
Useful commands:
- `fiftyone datasets list` list existent datasets.
- `fiftyone datasets delete <name1> <name2>` delete datasets.

