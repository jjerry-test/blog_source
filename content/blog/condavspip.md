---
title: pip 로 설치하지 말라구요!?
date: 2018-10-18T18:30:46+06:00
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

오늘 갑자기 당황스러운 포스팅을 봤습니다.

출처 : [**https://www.anaconda.com/blog/developer-blog/tensorflow-in-anaconda/**](https://www.anaconda.com/blog/developer-blog/tensorflow-in-anaconda/)

내용을 보니 pip 로 설치하는것 보다 conda를 이용하면 좋은 점이 두 가지가 있다고 합니다.

1. CPU 성능이 더 빨라졌다.
{{< figure src="https://www.anaconda.com/wp-content/uploads/2019/12/TensorFlowTraining.png" >}}


2. GPU 버전 설치가 쉽다.  
  솔직히 이건 잘 모르겠네요..   
  둘 다 똑같이 그래픽 드라이버 설치하고 CUDA 설치하고 해야하는데 뭐가 쉬워진다는건지..  
  뭐.. 어떤 쿠다 버전을 설치했던 알아서 잡아서 TensorFlow 를 설치해준다면 편해진건 맞겠군요.  


그리고 CPU 성능 증가는 **Intel CPU에 한해서** 빨라지는 것 같습니다.

{{< figure src="/images/post/nopip/02.png" >}}

사진을 보시면 **the Intel® Math Kernel Library for Deep Neural Networks (Intel® MKL-DNN)** 을 사용해서 올렸다는거죠. (AMD 사용자 쥬륵..)

뭐 아무튼... 인텔에 텐플쓰시는 분들은 콘다로 넘어가심이 좋을 듯합니다.

전 요즘 pytorch 를 쓰고 있어서 ㅎㅎ..

읽어주셔서 감사합니다 ㅎㅎ
