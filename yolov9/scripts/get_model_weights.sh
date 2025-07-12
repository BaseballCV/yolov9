#!/bin/bash

if [ -z "$1" ]; then
    echo "Please provide a model name as argument"
    echo "Available models:"
    echo "yolov9-s-converted.pt, yolov9-m-converted.pt, yolov9-c-converted.pt, yolov9-e-converted.pt"
    echo "yolov9-s.pt, yolov9-m.pt, yolov9-c.pt, yolov9-e.pt"
    echo "gelan-s.pt, gelan-m.pt, gelan-c.pt, gelan-e.pt"
    exit 1
fi

model_name=$1
base_url="https://github.com/WongKinYiu/yolov9/releases/download/v0.1"

if [ -n "$2" ]; then
    weights_dir="$2/weights"
else
    weights_dir="weights"
fi

mkdir -p $weights_dir

valid_models=("yolov9-s-converted.pt" "yolov9-m-converted.pt" "yolov9-c-converted.pt" "yolov9-e-converted.pt" 
             "yolov9-s.pt" "yolov9-m.pt" "yolov9-c.pt" "yolov9-e.pt"
             "gelan-s.pt" "gelan-m.pt" "gelan-c.pt" "gelan-e.pt")

valid=0
for valid_model in "${valid_models[@]}"; do
    if [ "$model_name" = "$valid_model" ]; then
        valid=1
        break
    fi
done

if [ $valid -eq 0 ]; then
    echo "Invalid model name: $model_name"
    echo "Available models:"
    printf '%s\n' "${valid_models[@]}"
    exit 1
fi

echo "Downloading $model_name to $weights_dir/..."
curl -L "$base_url/$model_name" -o "$weights_dir/$model_name"

if [ $? -eq 0 ]; then
    echo "Successfully downloaded $model_name to $weights_dir/"
else
    echo "Failed to download $model_name"
    exit 1
fi
