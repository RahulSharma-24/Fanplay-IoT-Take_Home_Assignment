# Fan Art Generator


This contains the code for the implementation of a Fan Art Generator using Stable Diffusion. 


## File Organisation

- The folder *docker* contains the `Dockerfile` that can be used to build a docker image that can be used to train and perform inferencing
- `train.sh` can be used to train or fine tune an existing model over a custom data set
- `run_inferences.sh` can be used to perform inferencing with an existing model

## Docker

A completely ready docker image has been published to docker hub. It can be pulled using
```bash
docker pull rahulsharma272/rahulsharma272/fan_art_generator_rahul:v1.0
```
Alternatively you can also build the docker image locally using
```bash
cd docker
docker build -t <image_name> .
```

**Note** : If using a locally built docker image, please change the image name in `docker/fine_tune_custom.sh` and `docker/fine_tune_dataset.sh` for the changes to be reflected.


## Fine Tuning

### Fine Tuning over a dataset from huggingface

To perform training and fine tune a model using a dataset from huggingface run the following
```bash
sudo ./train.sh <name_of_model> <name_of_huggingface_dataset> <output_dir>
```
`<output_dir>` is the path where the trained model will be stored

For example, to fine tune the *CompVis/stable-diffusion-v1-4* model with the *polinaeterna/pokemon-blip-captions* dataset and store the output model in `/home/user/output_model/` run
```bash
sudo ./train.sh CompVis/stable-diffusion-v1-4 polinaeterna/pokemon-blip-captions /home/user/output_model/
```

### Fine Tuning over a custom dataset

