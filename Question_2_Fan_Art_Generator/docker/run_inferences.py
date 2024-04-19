import argparse
from diffusers import StableDiffusionPipeline
import torch
import os

CLI=argparse.ArgumentParser()
CLI.add_argument(
  "path_to_saved_model", type=str,
  default=""
)
CLI.add_argument(
  "output_path", type=str,
  default=""
)
CLI.add_argument(
  "prompts", nargs="*", type=str,
  default=['yoda']
)
args = CLI.parse_args()

model_path = args.path_to_saved_model
if torch.cuda.is_available():
    pipe = StableDiffusionPipeline.from_pretrained(model_path, torch_dtype=torch.float16)
    pipe.to("cuda")
else:
    pipe = StableDiffusionPipeline.from_pretrained(model_path, torch_dtype=torch.float32)

output_path = args.output_path
prompts = args.prompts
for prompt in prompts:
    image = pipe(prompt=prompt).images[0]
    output_path = os.path.join(output_path, f'{image}_output.png')
    image.save(output_path)
