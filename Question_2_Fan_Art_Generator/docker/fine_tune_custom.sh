#export MODEL_NAME="CompVis/stable-diffusion-v1-4"
#export dataset_name="polinaeterna/pokemon-blip-captions"

export MODEL_NAME=$1
export dataset_dir=$2

accelerate launch --config_file config.yaml \
    diffusers/examples/text_to_image/train_text_to_image.py \
  --pretrained_model_name_or_path=$MODEL_NAME \
  --train_data_dir=$dataset_dir \
  --use_ema \
  --resolution=512 --center_crop --random_flip \
  --train_batch_size=1 \
  --gradient_accumulation_steps=4 \
  --gradient_checkpointing \
  --mixed_precision="fp16" \
  --max_train_steps=15000 \
  --learning_rate=1e-05 \
  --max_grad_norm=1 \
  --lr_scheduler="constant" --lr_warmup_steps=0 \
  --output_dir=$3 
  #--output_dir="sd-pokemon-model" 
