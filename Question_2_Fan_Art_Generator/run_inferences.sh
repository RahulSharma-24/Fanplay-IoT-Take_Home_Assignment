#!/bin/bash
DOWNLOAD_MODEL=$1
MODEL_PATH=$2
OUTPUT_DIR=$3

shift

if [[ $DOWNLOAD_MODEL == "--download" ]]; then
	docker run -it --rm -v $OUTPUT_DIR:$OUTPUT_DIR rahulsharma272/fan_art_generator_rahul:v1.0  python3 /home/user/fanplay_iot/run_inferences.py $@
else
	docker run -it --rm -v $MODEL_PATH:$MODEL_PATH -v $OUTPUT_DIR:$OUTPUT_DIR rahulsharma272/fan_art_generator_rahul:v1.0 python3 /home/user/fanplay_iot/run_inferences.py $@
fi
