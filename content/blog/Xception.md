---
title: "Review: Xception"
date: 2020-02-16T18:30:46+06:00
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
  - "Paper"

# post type
type: "post"
---

# Xception: Deep Learning with Depthwise Separable Convolution

Author: Franc¸ois Chollet  
Date: Dec 19, 2016  
URL: https://arxiv.org/abs/1610.02357

---

# Abstract

- CNN 에서 많이 사용되는 Inception 은 Regular Convolution 과 Depthwise Separable Convolution 의 중간 단계.
- Depthwise Separable Convolution 은 최대 개수의 타워를 가진 Inception module (?)
- Inception module을 Depthwise Separable Convolution 으로 대체한 새로운 Deep Convolutional Neural Network 제안.
- Xception 이라고 칭함.
- ImageNet 으로 학습된 Inception V3 보다 살짝 성능이 좋고 350,000,000개의 이미지와 17,000개의 클래스로 구성된 Larger image dataset 에선 Inception V3 보다 월등히 뛰어난 성능을 보임.
- Inception V3와 Xception 이 동일한 parameter 수를 가짐.
- 그러므로 연산량, 메모리의 증가가 아닌 모델 parameter를 효과적으로 사용해서 성능 향상이 된 것.

# **1. Introduction**

- Convolutional Neural Network (이하 CNN) 은 Computer Vision 에서 가장 주요한 알고리즘이 되었고, 이를 설계하는 방법에 대해 개발하는데 많은 관심을 가지게 됨.
- Lenet -> AlexNet (2012) -> ZFNet (2013) -> VGG (2014) -> Inception 종류 ... -> Inception-ResNet (2015)
- Inception 스타일의 기본 구성 요소는 Inception module.
- Figure 1은 Inception V3 의 표준 Inception Module.

    ![https://jjerry-k.github.io/public/img/xception/Untitled.png](https://jjerry-k.github.io/public/img/xception/Untitled.png)

- Inception 모델은 위와 같은 모듈을 Stack 한 것. VGG-Style 네트워크는 단순히 Convolution layer를 Stack.
- 실험적으로 Inception-style 이 VGG-style보다 적은 parameter로 다양한, 많은 feature를 학습 할 수 있다는 것을 보임.

## **1.1 The Inception hypothesis**

- Convolution layer는 3차원 공간에서 filter를 학습하려고 함.
- Single Convolution kernel 은 채널의 correlation과 공간의 correlation 을 동시에 mapping 함.
- Inception 모듈은 채널, 공간의 correlation 을 독립적으로 나타낼 수 있도록 연산을 분해. -> 쉽고 효율적인 프로세스를 만듦.
- Inception의 가설은 채널 채널, 공간의 correlation 이 분리되어 있으므로 동시에 매핑하는 것은 좋지 않다는 것.
- Figure 2는 3x3 conv와 1x1 conv만 사용한 단순화한 Inception 모듈.

    ![https://jjerry-k.github.io/public/img/xception/Untitled_1.png](https://jjerry-k.github.io/public/img/xception/Untitled_1.png)

- Figure 3은 Figure 2의 Inception 모듈에서 하나의 큰 1x1 Convolution과 3x3 Convolution들로 재구성한 것.

    ![https://jjerry-k.github.io/public/img/xception/Untitled_2.png](https://jjerry-k.github.io/public/img/xception/Untitled_2.png)

- 이 방법이 Inception 의 가설보다 뛰어난 가설을 만드는 것이 합리적인 것일지, 채널과 공간을 독립적으로 매핑할 수 있는지 의문.

## **1.2 The continuum between convolutions and separable convolutions**

- Figure 4 처럼 Inception 모듈 구성.

    ![https://jjerry-k.github.io/public/img/xception/Untitled_3.png](https://jjerry-k.github.io/public/img/xception/Untitled_3.png)

- 1x1 Convolution 적용하여 채널의 correlation 매핑, 그 후 각각의 channel별로 공간의 correlation 매핑
- 이를 **An “extreme” version of an Inception module** 이라고 칭함.
- TensorFlow 프레임워크에 Depthwise Separable Convolution 연산과 거의 동일함.
- TensorFlow나 Keras 프레임워크에 있는 Depthwise Separable Convolution (Separable Convolution 라고도 불림.) 은 각 channel 별로 3x3 Convolution 적용 후 채널간의 1x1 Convolution 적용.
- 영상처리 분야에서 사용하는 Separable Convolution 과 혼동하면 안됨, 이 연산은 공간적 분리를 하는 Convolution.

|비교|Extream|Depthwise Separable|
|:---:|:---:|:---:|
|연산순서|pointwise-->channelwise|channelwise-->pointwise|
|비선형성|Presence|Absence


# **2. Prior work**

- VGG-16 과 같은 구조가 xception 과 유사.
- Inception 구조는 가지치기의 이점을 보여줌.
- Depthwise separable convolution는 경량화에도 적합.
- TensorFlow에는 이미 구현되어있음.
- Residual connection 을 광범위하게 사용.

# **3. The Xception architecture**

{{< figure src="/images/post/xception/Untitled_4.png" >}}

- Figure 5 와 같은 구조 제안.
- 처음과 마지막을 제외하곤 linear residual module 사용.
- 총 36개의 convolution layer로 구성.
- 매우 단순한 구조.

# **4. Experimental evaluation**

- Xception과 Inceotion V3 비교.
- Parameters가 비슷. 네트워크 규모에 대한 차이를 없애기 위함.
- ImageNet과 JFT dataset 이용.

## **4.1 The JFT dataset**

- 그냥...JFT 데이터 설명...
- Google 데이터 중 하나
- JFT 로 학습, FastEval14k dataset으로 성능 비교.

## **4.2 Optimization configuration**

- 각 방법에 대해서 다음과 같은 설정으로 Xception, Inception V3 모두 학습
- On ImageNet
    - Optimizer: SGD
    - Momentum: 0.9
    - Initial learning rate: 0.045
    - Learning rate decay: 0.94 (every 2 epochs)
- On JFT
    - Optimizer: RMSprop
    - Momentum: 0.9
    - Initial learning rate: 0.001
    - Learning rate decay: 0.9 (every 3,000,000 samples)

## **4.3 Regularization configuration**

- Weight decay
- Dropout
- Auxiliary loss tower

## **4.4 Training infrastructure**

- 80개의 NVIDIA K80 GPU ....
- ImageNet 학습시 **synchronous gradient descent**을 적용하여 data parallelism 이용. → 3일 소요
- JFT 학습시 **asynchronous gradient descent**을 적용하여 data parallelism 이용. →한달 소요

## **4.5 Comparison with Inception V3**

### **4.5.1 Classification performance**

- 두 데이터 모두 Xception이 좋은 성능을 보임.

    ![https://jjerry-k.github.io/public/img/xception/Untitled_5.png](https://jjerry-k.github.io/public/img/xception/Untitled_5.png)

    ![https://jjerry-k.github.io/public/img/xception/Untitled_6.png](https://jjerry-k.github.io/public/img/xception/Untitled_6.png)

    ![https://jjerry-k.github.io/public/img/xception/Untitled_7.png](https://jjerry-k.github.io/public/img/xception/Untitled_7.png)

    ![https://jjerry-k.github.io/public/img/xception/Untitled_8.png](https://jjerry-k.github.io/public/img/xception/Untitled_8.png)

    ![https://jjerry-k.github.io/public/img/xception/Untitled_9.png](https://jjerry-k.github.io/public/img/xception/Untitled_9.png)

### **4.5.2 Size and speed**

- Parameter가 늘지 않으면서 성능 향상을 보이기에 Xception이 효율적인 모델.

    ![https://jjerry-k.github.io/public/img/xception/Untitled_10.png](https://jjerry-k.github.io/public/img/xception/Untitled_10.png)

### **4.6 Effect of the residual connections**

- Residual connection에 대한 ablation study 진행.
- Residual connection의 중요성을 보여줌.

{{< figure src="/images/post/xception/Untitled_11.png" >}}

### **4.7 Effect of an intermediate activation after point wise convolutions**

- Depthwise separable convolution은 depthwise → pointwise convolution으로 구성되어있음.
- 그 중간에 activation function에 대한 ablation study 진행.

    ![https://jjerry-k.github.io/public/img/xception/Untitled_12.png](https://jjerry-k.github.io/public/img/xception/Untitled_12.png)

- [Inception module에 대한 연구](https://arxiv.org/pdf/1512.00567.pdf)와 반대되는 결과 도출.

# **5. Future directions**

- Depthwise separble convolution 이 만능이라는 보장은 없음.