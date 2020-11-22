---
title: Anaconda 간단하게 사용하기!
date: 2018-10-23T18:30:46+06:00
draft: false

#post thumb
image: #"images/featured-post/post-1.jpg"

# meta description
description: "this is meta description"
math: true

# taxonomies
categories:
  - "Python"
tags:
  - "Setting"

# post type
type: "post"
---

저번 [**Python 설치 포스팅**](https://jjerry-k.github.io/python/2018/09/27/python4mac/)에서 pyenv로 설치 하는 법을 포스팅 했었습니다.  
이번에는 제가 pyenv 로 어떤 버전을 설치했고 무슨 패키지를 설치했는지 포스팅 하려고 합니다.  
먼저 설치할 버전의 이름을 정확히 알아야하므로 설치 가능한 버전들을 봅니다.

``` bash
pyenv install --list
```
이렇게 터미널에 입력을 하면

```
Available versions:
  2.1.3
  2.2.3
  2.3.7
  ...
  중략
  ...
  stackless-3.4.2
  stackless-3.4.7
  stackless-3.5.4
```

이런식으로 굉~~~장히 많은 버전이 있습니다. (약 340개?)  
그중에서 저는 `anaconda3-5.2.0`을 설치했습니다.

``` bash
pyenv install anaconda3-5.2.0

pyenv global anaconda3-5.2.0
```

아나콘다 환경 설치 끝..  
이제 제가 사용하는 파이썬 패키지를 설치해야겠죠.  
보통 python 이라면 pip를 쓰겠지만 저는 아나콘다를 설치했죠.  
그래서 `conda`를 이용해서 설치했습니다.  
제가 설치 할 패키지는 pytorch, tensorflow, keras, tqdm 입니다.  

``` bash
conda install tqdm # progress bar 패키지
conda install keras tensorflow # machine learning 패키지
conda install pytorch torchvision -c pytorch # machine learning 패키지
```

 이렇게 하면 끝입니다.  
 `numpy, scipy, matplotlib, ...`등 패키지는 anaconda를 설치하면서 자동으로 설치가 됩니다 ㅎㅎ  

 만약 저 환경을 삭제하고 싶다?
 ``` bash
 pyenv uninstall anaconda3-5.2.0
 ```
 이라고 하시면 바로 삭제됩니다.

 많은 분들께 도움이 되었으면 좋겠습니다!

 감사합니다~!
