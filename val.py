from ultralytics import YOLO
import pandas as pd
import os

yaml_file = "/home/sabf/thesis/thesis/datasets/auv/dataset.yaml"
model_dir = "/home/sabf/thesis/thesis/models/auv/"

models = os.listdir(model_dir)

auv_val = pd.DataFrame()

for m in models:
    file_path = model_dir + m
    model = YOLO(file_path)
    metrics = model.val(data=yaml_file)
    
    info = {"model_info": model.info(verbose=True)}

    info.update(metrics.results_dict)
    info.update(metrics.speed)

    info_df = pd.DataFrame(info, index=[m])
    print(info_df)
    auv_val = pd.concat([auv_val, info_df])

auv_val.to_csv("auv_val.csv")