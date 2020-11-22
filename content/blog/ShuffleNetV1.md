---
title: "Review: ShuffleNetV1"
date: 2020-05-07T18:30:46+06:00
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

# ShuffleNet: An Extremely Efficient Convolutional Neural Network for Mobile Devices

Author: Xiangyu Zhang, Xinyu Zhou, Mengxiao Lin, Jian Sun  
Date: Jul 04, 2017  
URL: https://arxiv.org/abs/1707.01083  

# Introduction

- Visual recognition 에서 deeper, larger CNN을 설계하는 것이 트렌드.
- 하지만 이는 매우 많은 연산량을 필요로함.
- 본 논문은 정해놓은 범위의 연산량에서 최고로 효율적인 구조는 찾아내는 것을 목표로 함.
- Xception, ResNeXt 에서 1x1 Convolution 을 사용하는데 두 네트워크에서 대부분의 연산량이 1x1 Convolution 이 차지하고 있어 비효율적.
- 이를 보완하기 위해 AlexNet에서 처음 제안한 group convolution 적용.
- Group convolution 의 단점을 보완하기 위해 channel shuffle operation 또한 제안.

# Method

## Channel Shuffle for Group Convolutions

- 상대적으로 연산량이 많은 1x1 Convolution을 ResNeXt 에서 사용한 Group Convolution 으로 적용.
- 하지만 Group으로 계속 진행하다보면 특정 채널에 편향된 결과를 보이는 문제가 생길 것이므로 channel을 shuffle 해줌.

{{< figure src="/images/post/shufflenetv1/Untitled.png" >}}

## ShuffleNet Unit

- ShuffleNet에서 사용된 Bottle unit은 Xception과 MobileNet에서 사용된 Residual Block에서 1x1 Convolution을 Group Convolution으로 변경하고 Channel Shuffle을 추가한 것.
- Stride unit 에선 element-wise addition이 아닌 concatenation으로 대체.

{{< figure src="/images/post/shufflenetv1/Untitled_1.png" >}}

## Network Architecture

{{< figure src="/images/post/shufflenetv1/Untitled_2.png" >}}

# Result

## Ablation Study

### Pointwise Group Convolutions

- Groups 에 따른 성능 비교.
- ShuffleNet s\\(\times\\) 에서 s는 필터 개수에 대한 scaling factor.

- 무조건 많이 나눈다고 좋은 것은 아님.

{{< figure src="/images/post/shufflenetv1/Untitled_3.png" >}}

### Channel Shuffle vs. No Shuffle

- Channel Shuffle 여부에 따른 성능 비교.
- Shuffle 적용시 성능이 뚜렷하게 증가한 것을 확인.

{{< figure src="/images/post/shufflenetv1/Untitled_4.png" >}}

## Comparison with Other Sturcture Units

- 제한된 연산량 내에서 다른 Network 들과 성능 비교.

{{< figure src="/images/post/shufflenetv1/Untitled_5.png" >}}

- 기존에 비슷한 성능의 Network들과 연산량 비교.

{{< figure src="/images/post/shufflenetv1/Untitled_6.png" >}}

## Comparison with MobileNets and Other Frameworks

- Mobile devices에 특화된 MobileNet과 성능 비교

{{< figure src="/images/post/shufflenetv1/Untitled_7.png" >}}

## Generalization Ability

- MS COCO Data를 사용하여 Object detection 성능 비교.

{{< figure src="/images/post/shufflenetv1/Untitled_8.png" >}}

## Actual Speedup Evaluation

- Mobile device에서 Inference 속도 비교.

{{< figure src="/images/post/shufflenetv1/Untitled_9.png" >}}

## P.S
- GPU가 부족해서 했다던 Group Convolution의 부활..?