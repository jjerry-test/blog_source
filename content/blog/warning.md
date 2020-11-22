---
title: Python 3.6 에서 이 경고 보기 싫어요..
date: 2018-10-19T18:30:46+06:00
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

안녕하세요! Jerry 입니다!

어제 [**pip 로 설치하지 말라구요!?**](https://jjerry-k.github.io/deeplearning/2018/10/18/condavspip/) 라는 포스팅을 했죠?  
포스팅을 하고 갑자기 확 꽂혀서 anaconda 환경을 지웠습니다.  
Setting 을 다시 하기 위해서요! 핳핳핳  
그래서 지우고 다시 구축했죠.  
제가 사용하는 방법은 [**Python Installation for mac**](https://jjerry-k.github.io/deeplearning/2018/09/27/python4mac/) 에 적혀있습니다!  
아나콘다 환경 설치 후에 이제 python package를 설치해야겠죠?  
pip 가 아닌 conda로 전부 설치했습니다.  

``` bash
conda install tensorflow
conda install pytorch torchvision -c pytorch
conda install keras
```
그 후에 테스트를 하고자 터미널에서 tensorflow를 import 해봤습니다.

``` python3
import tensorflow
```
 그 후에 나온 warning 입니다.

/Users/jerry/.pyenv/versions/anaconda3-5.2.0/lib/python3.6/site-packages/h5py/__init__.py:36: FutureWarning: Conversion of the second argument of issubdtype from `float` to `np.floating` is deprecated. In future, it will be treated as `np.float64 == np.dtype(float).type`.

라고 나오더군요.  
이게 굉장히 거슬리는 분들 계실겁니다..  
보통 h5py 라는 python 패키지가 2.8.0 미만이면 이 warning이 발생해요!  
해결책은 간단합니다!

``` bash
pip install --upgrade h5py
```

이것만 해주시면 됩니다!

그럼 즐거운 코딩!