To perform training and fine tune a model using a custom dataset that is compliant with [huggingface datasets](https://huggingface.co/docs/datasets/v2.4.0/en/image_load#imagefolder-with-metadata), just add a `--custom` argument at the end of the command:
```bash
sudo ./train.sh <name_of_model> <name_of_huggingface_dataset> <output_dir> --custom
```

For example, to fine tune the *CompVis/stable-diffusion-v1-4* model with the a dataset stored in `/home/user/data/` and store the output model in `/home/user/output_model/` run
```bash
sudo ./train.sh CompVis/stable-diffusion-v1-4 /home/user/data/ /home/user/output_model/ --custom
```


## Running Inferences

### Running Inferences with a pre-trained model from huggingface

To run inferences with a pre-trained model, run the following command
```bash
sudo ./run_inferences.sh --download <model_name> <output_dir> <prompts> 
```
Here, `<prompts>` is a list of prompts for which images have to be generated.

For example, to run inferences with the *redstonehero/cetusmix_v4* model and store the output images to `/home/user/output_images` with the prompts: "prompt1", "prompt2", "prompt3", run the following:
```bash
sudo ./run_inferences.sh --download redstonehero/cetusmix_v4 /home/user/output_images "prompt1" "prompt2" "prompt3" 
```
The outputs will be stored in the `<output_dir>` with the name as *prompt_output.png*


### Running Inference with a custom trained model

To run inferences with a custom trained model stored in `<model_path>`, run the following command
```bash
sudo ./run_inferences.sh <model_path> <output_dir> <prompts> 
```
Here, `<prompts>` is a list of prompts for which images have to be generated.

For example, to run inferences with the custom trained model stored in `/home/user/model` and store the output images to `/home/user/output_images` with the prompts: "prompt1", "prompt2", "prompt3", run the following:
```bash
sudo ./run_inferences.sh /home/user/model /home/user/output_images "prompt1" "prompt2" "prompt3" 
```
The outputs will be stored in the `<output_dir>` with the name as *prompt_output.png*


## Results

A stable diffusion model obtained from huggingface was initially tested. The pre-trained model used was **redstonehero/cetusmix_v4**. Different prompts of varying difficulty were provided to the model and its results were assesed. Some of the prompts and the generated images are given below:

| Prompt    | Image generated | Prompt | Image Generated |
| :--------: | :-------------: | :----:| :--------------:|
| A castle on a hilltop with a blue sky and green grass  |  ![A castle on a hilltop with a blue sky and green grass](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_2_Fan_Art_Generator/assets/pre-trained/A%20castle%20on%20a%20hilltop%20with%20a%20blue%20sky%20and%20green%20grass_output.png?raw=true "A castle on a hilltop with a blue sky and green grass")   | A young boy looking up at a starry sky with a shooting star  |  ![A castle on a hilltop with a blue sky and green grass](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_2_Fan_Art_Generator/assets/pre-trained/A%20young%20boy%20looking%20up%20at%20a%20starry%20sky%20with%20a%20shooting%20star_output.png?raw=true "A young boy looking up at a starry sky with a shooting star_output")   |
| A beautiful woman looking at a ocean from a beach on a sunny day  |  ![A beautiful woman looking at a ocean from a beach on a sunny day](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_2_Fan_Art_Generator/assets/pre-trained/A%20beautiful%20woman%20looking%20at%20a%20ocean%20from%20a%20beach%20on%20a%20sunny%20day_output.png?raw=true "A beautiful woman looking at a ocean from a beach on a sunny day_output")   | A guy and a girl having a candle light dinner date in a hotel  |  ![A guy and a girl having a candle light dinner date in a hotel](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_2_Fan_Art_Generator/assets/pre-trained/A%20guy%20and%20a%20girl%20having%20a%20candle%20light%20dinner%20date%20in%20a%20hotel_output.png?raw=true "A guy and a girl having a candle light dinner date in a hotel_output")   |
| A guy having breakfast in a fancy restaraunt  |  ![A guy having breakfast in a fancy restaraunt](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_2_Fan_Art_Generator/assets/pre-trained/A%20guy%20having%20breakfast%20in%20a%20fancy%20restaraunt_output.png?raw=true "A guy having breakfast in a fancy restaraunt_output")   | A large crowd waiting in line to enter into a very famous amusement park  |  ![A guy having breakfast in a fancy restaraunt](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_2_Fan_Art_Generator/assets/pre-trained/A%20large%20crowd%20waiting%20in%20line%20to%20enter%20into%20a%20very%20famous%20amusement%20park_output.png?raw=true "A large crowd waiting in line to enter into a very famous amusement park_output")   |


Following this, a fine tuning of the model was performed for a particular fandom, specifically for the **Pokemon fandom**. The fine tuning was performed over the ***CompVis/stable-diffusion-v1-4*** model with the ***polinaeterna/pokemon-blip-captions*** dataset present on huggingface. The training was performed on a system with *Intel(R) Xeon(R) Silver 4314 CPU* with *512 GB RAM* and a *48 GB Nvidia RTX A6000*. The training was completed in a total of *10 hours*. After careful hyperparameter tuning, the model fine tuned on the Pokemon dataset was assessed in a similar fashion as above. The results for the same are given below:


| Prompt    | Image generated | Prompt | Image Generated |
| :--------: | :-------------: | :----:| :--------------:|
| Master Yoda using the Force  |  ![Master yoda using the force](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_2_Fan_Art_Generator/assets/fine-tuned/Master%20yoda%20using%20the%20force_output.png?raw=true "Master Yoda using the Force")   | A group of pokemons having fun together  |  ![A group of pokemons having fun together](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_2_Fan_Art_Generator/assets/fine-tuned/A%20group%20of%20pokemons%20having%20fun%20together_output.png?raw=true "A group of pokemons having fun together_output")   |
| Charizard releasing a fire attack  |  ![Charizard releasing a fire attack](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_2_Fan_Art_Generator/assets/fine-tuned/Charizard%20releasing%20a%20fire%20attack_output.png?raw=true "Charizard releasing a fire attack_output")   | Charmander and and charmeleon battling it out in a large arena  |  ![Charmander and and charmeleon battling it out in a large arena](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_2_Fan_Art_Generator/assets/fine-tuned/Charmander%20and%20and%20charmeleon%20battling%20it%20out%20in%20a%20large%20arena_output.png?raw=true "Charmander and and charmeleon battling it out in a large arena_output")   |
| A cute version of Pikachu  |  ![A cute version of Pikachu](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_2_Fan_Art_Generator/assets/fine-tuned/A%20cute%20version%20of%20Pikachu_output.png?raw=true "A cute version of Pikachu_output")   | A collage of different pokemons  |  ![a collage of different pokemons](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_2_Fan_Art_Generator/assets/fine-tuned/a%20collage%20of%20different%20pokemons_output.png?raw=true "a collage of different pokemons_output")   |

It can be seen that the above images generated with the model fine tuned on the pokemon dataset are slightly subpar in quality compared to the pre-trained model. Despite careful hyperparameter tuning, the performance did not improve. Upon detailed analysis, it was realised that this issue can be attributed the lack of quality in the dataset used. Some of the prompts used in the dataset were incorrect or did not reflect information related to the Pokemon franchise. With a better dataset, the results obtained can be improved and has been left for future work.
