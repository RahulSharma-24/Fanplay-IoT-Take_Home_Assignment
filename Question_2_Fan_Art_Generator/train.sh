#!/bin/bash
MODEL_NAME=$1
DATASET_NAME=$2
OUTPUT_DIR=$3
CUSTOM=$4

if [[ $CUSTOM == "--custom" ]]; then
	docker run -it --rm -v $OUTPUT_DIR:$OUTPUT_DIR rahulsharma272/fan_art_generator_rahul:v1.0 /home/user/fanplay_iot/fine_tune_custom.sh $MODEL_NAME $DATASET_NAME $OUTPUT_DIR
else
	docker run -it --rm -v $OUTPUT_DIR:$OUTPUT_DIR rahulsharma272/fan_art_generator_rahul:v1.0 /home/user/fanplay_iot/fine_tune_dataset.sh $MODEL_NAME $DATASET_NAME $OUTPUT_DIR
fi

