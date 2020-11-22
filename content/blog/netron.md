---
title: Netron! Network 구조를 보여주세요!
date: 2020-07-20T18:30:46+06:00
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

오늘은 [netron](https://github.com/lutzroeder/netron) 이라는 Tool를 드리려 합니다. 

> 본 포스팅은 [https://github.com/lutzroeder/netron](https://github.com/lutzroeder/netron) 내용을 이용하여 작성하였습니다.

간단히 말씀드리면 Neural network viewer 입니다.

굉장히 많은 Framework들을 지원하고 있습니다. 

- **ONNX** (`.onnx`, `.pb`, `.pbtxt`)
- **Keras** (`.h5`, `.keras`)
- **Core ML** (`.mlmodel`)
- **Caffe** (`.caffemodel`, `.prototxt`)
- **Caffe2** (`predict_net.pb`)
- **Darknet** (`.cfg`)
- **MXNet** (`.model`, `-symbol.json`)
- **Barracuda** (`.nn`)
- **ncnn** (`.param`)
- **Tengine** (`.tmfile`)
- **TNN** (`.tnnproto`)
- **UFF** (`.uff`)
- **TensorFlow Lite** (`.tflite`)

이 외에도 불안정하지만 다음과 같은 Framework 도 지원합니다.  

- **TorchScript** (`.pt`, `.pth`)
- **PyTorch** (`.pt`, `.pth`)
- **Torch** (`.t7`)
- **Arm NN** (`.armnn`)
- **BigDL** (`.bigdl`, `.model`)
- **Chainer** (`.npz`, `.h5`)
- **CNTK** (`.model`, `.cntk`)
- **Deeplearning4j** (`.zip`)
- **MediaPipe** (`.pbtxt`)
- **ML.NET** (`.zip`)
- **MNN** (`.mnn`)
- **PaddlePaddle** (`.zip`, `__model__`)
- **OpenVINO** (`.xml`)
- **scikit-learn** (`.pkl`)
- **TensorFlow.js** (`model.json`, `.pb`)
- **TensorFlow** (`.pb`, `.meta`, `.pbtxt`, `.ckpt`, `.index`)

(솔직히 Torch, TensorFlow 종류는 왜 나눠서 설명하는지 잘 모르겠음.....하나로 합쳐 놓으면 안되나..)

## 설치 및 사용법

netron은 PC에 설치해서 사용하거나 설치없이 Browser 버전으로 사용할 수도 있습니다. 

- **macOS**: **[Download](https://github.com/lutzroeder/netron/releases/latest)** the `.dmg` file or run `brew cask install netron`
- **Linux**: **[Download](https://github.com/lutzroeder/netron/releases/latest)** the `.AppImage` file or run `snap install netron`
- **Windows**: **[Download](https://github.com/lutzroeder/netron/releases/latest)** the `.exe` installer or run `winget install netron`
- **Python Server**: Run `pip install netron` and `netron [FILE]` or `import netron; netron.start('[FILE]')`
- **Browser**: **[Start](https://www.lutzroeder.com/ai/netron)** the browser version.

한번 브라우저 버전을 실행시켜 보았습니다. 

{{< figure src="https://github.com/jjerry-k/jjerry-k.github.io/blob/master/public/img/netron/Untitled.png?raw=true" >}}

`Open Model` 을 클릭 하신 후 보고 싶은 Network 저장 파일을 선택합니다. 

{{< figure src="https://github.com/jjerry-k/jjerry-k.github.io/blob/master/public/img/netron/Untitled_1.png?raw=true" >}}

Network 구조가 차례로 보이네요. 

{{< figure src="https://github.com/jjerry-k/jjerry-k.github.io/blob/master/public/img/netron/Untitled_2.png?raw=true" >}}

다음은 keras로 작성된 MobileNetV2 를 netron으로 띄운 후 앞 부분을 잘라낸 사진입니다. 

{{< figure src="https://github.com/jjerry-k/jjerry-k.github.io/blob/master/public/img/netron/Untitled_3.png?raw=true" >}}

왼쪽에는 네트워크 구조를 볼 수 있고 만약 레이어를 선택하면 오른쪽에 Node(Layer)에 대한 세부 설정 값들을 확인할 수 있습니다. 

몇몇 프레임워크 별로 sample을 이렇게 제공해줍니다!

open을 누르면 browser를 이용하여 볼 수 있네요!

- **ONNX**: [squeezenet](https://raw.githubusercontent.com/onnx/tutorials/master/tutorials/assets/squeezenet.onnx) [[open](https://lutzroeder.github.io/netron?url=https://raw.githubusercontent.com/onnx/tutorials/master/tutorials/assets/squeezenet.onnx)]
- **CoreML**: [exermote](https://raw.githubusercontent.com/Lausbert/Exermote/master/ExermoteInference/ExermoteCoreML/ExermoteCoreML/Model/Exermote.mlmodel) [[open](https://lutzroeder.github.io/netron?url=https://raw.githubusercontent.com/Lausbert/Exermote/master/ExermoteInference/ExermoteCoreML/ExermoteCoreML/Model/Exermote.mlmodel)]
- **Darknet**: [yolo](https://raw.githubusercontent.com/AlexeyAB/darknet/master/cfg/yolo.cfg) [[open](https://lutzroeder.github.io/netron?url=https://raw.githubusercontent.com/AlexeyAB/darknet/master/cfg/yolo.cfg)]
- **Keras**: [mobilenet](https://raw.githubusercontent.com/aio-libs/aiohttp-demos/master/demos/imagetagger/tests/data/mobilenet.h5) [[open](https://lutzroeder.github.io/netron?url=https://raw.githubusercontent.com/aio-libs/aiohttp-demos/master/demos/imagetagger/tests/data/mobilenet.h5)]
- **MXNet**: [inception_v3](https://raw.githubusercontent.com/soeaver/mxnet-model/master/cls/inception/inception_v3-symbol.json) [[open](https://lutzroeder.github.io/netron?url=https://raw.githubusercontent.com/soeaver/mxnet-model/master/cls/inception/inception_v3-symbol.json)]
- **TensorFlow**: [chessbot](https://raw.githubusercontent.com/srom/chessbot/master/model/chessbot.pb) [[open](https://lutzroeder.github.io/netron?url=https://raw.githubusercontent.com/srom/chessbot/master/model/chessbot.pb)]
- **TensorFlow Lite**: [hair_segmentation](https://raw.githubusercontent.com/google/mediapipe/master/mediapipe/models/hair_segmentation.tflite) [[open](https://lutzroeder.github.io/netron?url=https://raw.githubusercontent.com/google/mediapipe/master/mediapipe/models/hair_segmentation.tflite)]
- **TorchScript**: [traced_online_pred_layer](https://raw.githubusercontent.com/ApolloAuto/apollo/master/modules/prediction/data/traced_online_pred_layer.pt) [[open](https://lutzroeder.github.io/netron?url=https://raw.githubusercontent.com/ApolloAuto/apollo/master/modules/prediction/data/traced_online_pred_layer.pt)]
- **Caffe**: [mobilenet_v2](https://raw.githubusercontent.com/shicai/MobileNet-Caffe/master/mobilenet_v2.caffemodel) [[open](https://lutzroeder.github.io/netron?url=https://raw.githubusercontent.com/shicai/MobileNet-Caffe/master/mobilenet_v2.caffemodel)]

## P.S. 
- 피곤...
