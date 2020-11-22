---
title: "Review: MobileNet V2"
date: 2020-04-27T18:30:46+06:00
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

# MobileNetV2: Inverted Residuals and Linear Bottlenecks

Author: Mark Sandler, Andrew G. Howard, Menglong Zhu, Andrey Zhmoginov, Liang-Chieh Chen  
Date: Jan 13, 2018  
URL: https://arxiv.org/abs/1801.04381

# **Abstract**

- 새로운 mobile architecture!
- mobile에서 Object detection, Semantic segmentation 에 적용할 수 있음!

# **Introduction**

- MobileNet과 비슷한 얘기
- 새로운 모듈 제안! → Inverted residual block

# **Preliminaries, discussion and intuition**

- 논문의 가장 큰 특징은 `Depthwise  Separable Convolution`, `Linear Bottlenecks`, `Inverted Residuals`.

## **Depthwise Separable Convolutions**

- [Xception](https://arxiv.org/abs/1610.02357) 에서부터 제안된 Convolution
- Efficient network의 핵심 Block

## **Linear Bottlenecks**

- MobileNetV1에서 computation 과 accuracy의 trade-off 를 비교하기 위해 `width multiplier parameter`를 사용.
- 본 논문에선 1x1 Convolution 을 이용하여 dimension reduction 수행.

## **Inverted Residuals**

- 기존의 Residual Block 과 비슷한 구조 (Bottleneck → Expansion & Skip connection).
- 본 논문에선 Expansion → Bottleneck & Skip connection 구조의 Inverted Residual Block 사용.

{{< figure src="/images/post/mobilev2/Untitled.png" >}}

{{< figure src="/images/post/mobilev2/Untitled_1.png" >}}

# **Model Architecture**

{{< figure src="/images/post/mobilev2/Untitled_2.png" >}}

# **Ablation study**

## Inverted residual connections

- Skip connection 을 bottleneck 후에 하는 것이 성능이 더 좋음.
- Figure 6 (b) 참고

## Importance of linear bottleneck

- Bottleneck 에서는 activation 을 사용하지 않는 것이 더 좋음.
- Figure 6 (a) 참고

{{< figure src="/images/post/mobilev2/Untitled_3.png" >}}
