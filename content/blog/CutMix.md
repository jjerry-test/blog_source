---
title: "Review: CutMix"
date: 2020-05-06T18:30:46+06:00
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

# CutMix: Regularization Strategy to Train Strong Classifiers with Localizable Features

Author: Sangdoo Yun, Dongyoon Han, Seong Joon Oh, Sanghyuk Chun, Junsuk Choe, Youngjoon Yoo  
Date: May 13, 2019  
URL: https://arxiv.org/abs/1905.04899

# Introduction

- CNN 은 computer vision 문제에 많이 사용되고 있음.
- 효율적이고 높은 성능을 위해 data augmentation, regularization 등 기법을 적용.
- 특정 부분에 overfitting(?) 되는 것을 방지하기 위해 dropout, regional dropout 과 같은 방법 사용.
- 그 외에도 일부분을 0으로 채운다거나 노이즈로 채우는 방법, 정보가 있는 부분의 pixel을 줄이는 방법 등이 성능 향상을 보였으나 CNN은 데이터가 많이 고픈데....데이터를 없앤다..? 라는 부분에서 의문을 가짐.
- 영상의 일부를 자르고 다른 영상으로 대체하는 CutMix 를 제안.

{{< figure src="/images/post/cutmix/Untitled.png" >}}

# CutMix

## Algorithm

- A, B 두개의 클래스만 존재.

$$(x, y): \text{Training image, label}$$
$$(A, B): \text{Training class}$$
$$(x_A, y_A), (x_B, y_B): \text{Training sample}$$

- 어느 부분을 섞을 것인지 binary mask (M) 생성
- 생성된 mask를 통해 섞을 비율 lambda 추출.
- Label의 경우 비율에 One-hot encoding이 합친 후 영상에서의 각 클래스의 비율로 변경.

$$\mathrm{M}: \text{Binary mask where to drop out and fill}$$
$$\lambda: \text{Combination ratio}$$
$$\tilde{x} = \mathrm{M} \bigodot x_A + (1 - \mathrm{M}) \bigodot x_B$$
$$\tilde{y} = \lambda{y_A} + (1 - \lambda)y_B$$

- M에서 bounding box 좌표 (B) 추출.
- x, y 좌표는 Uniform distribution.
- $x_B$에서 B 를 매칭시켜서 crop 후 B에 매칭되는 $x_A$ 의 부분에 paste.

$$\mathrm{B}: \text{Bounding box coordinates }  (r_x, r_y, r_w, r_h)$$
$$r_x \sim \text{Unif }(0, W), r_w = W\sqrt{1-\lambda},$$
$$r_y \sim \text{Unif } (0, H), r_h = H\sqrt{1-\lambda}$$

## Discussion

- CutMix를 이용했을 때 CNN이 어느 부분을 학습하는지 확인.

{{< figure src="/images/post/cutmix/Untitled_1.png" >}}

- 다른 method와 비교하여 CutMix의 주요 차이점.

{{< figure src="/images/post/cutmix/Untitled_2.png" >}}

- Validation Error를 비교했을 때 기존의 모델에 비해 CutMix 적용시 Error가 낮음.

{{< figure src="/images/post/cutmix/Untitled_3.png" >}}

# Experiments

## Image Classification

### ImageNet Classification

- Baseline, 다른 augmentation method와 비교

{{< figure src="/images/post/cutmix/Untitled_4.png" >}}

- 두 Model에 CutMix를 적용하여 성능 비교.

{{< figure src="/images/post/cutmix/Untitled_5.png" >}}

### CIFAR Classification

- 다른 Regularization 들과 비교.

{{< figure src="/images/post/cutmix/Untitled_6.png" >}}

- 가벼운 Model 에 적용하여 비교.

{{< figure src="/images/post/cutmix/Untitled_7.png" >}}

- CIFAR-10에 적용한 결과.

{{< figure src="/images/post/cutmix/Untitled_8.png" >}}

### Ablation Studies

- **CutMix 에서 alpha가 뭐지.......**

{{< figure src="/images/post/cutmix/Untitled_9.png" >}}

- CutMix하는 방법을 다양하게 적용했을 때 성능 비교
- Center Gaussian: Uniform distribution → Gaussian distribution
- Fixed-size: 16 x 16 ( \\(\lambda = 0.75\\) )로 고정
- Scheduled: 학습이 진행될 수록 CutMix 확률을 0부터 1까지 증가
- One-hot: 패치 비율에 따라 Portion label이 아닌 One-hot encoding으로 적용
- Complete-label: lambda 를 고려하지 않고 \\(y = 0.5y_A + 0.5y_B\\)로 적용

{{< figure src="/images/post/cutmix/Untitled_10.png" >}}

## Weakly Supervised Object Localization

- Localization 부분에 대해 다른 방법들과 비교.
- 학습 후 CAM을 이용해서 bounding box를 그린 것으로 보임.

{{< figure src="/images/post/cutmix/Untitled_11.png" >}}

{{< figure src="/images/post/cutmix/Untitled_12.png" >}}

## Transfer Learning of Pretrained Model

- Object detection, Image captioning 에 적용하여 성능 비교.

{{< figure src="/images/post/cutmix/Untitled_13.png" >}}

## Robustness and Uncertainty

- Adversarial attack 에 대해 Accuracy 비교.
- [Fast Gradient Sign Method (FGSM)](https://arxiv.org/abs/1412.6572)을 이용하여 adversarial perturbation 생성.

{{< figure src="/images/post/cutmix/Untitled_14.png" >}}

- Occlusion 상황에 대해서 성능 비교.
- 가운데 부분 혹은 Boundary 에 0~224 크기 사이의 hole을 생성.

{{< figure src="/images/post/cutmix/Untitled_15.png" >}}

- Uncertainty

{{< figure src="/images/post/cutmix/Untitled_16.png" >}}

## CutMix Algorithm

{{< figure src="/images/post/cutmix/Untitled_17.png" >}}

## P.S

- Appendix에 내용이 더 있지만... 간단히 정리하려니 넣기 좀 힘듦.
- 당연한 얘기지만 모든 데이터에 적용하기엔 어려움이 있을 것으로 보임.