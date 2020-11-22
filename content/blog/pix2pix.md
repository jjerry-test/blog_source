---
title: "Review: Pix2Pix"
date: 2020-08-10T18:30:46+06:00
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

# Image-to-Image Translation with Conditional Adversarial Networks

Author: Phillip Isola, Jun-Yan Zhu, Tinghui Zhou, Alexei A. Efros
Date: Nov 26, 2018
URL: https://arxiv.org/abs/1611.07004

GAN을 이용한 Image translation 의 시초에 가까운 Pix2Pix를 알아보려고 합니다. 

자세하게 리뷰하진 않을 겁니다. 

# Introduction

- 이 논문의 main contribution은 다양한 문제에서 Conditional GAN이 합리적인 결과를 생성한다는 것을 입증하는 것.
- 이를 위해 Image-to-Image translation 으로 연구 진행.

{{< figure src="/images/post/pix2pix/Untitled.png" >}}

# Method

- 정말 간단한 구조
- 다음 사진은 Edge(Sketch) 영상을 Photo 영상으로 만드는 예시.

{{< figure src="/images/post/pix2pix/Untitled_1.png" >}}

## Objective

$$\mathcal{L}_{cGAN}(G, D) = \mathbb{E}_{x, y}[\log D(x, y)] + \mathbb{E}_{x, z}[\log (1-D(x, G(x, z))]$$

$$\mathcal{L}_{L1}(G) = \mathbb{E}_{x, y, z}[||y-G(x,z)||_1]$$

$$G^* = argmin_Gmax_D\mathcal{L}_{cGAN}(G, D) + \lambda\mathcal{L}_{L1}(G)$$

## Network architectures

- DCGAN 에서 제안한 방법으로 각 block을 구성.
    - Convolution → BatchNorm → ReLU

### Generator with skips

- U-Net 과 비슷하나 Concatenate를 Add로 변경.

{{< figure src="/images/post/pix2pix/Untitled_2.png" >}}

### Markovian discriminator (PatchGAN)

- L1, L2 만 사용하면 blurry result가 만들어진다는 것은 많이 알려진 사항.
- Low frequency 부분에 대한 부분은 L1 loss로 High frequency는 GAN loss 가 담당.
- 좀 더 다양한 High frequency 에 적합하도록 하기 위해 local image patch 에 대해 discriminator를 적용. (PatchGAN)
- NxN patch 에 대해 각각 real/fake를 판별.

{{< figure src="/images/post/pix2pix/Untitled_3.png" >}}

## Optimization and Inference

- D → G 와 같은 순서로 학습 진행
- Optimizer: Adam
    - Learning rate: 0.0002
    - Momentum $\beta_1$: 0.5
    - Momentum $\beta_2$: 0.999
- Batch size: 1~10

# Experimants

- *Semantic labels ↔photo*
- *Architectural labels*→*photo*
- *Map*↔*aerial photo*
- *BW*→*color photos*
- *Edges*→*photo*
- *Sketch*→*photo*
- *Day*→*night*
- *Thermal*→*color photos*
- *Photo with missing pixels*→*inpainted photo\*

## Evaluation metrics

- Amazon Mechanical Turk (AMT)
- FCN-score

## Analysis of the  objective function

{{< figure src="/images/post/pix2pix/Untitled_3.png" >}}

{{< figure src="/images/post/pix2pix/Untitled_4.png" >}}

## Analysis of the generator architecture

- U-Net 기반의 구조로 했을 때가 훨씬 좋음.

{{< figure src="/images/post/pix2pix/Untitled_5.png" >}}

{{< figure src="/images/post/pix2pix/Untitled_6.png" >}}

## From PixelGANs to PatchGANs to ImageGANs

- Discriminator의 출력을 1x1, 16x16, 70x70, 286x286과 같이 차례로 키우면서 실험.

{{< figure src="/images/post/pix2pix/Untitled_7.png" >}}

{{< figure src="/images/post/pix2pix/Untitled_8.png" >}}

## Perceptual validation

- 사람이 보기에도 L1 + cGAN이 좋음.

{{< figure src="/images/post/pix2pix/Untitled_9.png" >}}

- Colorization에서는 좀 떨어짐.

{{< figure src="/images/post/pix2pix/Untitled_10.png" >}}

## Semantic segmentation

- 해당 task 에서는 오히려 L1과 같은 reconstruction loss만을 이용한 구조가 적합해 보임.

{{< figure src="/images/post/pix2pix/Untitled_11.png" >}}

{{< figure src="/images/post/pix2pix/Untitled_12.png" >}}

## Community-driven Research

- Twitter 에 공개한 후 다른 연구자들의 실험.

{{< figure src="/images/post/pix2pix/Untitled_13.png" >}}

{{< figure src="/images/post/pix2pix/Untitled_14.png" >}}


## P.S
- 장마철... 물 조심하세요..