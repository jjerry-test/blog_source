---
title: "Review: StarGAN v2"
date: 2020-03-04T18:30:46+06:00
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

# StarGAN v2: Diverse Image Synthessis for Multiple Domains

Author: Yunjey Choi, Youngjung Uh, Jaejun Yoo, Jung-Woo Ha  
Date: Dec 04, 2019  
URL: https://arxiv.org/abs/1912.01865

# Abstract

- Image translation 을 잘 하는 Model을 학습하려면 다음 사항을 만족해야함
    - Diversity of generated images
    - Scalability over multiple domains

- 기존의 방법들은 limited diversity, multiple models(networks)를 다룸.
- StarGAN v2는 두 조건 모두 만족.

# Introduction

- Domain: 시각적으로 구별되는 범주
- Style: 각 영상이 가지는 독특한 외관적 특성

{{< figure src="/images/post/starganv2/Untitled.png" >}}

# StarGAN v2

## Proposed framework

{{< figure src="/images/post/starganv2/Untitled_1.png" >}}

- 4개의 Network 로 구성.
- Generator (`G`)
    - Image `x`와 Style code `s`를 입력으로 받아 새로운 영상을 생성.
    - [adaptive instance normalization (AdaIN)](https://arxiv.org/abs/1703.06868) 사용.

    ![https://jjerry-k.github.io/public/img/starganv2/Untitled_2.png](https://jjerry-k.github.io/public/img/starganv2/Untitled_2.png)

- Mapping network (`F`)
    - Latent code `z`와 Domain code `y`를 입력으로 받아 Style code `s`생성.
    - Multi Layer Perceptron 구조.

    ![https://jjerry-k.github.io/public/img/starganv2/Untitled_3.png](https://jjerry-k.github.io/public/img/starganv2/Untitled_3.png)

- Style encoder (`E`)
    - Image `x`와 Domain code `y`를 입력으로 받아 `x`에서 Style code `s`를 추출.
- Discriminator (`D`)
    - Image `x`를 입력으로 받아 Domain code `y`와 Real/Fake 분류.

    ![https://jjerry-k.github.io/public/img/starganv2/Untitled_4.png](https://jjerry-k.github.io/public/img/starganv2/Untitled_4.png)

## Training objectives

- Adversarial objective
    - GAN 에서 기본적으로 사용되는 Loss

$$\mathcal{L}\_{adv}=\mathbb{E}\_{\mathrm{x},y}[\log{D\_y}(\mathrm{x})] + \mathbb{E}\_{\mathrm{x}, \tilde{y}, \mathrm{z}}[\log{(1-D\_{\tilde{y}}(G(\mathrm{x}, \tilde{\mathrm{s}})))}$$

- Style reconstruction
    - `G(x, s)` 를 Style encoder `E` 에 넣어 `s` 추출 후 입력 `s`와 비교

$$\mathcal{L}\_{sty}=\mathbb{E}\_{\mathrm{x},\tilde{y}, \mathrm{z}}[\parallel\tilde{\mathrm{s}}-E\_{\tilde{y}}(G(\mathrm{x}, \tilde{\mathrm{s}}))\parallel\_1]$$

- Style diversification
    - `G`가 다양한 Image를 생성할 수 있도록 Regularization 하는 역할.
    - `z1, z2` 가 `F`에 의해 생성된 `s1, s2`와 입력 `x`를 `G`의 입력으로 새로운 영상 생성.
    - L1 Norm 계산.

$$\mathcal{L}\_{ds}=\mathbb{E}_{\mathrm{x},\tilde{y}, \mathrm{z}_1, \mathrm{z}_2}[\parallel G(\mathrm{x}, \tilde{\mathrm{s}}_1) - G(\mathrm{x}, \tilde{\mathrm{s}}_2) \parallel_1]$$

- Preserving source characteristics
    - Cycle GAN 의 cycle consistency loss.
    - target domain의 style 을 적용한 영상을 다시 `E(x)`로 추출된 s를 이용하여 `x'`로 reconstruction 한 후 L1 Norm 계산.

$$\mathcal{L}\_{cyc}=\mathbb{E}_{\mathrm{x}, y, \tilde{y}, \mathrm{z}}[\parallel \mathrm{x} - G(G(\mathrm{x}, \tilde{\mathrm{s}}), \hat{\mathrm{s}})\parallel_1]$$

- Full objective

    $$\mathcal{L}\_D = -\mathcal{L}\_{adv} \\ \mathcal{L}\_{F, G, E}=\mathcal{L}\_{adv} + \lambda_{sty} \mathcal{L}\_{sty} - \lambda\_{ds} \mathcal{L}\_{ds} + \lambda\_{cyc} \mathcal{L}\_{cyc}$$

    - About \\(\lambda\\)

|Dataset  |  sty | ds  |cyc|
|:-----:  |  :-: | :-: |:-:|
|CelebA-HQ|  1   | 1   | 1 |
|AFHQ     | 0.3  | 1   |0.1|


# Experiments

- Baselines
    - [MUNIT](https://arxiv.org/abs/1804.04732)
    - [DRIT](https://arxiv.org/abs/1808.00948)
    - [MSGAN](https://arxiv.org/abs/1903.05628)
    - [StarGAN](https://arxiv.org/abs/1711.09020)

- Datasets
    - [CelebA-HQ](http://mmlab.ie.cuhk.edu.hk/projects/CelebA.html)
    - [AFHQ](https://github.com/clovaai/stargan-v2/blob/master/download.sh)

- Evaluation metrics
    - [Frechet inception distance (FID)](https://arxiv.org/abs/1706.08500)
    - [Learned perceptual image patch similarity (LPIPS)](https://arxiv.org/abs/1801.03924)

## Analysis of individual components

- StarGAN에서 본 연구에서 제안하는 방법들을 하나하나 넣어가면서 성능 실험.
- 정량적 평가를 보면 추가할 때마다 좋아지는 것을 볼 수 있음.

{{< figure src="/images/post/starganv2/Untitled_5.png" >}}

- 각 단계별 생성한 영상의 결과

{{< figure src="/images/post/starganv2/Untitled_6.png" >}}

## Comparison on diverse image synthesis

- 다른 방법들과 비교
- Latent-guided synthesis ( Latent code 만을 이용하여 생성 )

{{< figure src="/images/post/starganv2/Untitled_7.png" >}}

{{< figure src="/images/post/starganv2/Untitled_8.png" >}}

- Referenc-guided synthesis ( Style code 를 이용한 생성 )

{{< figure src="/images/post/starganv2/Untitled_9.png" >}}

{{< figure src="/images/post/starganv2/Untitled_10.png" >}}

- Human evaluation
    - 방법 별로 100개의 sample 생성 후 사람이 판단.

{{< figure src="/images/post/starganv2/Untitled_11.png" >}}

# Result

- 겁나....잘 생성함...

{{< figure src="/images/post/starganv2/Untitled_12.png" >}}

{{< figure src="/images/post/starganv2/Untitled_13.png" >}}