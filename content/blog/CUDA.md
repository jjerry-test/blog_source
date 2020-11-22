---
title: Ubuntu CUDA & Cudnn 설치하기
date: 2016-09-08T18:30:46+06:00
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
  - "Setting"

# post type
type: "post"
---
# 환경 구축....

Deep Learning을 하는데 GPU를 사용해야하니 CUDA와 cuDNN을 설치하기로 하죠.

## 1. NVIDIA 그래픽 드라이버 설치

Ubuntu 14.04 에선 그래픽 드라이버를 설치하는데 굉장히...  
많은 고난과 역경을 겪었습니다...  
(그래서 결국 설치 못해봄..)  
하지만 16.04에선 어렵지 않음!!!!!!  
(갈아탄 결정적인 이유...)  
그렇다면 설치를 시작해보겠습니다.

``` bash
sudo add-apt-repository ppa:graphics-drivers/ppa

sudo apt-get update

sudo apt-get install nvidia-364
```

(제 노트북은 GTX 960m 이므로..)  
그냥 터미널에 입력하시면 되요.  
NVIDIA 사이트에서 GPU 버전이랑 맞는걸로!!  
그게 나을 듯합니다.  
그 후 로그아웃을 하고 다시 로그인을 하려고 하면 무한 로그인이 될 거에요.  
(안그러면 좋고..)  
Ctrl + Alt + F1을 눌러 tty1으로 들어가서 로그인 후 reboot을 실행해줍시다.  
로그인 후 NVIDIA X Server Settings 를 켜면

{{< figure src="![image](/images/post/CUDA/01.png)" >}}

요래 설치 된걸 확인할 수 있습니다.

## 2. CUDA 설치

NVIDIA 드라이버를 설치 했으니 이제 CUDA를 설치해보도록 하죠.

[https://developer.nvidia.com/cuda-downloads](https://developer.nvidia.com/cuda-downloads) 에 들어가시면 요로코롬 뜨는데요.  

 <img src="https://jjerry-k.github.io/public/img/CUDA/02.png">

각자의 환경에 맞춰서 선택한 후 다운로드 하시면 됩니다.  
run 파일을 다운을 받은 후에 터미널을 여시고 run 파일이 다운로드된 디렉토리로 이동합니다.  
그리고 파일의 권한을 모든  사용자가 사용할 수 있도록 변경합니다.  
그리고 실행!

``` bash
cd Downloads
sudo chmod a+r cuda_7.5.18_linux.run
sudo ./cuda_7.5.18_linux.run --override
or
sudo sh cuda_7.5.18_linux.run --override
```

16.04는 gcc, g++ 버전이 5.x 라 override 를 해줘야합니다..  
실행하면 어쩌고 저쩌고 약관 내용..? 이 나오는데요...  
살포시 q 를 눌러줍니다.  
그러면...사용자 정의 설치라고 할까요??  
이것 저것 물어봅니다.

``` bash
Do you accept the previously read EULA? (accept/decline/quit): accept

You are attempting to install on an unsupported configuration. Do you wish to continue? ((y)es/(n)o) [ default is no ]: yes

Install NVIDIA Accelerated Graphics Driver for Linux-x86_64 352.39? ((y)es/(n)o/(q)uit): no

Install the CUDA 7.5 Toolkit? ((y)es/(n)o/(q)uit): yes

Enter Toolkit Location [ default is /usr/local/cuda-7.5 ]: 그냥 엔터

Do you want to install a symbolic link at /usr/local/cuda? ((y)es/(n)o/(q)uit): yes

Install the CUDA 7.5 Samples? ((y)es/(n)o/(q)uit): no
```

이런식으로 세팅을 해줍니다.   
그리고 그저 기다리고 기다림....   
설치가 다 되었으면 뭐 따로 실행할 건 없습니다.  
바로 cuDNN 설치를 하죠.  
이건 설치....는 아니고 그냥 cuda 디렉토리에 파일을 파일 복사? 하는거에요.  

## 3. cuDNN 설치

먼저 cuDNN 파일을 받으셔야하는데요.

[https://developer.nvidia.com/rdp/cudnn-download](https://developer.nvidia.com/rdp/cudnn-download)

여기에 들어가셔서 계정 만드시고....  
사용 용도... 사용 할 라이브러리.. 등등 선택하시고 원하시는 버전 download 하시면 됩니다.  
저는 4.0으로 했어요.  
Tensorflow라는 라이브러리를 사용할 것이기 때문에...
그리고 나서 터미널을 켜고

``` bash
cd /usr/local
sudo tar zxf ~/Downloads/cudnn-7.0-linux-x64-v4.0-prod.tgz
```

이렇게 하시거나 아니면

``` bash
cd cudnn 다운로드경로
sudo tar zxf cudnn-7.0-linux-x64-v4.0-prod.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
```

이렇게 해주시구요.  
환경변수를 설정해줘야 합니다.
터미널을 껐다가 다시 켜주시고

``` bash
sudo gedit ~/.bashrc
```

그려면 어떤 메모장? 문서 파일이 열립니다.
매~~~~앤 아래 부분에

``` bash
export PATH=/usr/local/cuda-7.5/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-7.5/lib64:$LD_LIBRARY_PATH
```

를 추가해주세요.  

이렇게 GPU 설정이 끝났습니다...  
이제 caffe와 tensorflow를 설치해야겠군요..  
험난허다...  
개강이라 죽겠는데..
