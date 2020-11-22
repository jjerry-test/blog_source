---
title: "Review: ResNeXt"
date: 2020-05-08T18:30:46+06:00
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

# Aggregated Residual Transformations for Deep Neural Networks

Author: Saining Xie, Ross Girshick, Piotr Dollár, Zhuowen Tu, Kaiming He  
Date: Nov 16, 2016  
URL: https://arxiv.org/abs/1611.05431

# Introduction

- Network desine 에 고려해야할 hyper-parameter가 너무 많음. (Width, filter size, Height, ....)
- VGG, ResNet은 비슷한 구조의 레이어를 계속 쌓는 방법을 사용.
- Inception 은 성능은 이전보다 뛰어나지만 이전 방법들과 다르게 복잡한 구조를 쌓는 방법 사용.
- 본 논문에서는 VGG/ResNet과 같이 비슷한 레이어를 반복하지만 AlexNet 에서 나온 처음 제안된 Group Convolution 을 적용하여 split-transform-merge stretegy 를 도입.
- 일반적인 Reidual Block과 ResNeXt의 Residual Block 비교.
- Cardinality = Number of Groups,

{{< figure src="/images/post/resnext/Untitled.png" >}}

# Method

## Template

- 전체적인 구조는 기존의 VGG/ResNet과 같이 일정 Block 을 반복하여 쌓는 구조.
- 반복되는 블럭은 동일한 hyper parameter 사용.

{{< figure src="/images/post/resnext/Untitled_1.png" >}}

## Revisiting Simple Neurons

- 가장 기본적인 뉴런의 구조

$$\sum_{i=1}^Dw_ix_i$$

{{< figure src="/images/post/resnext/Untitled_2.png" >}}

- 기본 뉴런 또한 split-transform-merge (Splitting, Transforming, Aggregating)의 구조를 가짐.
- Vector X 가 $x_i$로 Splitting, $x_iw_i$로 Transforming, $\sum_{i=1}^D$ 로 Aggregating

## Aggregated Transformations

- Networt-in-Network와 다르게 Network-in-Neuron이라는 컨셉으로 차원 확장

$$\mathcal{F}(x) = \sum_{i=1}^C\mathcal{T}_i(\mathrm{x})$$

- 다른 방식이지만 동일하다는 것을 설명

{{< figure src="/images/post/resnext/Untitled_3.png" >}}

{{< figure src="/images/post/resnext/Untitled_4.png" >}}

## Model Capacity

- Complexity, Number of parameter 를 유지하면서 실험.
- 다른 Hyper parameter는 수정하고 싶지 않기 때문에 Residual Block의 Cardinality C와 bottleneck d를 수정
- Cardinality와 bottleneck d의 관계

{{< figure src="/images/post/resnext/Untitled_5.png" >}}

# Result

## On ImageNet-1K

- Cardinality를 1~32 씩 증가시키되 complexity 는 유지하도록 설정하고 실험.

{{< figure src="/images/post/resnext/Untitled_6.png" >}}

{{< figure src="/images/post/resnext/Untitled_7.png" >}}

- Increasing Cardinality 와  Increasing depth or width 비교
- Cardinality 의 성능이 더 좋음.

{{< figure src="/images/post/resnext/Untitled_8.png" >}}

- Residual connections 여부에 따른 비교

{{< figure src="/images/post/resnext/Untitled_9.png" >}}

- State-of-the-art model 과 비교

{{< figure src="/images/post/resnext/Untitled_10.png" >}}

## On ImageNet-5K

- 5000개 클래스에서도 잘 되더라.

{{< figure src="/images/post/resnext/Untitled_11.png" >}}

{{< figure src="/images/post/resnext/Untitled_12.png" >}}

## On CIFAR

{{< figure src="/images/post/resnext/Untitled_13.png" >}}

{{< figure src="/images/post/resnext/Untitled_14.png" >}}

## On COCO object detection

- Faster RCNN에 적용.

{{< figure src="/images/post/resnext/Untitled_15.png" >}}

## P.S

- AlexNet의 선견지명.
- 하긴 안좋으면 논문으로 쓸리가 없지.