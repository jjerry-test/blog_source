---
title: "Review: MobileNet V1"
date: 2020-02-26T18:30:46+06:00
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

# MobileNets: Efficient Convolutional Neural Networks for Mobile Vision Applications

Author: Andrew G. Howard, Menglong Zhu, Bo Chen, Dmitry Kalenichenko, Weijun Wang, Tobias Weyand, Marco Andreetto, Hartwig Adam  
Date: Apr 17, 2017  
URL: https://arxiv.org/abs/1704.04861

# **Abstract**

- 모바일, 임베디드에 적용할 수 있는 네트워크.

{{< figure src="/images/post/mobilev1/Untitled.png" >}}

# **1. Introduction**

- CNN 유명세 짱짱맨
- 좋은 성능(정확도)를 위해 연구가 계속 진행되었지만 속도와 메모리 측면에서 ****비****효율적.
- 경량화, 효율화 필요!!

# **2. Prior Work**

- 최근 경량화, 효율적인 네트워크 개발에 초점.
- Depthwse separable convolution,

# **3. MobileNet Architecture**

- 핵심적인 레이어 설명.

## **3.1 Depthwise Separable Convolution**

- Depthwise Convolution 수행 후 Pointwise Convolution 수행.

{{< figure src="/images/post/mobilev1/Untitled_1.png" >}}

{{< figure src="/images/post/mobilev1/Untitled_2.png" >}}

- MobileNet 에서는 3 x 3 의 Depthwise saparable convolution 사용.
- 연산량이 약 8~9 배로 크게 감소.

## **3.2 Network Structure and Training**

- 총 28개의 레이어

{{< figure src="/images/post/mobilev1/Untitled_3.png" >}}

- MobileNet의 Convolution Block 구조

{{< figure src="/images/post/mobilev1/Untitled_4.png" >}}

- MobileNet의 대부분 파라미터, 연산 시간은 1x1 Conv

{{< figure src="/images/post/mobilev1/Untitled_5.png" >}}

- RMSprop, asynchronous gradient descent 사용.
- Tensorflow 로 구현.

## **3.3 Width Multiplier: Thinner Models**

- MobileNet의 기본 구조는 작고 빠르지만 더 작고 빠른 모델을 필요로 함.
- Width multiplier 라는 파라미터 제안.

## **3.4 Resolution Multiplier: Reduced Representation**

{{< figure src="/images/post/mobilev1/Untitled_6.png" >}}

# **4. Experiments**

- **효율적이다 라는** 내용이 전부..

## **4.1 Model Choices**

{{< figure src="/images/post/mobilev1/Untitled_7.png" >}}

{{< figure src="/images/post/mobilev1/Untitled_8.png" >}}

## **4.2 Model Shrinking Hyperparemeters**

{{< figure src="/images/post/mobilev1/Untitled_9.png" >}}

{{< figure src="/images/post/mobilev1/Untitled_10.png" >}}

{{< figure src="/images/post/mobilev1/Untitled_11.png" >}}

{{< figure src="/images/post/mobilev1/Untitled_12.png" >}}

{{< figure src="/images/post/mobilev1/Untitled_13.png" >}}

{{< figure src="/images/post/mobilev1/Untitled_14.png" >}}

## **4.3 Fine Grained Recognition**

{{< figure src="/images/post/mobilev1/Untitled_15.png" >}}

## **4.4 Large Scale Geolocalization**

{{< figure src="/images/post/mobilev1/Untitled_16.png" >}}

## **4.5 Face Attributed**

{{< figure src="/images/post/mobilev1/Untitled_17.png" >}}

{{< figure src="/images/post/mobilev1/Untitled_18.png" >}}

## **4.6 Object Detection**

{{< figure src="/images/post/mobilev1/Untitled_19.png" >}}

{{< figure src="/images/post/mobilev1/Untitled_20.png" >}}

## **4.7 Face Embeddings**

{{< figure src="/images/post/mobilev1/Untitled_21.png" >}}

# **5. Conclusion**

- 연산량이 적고 파라미터 수도 적음!
- 다양한 task 에 사용가능!