# Training a PET detector

Starting a NVIDIA-DOCKER with tensorflow

    sudo tee /proc/acpi/bbswitch <<\<ON; \
    cat /proc/acpi/bbswitch && \
    docker run --workdir=$(pwd) --volume="/home/$USER:/home/$USER" --runtime=nvidia -it tensorflow/tensorflow:1.12.3-gpu bash

# Starting the training

    cd tensorflow/models/research

    python3 object_detection/model_main.py --logtostderr --train_dir=/home/niltonvasques/Development/datasets/pets/ \
    --pipeline_config_path=/home/niltonvasques/Development/datasets/pets/faster_rcnn_resnet101_pets.config

# Exporting the model graph

    cp /tmp/tmpsomeexecution/model.cpkt.* .

    python3 object_detection/export_inference_graph.py --input_type image_tensor \
    --pipeline_config_path /home/niltonvasques/Development/datasets/pets/faster_rcnn_resnet101_pets.config \
    --trained_checkpoint_prefix model.ckpt-47617 --output_directory exported_graphs


# Detecting

    jupyter notebook object_detection_tutorial.ipynb
