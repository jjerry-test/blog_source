---
title: Google Coral USB 사용기
date: 2020-03-31T18:30:46+06:00
draft: false

#post thumb
image: #"images/featured-post/post-1.jpg"

# meta description
description: "this is meta description"
math: true

# taxonomies
categories:
  - "DeepLearning"
tags:
  - "Tools"

# post type
type: "post"
---

# Raspberry pi 4 & Google Coral USB Accelerator

평소에 라즈베리파이 4를 NAS로 사용하고 있었습니다.  [이런 느낌으로..](https://jjerry-k.github.io/living/2018/07/10/Raspberry-Mini-PC/)

하지만...항상 마음 속에는 "흠....라즈베리파이로 딥러닝을 돌려보고 싶다..." 라는 생각을 하고 있었죠.

평소와 같이 ~~평화로운 중고나라~~ 를 탐색하고 있었습니다. (모니터가 사고 싶어서 ....)

근데 . . 갑자기 . . ? 왜 인지 모르겠지만 Google Coral USB Accelerator 를 검색하고 싶더군요. 

그래서 바로 검색을 했고 7마넌(나름 저렴)에 올라와있길래 일요일에 주문을 했습니다. 

그리고 오늘 집에 도착을 했죠. 

이제 사용을 해보려고 합니다. 

준비물을 소개하도록 하죠.

# 준비물

- 라즈베리 파이
- Coral Accelerator
- Webcam

{{< figure src="/images/post/coral/01.png" >}}

# Step 1. 연결

{{< figure src="/images/post/coral/02.png" >}}

{{< figure src="/images/post/coral/03.png" >}}

모두 연결 후 라즈베리파이를 켜면 위 사진과 같이 USB에 흰색 불이 들어옵니다.

# Step 2. 라즈베리파이 세팅

    #!/bin/bash
    
    echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | sudo tee /etc/apt/sources.list.d/coral-edgetpu.list
    
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    
    sudo apt-get update
    
    sudo apt-get install libedgetpu1-std
    
    # Check Your Platform 
    # https://www.tensorflow.org/lite/guide/python
    sudo pip3 install https://dl.google.com/coral/python/tflite_runtime-2.1.0.post1-cp37-cp37m-linux_armv7l.whl

    #!/bin/bash
    
    git clone https://github.com/google-coral/examples-camera.git
    
    cd examples-camera
    
    sh download_models.sh

`download_models.sh`를 실행하시면 다음과 같이  `all_models`라는 디렉토리 안에 각 데이터셋 별 labelmap.txt와 학습된 모델의 tflite 파일이 있습니다. 

여기서 밑줄 친 파일을 이용해서 object detection 을 해볼겁니다! 일단 그 다음 세팅으로 넘어가죠.

{{< figure src="/images/post/coral/04.png" >}}

    #!/bin/bash
    
    cd opencv
    
    sh install_requirements.sh

opencv를 이용한 스크립트를 사용하기 위해 필요한 것들을 설치합니다. 

# Step 3. 스크립트 실행

이제 opencv 디렉토리 안에 detect.py를 실행 시켜줄건데요. 옵션이 몇개 있습니다. 한번 살펴보도록 하죠.

    usage: detect.py [-h] [--model MODEL] [--labels LABELS] [--top_k TOP_K]
                     [--camera_idx CAMERA_IDX] [--threshold THRESHOLD]
    
    optional arguments:
      -h, --help            show this help message and exit
      --model MODEL         .tflite model path
      --labels LABELS       label file path
      --top_k TOP_K         number of categories with highest score to display
      --camera_idx CAMERA_IDX
                            Index of which video source to use.
      --threshold THRESHOLD
                            classifier score threshold

한번 다음과 같이 실행을 해보겠습니다. 

    python detect.py \
    --model ../all_models/mobilenet_ssd_v2_face_quant_postprocess_edgetpu.tflite \
    --labels ../all_models/coco_labels.txt \
    --top_k 3 \
    --threshold 0.7

{{< figure src="/images/post/coral/05.png" >}}

막 빠를 줄 알았는데 Webcam 의 한계라 그런지... FPS가 낮네요.. 

추후에 카메라 모듈을 이용해서 해봐야겠습니다.  

그럼 간단한 이용기를 마치겠습니다.