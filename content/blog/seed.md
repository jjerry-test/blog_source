---
title: Seed 가 뭐길래..
date: 2020-09-12T18:30:46+06:00
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
  - "TensorFlow"

# post type
type: "post"
---

Deep learning model 을 실험하다보면 reproducibility 라는 말을 자주 듣게 됩니다. 

대충... `돌릴 때 마다 결과가 달라요...`라는 의미죠.

그러면서 seed 라는 단어를 많이 듣게 되는데요. 

seed는 [위키피디아](https://en.wikipedia.org/wiki/Random_seed), 혹은 다른 블로그를 참고하세요.

이번엔 seed 에 따라 어떤 결과를 보이는지 실험을 해보려 합니다. 

## 실험 방법

- 실험 변수
    - 데이터: Mnist
    - 모델: Simple cnn
    - GPU: V100 32GB
    - 학습 횟수: 10
    - 배치 사이즈: 1024
    - 사용 Seed 종류: random seed, numpy seed, tensorflow seed, python hashseed
- 아무 seed 고정 없이 5번 씩 진행.
- 각 seed 별로 5번씩 진행.

## 실험 결과

### Seed 고정 없음

{{< figure src="/images/post/seed/Untitled.png" >}}

### PYTHONHASHSEED

{{< figure src="/images/post/seed/Untitled_1.png" >}}

### Random

{{< figure src="/images/post/seed/Untitled_2.png" >}}

### Numpy

{{< figure src="/images/post/seed/Untitled_3.png" >}}

### TensorFlow

{{< figure src="/images/post/seed/Untitled_4.png" >}}

원래 마지막으로 4개의 seed 를 모두 고정하고 실험도 해보려고 했는데 TensorFlow 만 고정해도 거의 동일한 결과가...나오더군요. (예전엔 아니었는데...)

TensorFlow 를 쓰시는 분들은 tf 만 고정해도 어느정도 균일한 결과를 볼 수 있을 것 같습니다. 

## P.S

- 정말 간단한 실험이니 너무 믿지는 마세요.