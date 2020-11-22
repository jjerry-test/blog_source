---
title: GPU를 골라서 써보자!
date: 2018-10-10T18:30:46+06:00
draft: false

#post thumb
image: #"images/featured-post/post-1.jpg"

# meta description
description: "this is meta description"
math: true

# taxonomies
categories:
  - "Ubuntu"
tags:
  - "Usage"

# post type
type: "post"
---

현재 저는 하나의 GPU 서버를 가지고 여러 명이 Deep Learning 을 돌려야 합니다.  
그러면 GPU 각각을 분배하거나 메모리를 분산해야겠죠.  
제 연구실 같은 경우엔 전자를 택했습니다.  
그래서 이번엔 특정 GPU만 사용하는 방법을 간 ! 단 ! 하 ! 게 포스팅하려고 합니다. (Just 명령어만 쓸꺼임.)

``` bash
CUDA_VISIBLE_DEVICES=0 python ~~~.py # 0번 GPU만 사용.
#CUDA_VISIBLE_DEVICES=0,3 python ~~~.py # 0, 3번 GPU 사용.
```

이렇게 실행하시면 ~~~.py 를 실행해서 GPU 를 사용할 경우 0번 GPU만 사용해서 스크립트가 실행됩니다!
많은 분들이 **TensorFlow**를 사용하실텐데 이것으로 예를 들어보겠습니다.  
GPU가 여러 대인 상황에서 아무 옵션도 주지 않고 (스크립트에서도 안줬다는 가정하에..) `tf.Session()` 을 실행하게 되면 모든 GPU의 메모리를 혼자서 다 잡고 있는걸 보셨을 겁니다.  
하지만 만약 위에 코드 처럼 실행한다면 특정 번호에 해당하는 GPU의 메모리만 잡고 있는걸 보실 수 있을 겁니다!  
