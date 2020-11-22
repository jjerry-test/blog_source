---
title: "Review: MobileNet V3"
date: 2020-04-28T18:30:46+06:00
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

# Searching for MobileNetV3

Author: Andrew G. Howard, Mark Sandler, Grace Chu, Liang-Chieh Chen, Bo Chen, Mingxing Tan,
Weijun Wang, Yukun Zhu, Ruoming Pang, Vijay Vasudevan, Quoc V. Le, Hartwig Adam  
Date: May 06, 2019  
URL: https://arxiv.org/abs/1905.02244

# **Introduction**

- Efficient neural network 는 low latency, higher accuracy 와 더불어 전력소모가 줄어들게 하기 때문에 배터리 수명 보존에도 기여.
- 이에 힘입어 다음 세대의 더 효율적인 네트워크 제안.
- 본 논문에서 중요한 것은 네 가지.
    - Complementary search techniques
    - New efficient versions of non-linearities practical
    - New efficient network design
    - New efficient segmentation decoder

# **Efficient Mobile Building Blocks**

- MobileNetV2의 Inverted residual structure에 [squeeze and excitation](https://arxiv.org/abs/1709.01507) 을 추가.

{{< figure src="/images/post/mobilev3/Untitled.png" >}}

# **Network Search**

## **Platform-Aware NAS for Block-wise Search**

- RNN-based controller, factorized hierarchical search space

## **NetAdapt for Layer-wise Search**

1. platform-aware NAS로 찾은 Seed network architecture 로 시작. 
2. 매 스텝마다:  
(a) 이전의 proposal 에 비해 latency가 최소 a만큼 감소된 새로운 proposal 생성.  
(b) 각 proposal은 이전 스텝의 pre-trained model을 사용하여 새로 제안된 architecture를 채우고 누락된 weight에 대해선 적절한 값으로 채움. 각 proposal 은 T step 동안 finetuning하고 대략적인 accuracy 추출.  
(c) 몇몇 metric을 이용하여 최적의 proposal 을 선택.  
3. 목표로하는 latency에 도달할 때까지 반복.

# **Network Improvements**

- Network의 초반, 후반부의 expansive layer 구조 수정.
- 새로운 non-linearity fuction 제안.
    - h-swish: swish 의 변형 버전, 빠른 계산 속도, 경량화

## **Redesigning Expensive Layers**

{{< figure src="/images/post/mobilev3/Untitled_1.png" >}}

## **Nonlinearities**

1. sigmoid → h-swish

    $$hard\text{-}swish(x) = x\frac{ReLU6(x + 3)}{6}$$

    ![https://jjerry-k.github.io/public/img/mobilev3/Untitled_02.png](https://jjerry-k.github.io/public/img/mobilev3/Untitled_2.png)

2. h-swish 를 deeper layer에서만 사용.

{{< figure src="/images/post/mobilev3/Untitled_3.png" >}}

{{< figure src="/images/post/mobilev3/Untitled_4.png" >}}

## **Large squeeze-and-excite**

- [MnasNet: Platform-Aware Neural Architecture Search for Mobile](https://arxiv.org/abs/1807.11626) 에서 Squeeze-and-Excite(SE) bottleneck 크기만큼 convolutional bottleneck 발생.
- 본 논문에선 expansion layer의 채널의 1/4로 고정.
- 파라미터 미약하게 증가하면서 정확도 증가.

# Result

{{< figure src="/images/post/mobilev3/Untitled_5.png" >}}

{{< figure src="/images/post/mobilev3/Untitled_6.png" >}}


### P.S

- Batch size를 4096으로 테스트.... 역시 하드웨어 깡패 구글...
