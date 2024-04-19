# Movement Analysis & Prediction based on User Action 

For a given video, in order to analyse the movement by identifying the keypoints and predicting the action of user, **mmaction 2** , a toolbox developed by the open-mmlab teams is used. (https://github.com/open-mmlab/mmaction2).


## Steps

1.  **Create a new Conda environment**
```bash

   conda create --name openmmlab python=3.8 -y conda activate openmmlab

```

2. **PyTorch Installation** </br>

     - **For GPU**
      ```bash

          conda install pytorch torchvision -c pytorch
      
      ```
   - **For CPU Only**
    
     ```bash
     conda install pytorch torchvision cpuonly -c pytorch 
    ```
3. **Installation of Packages**
   
   MIM (Model Index Manager) is a command-line tool for managing open-mmlab libraries and models.
   ```bash
   
   pip install -U openmim
   
    ```
   Installation of various MIM-compatible libraries such as MMEngine, MMCV, MMDetection, and MMPose.
    ```bash
    
   mim install mmengine
   mim install mmcv
   mim install mmdet
   mim install mmpose
    
   ```
    
5. **Additional Requirements**
 ```bash

    pip install -r requirments.txt

 ```
5. **For running action prediction and keypoints pose tracking**

     It consists of following
   - python script used for action detection
   - path to the input video file
   - path where the output video is saved
     
 Example of one such video
     
 ```bash

    python demo/demo_action_detection.py demo/Test_Videos/Demo_Fedrer_Tennis.mp4 demo/Test_Video_Results/Demo_Fedrer_Tennis_Out.mp4

 ```

In addition to arguments above, it requires the following two files as inputs.

- Config files : Python script which contain information related to the model architecture, dataset specifics, training parameters, etc.
- Checkpoint files : The .pth files are PyTorch checkpoints containing the saved state of pre-trained weights for the detection and skeleton-based action recognition model.

The default values of both are provided, custom values can be passed by the user.
An example of using custom arguments is as follows:
```bash
python demo/demo_action_detection.py demo/Test_Videos/Demo_Fedrer_Tennis.mp4 demo/Test_Video_Results/Demo_Fedrer_Tennis_Out.mp4 
--config configs/skeleton/posec3d/slowonly_r50_8xb16-u48-240e_ntu60-xsub-keypoint.py
--checkpoint https://download.openmmlab.com/mmaction/skeleton/posec3d/slowonly_r50_u48_240e_ntu60_xsub_keypoint/slowonly_r50_u48_240e_ntu60_xsub_keypoint-f3adabf1.pth
--det-config demo/demo_configs/faster-rcnn_r50_fpn_2x_coco_infer.py
--det-checkpoint http://download.openmmlab.com/mmdetection/v2.0/faster_rcnn/faster_rcnn_r50_fpn_2x_coco/faster_rcnn_r50_fpn_2x_coco_bbox_mAP-0.384_20200504_210434-a5d8aa15.pth
--det-score-thr 0.9
--det-cat-id 0
--pose-config demo/demo_configs/td-hm_hrnet-w32_8xb64-210e_coco-256x192_infer.py
--pose-checkpoint https://download.openmmlab.com/mmpose/top_down/hrnet/hrnet_w32_coco_256x192-c78dce93_20200708.pth
--label-map tools/data/skeleton/label_map_ntu60.txt
```


The pose estimation and prediction pipeline involves the use of two datasets, namely `skeleton` for tracking key points and `kinetic` for prediction of the action being performed. **Faster-RCNN** is used as the `human detector`, **HRNetw32** as the `pose estimator`, **PoseC3D-NTURGB+D-60-XSub-Keypoint** as the `skeleton-based action recognizer`. **tsn** model was trained on 'Kinetic dataset' for action prediction.

**Note**: While running `demo/demo_action_detection.py`, please change the path of the video_file in order to generate the outputs of different videos.



# Results

A pre-trained model trained on different datasets present in `config` folder was tested. Videos of different actions under varying lighting conditions and increasing complexity were used to assess the model performance. Some of the results obtained are given below.
|Image generated | Image Generated |
| :--------: | :--------------:|
| ![](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_1_Movement_Analysis_and_Prediction/mmaction_reduced/assets/Demo_Fedrer_Tennis_Out.gif?raw=true)  |  ![](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_1_Movement_Analysis_and_Prediction/mmaction_reduced/assets/Demo_Rahul_PushUp_Out.gif?raw=true)   |
| ![](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_1_Movement_Analysis_and_Prediction/mmaction_reduced/assets/Demo_Laxmi_Basketball_Out.gif?raw=true)  |  ![](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_1_Movement_Analysis_and_Prediction/mmaction_reduced/assets/Demo_Omkar_Juggling_Out.gif?raw=true)|
| ![](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_1_Movement_Analysis_and_Prediction/mmaction_reduced/assets/Demo_Rahul_Drinking_Out.gif?raw=true)|  ![](https://github.com/rahul-sharma-robotics/fanplay-iot-submission/blob/main/Question_1_Movement_Analysis_and_Prediction/mmaction_reduced/assets/Demo_Messi_Football_Out.gif?raw=true)   |

This model predicts the action from a fixed set, which is large enough to cover most of the everyday life actions, however, there can still be some actions that are incorrectly classified because of its abscence in the `kinetic`dataset. This problem can be solved by increasing the number of actions in the dataset. Another approach could be to incorporate an NLP model into the pipeline which can generate a sentence about the action.
