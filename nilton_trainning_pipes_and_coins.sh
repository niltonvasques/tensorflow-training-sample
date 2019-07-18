#!/bin/bash
if [ $1 -eq 1 ]
then
  apt update && apt install python3-pip -y
  pip3 install --upgrade pip
  apt remove python3-pip
  bash
fi

if [ $1 -eq 2 ]
then
  pip3 --version
  pip3 install tensorflow-gpu==1.12.3
  pip3 install matplotlib
  pip3 install jupyter
  pip3 install pillow
  pip3 install contextlib2
  pip3 install lxml
  pip3 install Cython
  pip3 install pycocotools
  export PYTHONPATH=$PYTHONPATH:'local path':`pwd`/slim
  python3 object_detection/builders/model_builder_test.py
  python3 setup.py build
  python3 setup.py install
  python3 object_detection/model_main.py --logtostderr --train_dir=/home/niltonvasques/Development/datasets/training/ --pipeline_config_path=/home/niltonvasques/Development/datasets/training/faster_rcnn_inception_v2_coco_2018_01_28/pipeline.config
fi
#python3 model_main.py --logtostderr --train_dir=/home/niltonvasques/Development/datasets/training/ --pipeline_config_path=/home/niltonvasques/Development/datasets/training/faster_rcnn_inception_v2_coco_2018_01_28/pipeline.config
#python3 object_detection/legacy/train.py --logtostderr --train_dir=/home/niltonvasques/Development/datasets/training/ --pipeline_config_path=/home/niltonvasques/Development/datasets/training/faster_rcnn_inception_v2_coco_2018_01_28/pipeline.config
#python3 object_detection/model_main.py --logtostderr --train_dir=/home/niltonvasques/Development/datasets/training/ --pipeline_config_path=/home/niltonvasques/Development/datasets/training/faster_rcnn_resnet50_coco_2018_01_28/pipeline.config
