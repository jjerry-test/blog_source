---
title: "Review: BAM"
date: 2020-04-29T18:30:46+06:00
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

# BAM: Bottleneck Attention Module

Author: Jongchan Park, Sanghyun Woo, Joon-Young Lee, In So Kweon  
Date: Jul 17, 2018  
URL: https://arxiv.org/abs/1807.06514

# Introduction

- DL은 Classification, Detection, Segmentation 등 많은 패턴 인식 분야에서 강력한 Tool로 사용.

- 성능을 올리기 위해서 좋은 backbone을 설계하는 것이 기본적인 접근법.

- 직관적인 방법은 더 깊게 설계하는 것.

- VGGNet는 AlexNet 보다 두배 이상.

- ResNet 은 VGGNet보다 22배 이상이면서 residual connections 사용하여 gradient flow 를 향상.

- GoogLeNet 은 매우 깊고 같은 layer에서 다양한 feature를 사용하여 성능 향상.

- DenseNet 이전 layer의 feature map 들을 concatenation 하여 사용.

- WideResNet, PyramidNet layer의 channels 를 증가하여 성능 향상.

- ResNeXt, Xception과 같은 backbone은 grouped convolutions을 이용하여 성능 향상.

- 본 논문에선 attention 의 효과를 보기 위해 기존의 architecture 에 사용하기 쉬운 가벼운 Bottle Attention Module(BAM) 제안

{{< figure src="/images/post/bam/Untitled.png" >}}

# Bottleneck Attention Module

- BAM 의 구조는 다음 사진과 같음.

$$F: \text{Input feature map} \\\ M(F): \text{Attention map} \\\ F' = F + F\bigotimes M(F) \\\ M(F) = \sigma(M_c(F) + M_s(F))$$

{{< figure src="/images/post/bam/Untitled_1.png" >}}

## Channel attention branch

$$M_c(F) = BN(MLP(AvgPool(F))) \\\ = BN(W_1(W_0AvgPool(F) + b_0)+b_1)$$

W0 의 output channel 크기: F의 채널 수 / reduction ratio(r)

W1 의 output channel 크기: F의 채널 수

## Spatial attention branch

$$M_s(F)=BN(f_3^{1\times1}(f_2^{3\times3}(f_1^{3\times3}(f_0^{1\times1}(F)))))$$

- 모든 연산은 convolution 연산.
- 3x3 Convolution 연산 수행시엔 dilation convolution 사용.
- 첫번째~세번째 Convolution 의 output channel 크기: F의 채널 수 / reduction ratio(r)
- 마지막 Convolution 의 output channel 크기: 1

## Combine two attention branches

$$M(F) = \sigma(M_c(F) + M_s(F))$$

- Channel attention branch 출력: 1x1xR
- Spatial attention branch 출력: HxWx1
- 두 attention branch를 합치는 방법으로 element-wise summation, multiplication, max operation 고려.

# Ablation study using CIFAR-100

## Dilation value and Reduction ratio

- Dilation value와 Reduction ratio에 따른 성능 비교
- Table 1 (a)

## Separate or Combined branches & Combining methods

- 두 attention branch 사용 방법에 따른 성능 비교
- Table 1 (b)

## Comparison with placing original convblocks

- BAM 사용 여부에 따른 성능 비교
- Table 1 (c)

{{< figure src="/images/post/bam/Untitled_2.png" >}}

## Bottleneck: The efficient point to place BAM

- BAM 사용 위치에 따른 성능 비교.

{{< figure src="/images/post/bam/Untitled_3.png" >}}

# Result

## Classification Result on CIFAR-100 and ImageNet-1K

{{< figure src="/images/post/bam/Untitled_4.png" >}}

## Object Detection on MS COCO and VOC 2007

{{< figure src="/images/post/bam/Untitled_5.png" >}}

## Comparison with Squeeze-and-Excitation

{{< figure src="/images/post/bam/Untitled_6.png" >}}

### P.S

- Original Code가 있지만....논문과 다른 부분이 매우 많음.
