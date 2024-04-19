Step_1:
conda create --name openmmlab python=3.8 -y
conda activate openmmlab

Step_2:
For GPU
conda install pytorch torchvision -c pytorch

For CPU Only
conda install pytorch torchvision cpuonly -c pytorch

Step_3:
pip install -U openmim
mim install mmengine
mim install mmcv
mim install mmdet
mim install mmpose

Step_4:
pip install -r requirments.txt

Step_5:
For running action prediction and keypoints pose tracking run following command:

Example:
python demo/demo_action_detection.py demo/Test_Videos/Demo_Fedrer_Tennis.mp4 demo/Test_Video_Results/Demo_Fedrer_Tennis_Out.mp4 \
    --config configs/skeleton/posec3d/slowonly_r50_8xb16-u48-240e_ntu60-xsub-keypoint.py \
    --checkpoint https://download.openmmlab.com/mmaction/skeleton/posec3d/slowonly_r50_u48_240e_ntu60_xsub_keypoint/slowonly_r50_u48_240e_ntu60_xsub_keypoint-f3adabf1.pth \
    --det-config demo/demo_configs/faster-rcnn_r50_fpn_2x_coco_infer.py \
    --det-checkpoint http://download.openmmlab.com/mmdetection/v2.0/faster_rcnn/faster_rcnn_r50_fpn_2x_coco/faster_rcnn_r50_fpn_2x_coco_bbox_mAP-0.384_20200504_210434-a5d8aa15.pth \
    --det-score-thr 0.9 \
    --det-cat-id 0 \
    --pose-config demo/demo_configs/td-hm_hrnet-w32_8xb64-210e_coco-256x192_infer.py \
    --pose-checkpoint https://download.openmmlab.com/mmpose/top_down/hrnet/hrnet_w32_coco_256x192-c78dce93_20200708.pth \
    --label-map tools/data/skeleton/label_map_ntu60.txt

python demo/demo_skeleton.py ${VIDEO_FILE} ${OUT_FILENAME} \
    [--config ${SKELETON_BASED_ACTION_RECOGNITION_CONFIG_FILE}] \
    [--checkpoint ${SKELETON_BASED_ACTION_RECOGNITION_CHECKPOINT}] \
    [--det-config ${HUMAN_DETECTION_CONFIG_FILE}] \
    [--det-checkpoint ${HUMAN_DETECTION_CHECKPOINT}] \
    [--det-score-thr ${HUMAN_DETECTION_SCORE_THRESHOLD}] \
    [--det-cat-id ${HUMAN_DETECTION_CATEGORY_ID}] \
    [--pose-config ${HUMAN_POSE_ESTIMATION_CONFIG_FILE}] \
    [--pose-checkpoint ${HUMAN_POSE_ESTIMATION_CHECKPOINT}] \
    [--label-map ${LABEL_MAP}] \
    [--device ${DEVICE}] \
    [--short-side] ${SHORT_SIDE}
    
Optional arguments:

    SKELETON_BASED_ACTION_RECOGNITION_CONFIG_FILE: The skeleton-based action recognition config file path.
    SKELETON_BASED_ACTION_RECOGNITION_CHECKPOINT: The skeleton-based action recognition checkpoint path or url.
    HUMAN_DETECTION_CONFIG_FILE: The human detection config file path.
    HUMAN_DETECTION_CHECKPOINT: The human detection checkpoint path or url.
    HUMAN_DETECTION_SCORE_THRE: The score threshold for human detection. Defaults to 0.9.
    HUMAN_DETECTION_CATEGORY_ID: The category id for human detection. Defaults to 0.
    HUMAN_POSE_ESTIMATION_CONFIG_FILE: The human pose estimation config file path (trained on COCO-Keypoint).
    HUMAN_POSE_ESTIMATION_CHECKPOINT: The human pose estimation checkpoint path or url (trained on COCO-Keypoint).
    LABEL_MAP: The label map used. Defaults to 'tools/data/skeleton/label_map_ntu60.txt'.
    DEVICE: Type of device to run the demo. Allowed values are cuda device like 'cuda:0' or 'cpu'. Defaults to 'cuda:0'.
    SHORT_SIDE: The short side used for frame extraction. Defaults to 480.



