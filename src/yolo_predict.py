from ultralytics import YOLO

# models
# path_to_model = '/mnt/c/Users/sabri/Documents/github/thesis/models/auv/auv450.pt'
# path_to_model = "/mnt/c/Users/sabri/Documents/github/thesis/models/auv/exports/auv450.onnx"
# path_to_model = "/mnt/c/Users/sabri/Documents/github/thesis/models/auv/exports/auv450_saved_model/auv450_float16.tflite"
rov_large = '/mnt/c/Users/sabri/Documents/github/thesis/models/rov/rov_yolo8l_8_1280.pt'


# images
auv_images = '/mnt/c/Users/sabri/Documents/github/thesis/datasets/raw/images/output*'
all_images = '/mnt/c/Users/sabri/Documents/github/thesis/datasets/raw/images/'

# have a list of models here, track gpu and stuff with wandb in a loop

model = YOLO(rov_large, task='detect')

model.predict(all_images , save_conf=True, save_txt=True, imgsz=1280, batch=1, conf=0.5)
