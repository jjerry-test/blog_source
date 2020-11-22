---
title: NIPA x Docker !
date: 2020-06-28T18:30:46+06:00
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
  - "Tools"

# post type
type: "post"
---

> 원래 NIPA GPU 서버를 대여받은 후에 포트 포워딩을 먼저 해줘야 합니다.
하지만 그 부분에 대해선 보안적인 부분이 있기 때문에 생략하겠습니다.

이번엔 NIPA 내 개인 환경 세팅에 대해 포스팅을 해보려 합니다. 

개인마다 원하는 환경이 다르기 때문에 정말 필요하죠.

물론 기본적으로 설치된 Anaconda  환경으로도 충분할 수 있지만 살짝쿵 문제가 있습니다. 

문제에 대해 살펴보겠습니다. 

NIPA GPU 서버에 접속을 하면 다음과 같은 화면이 출력됩니다.

{{< figure src="/images/post/nipa_docker/Untitled.png" >}}

먼저 말씀드렸던 conda 환경으로 기본적으로 다양한 환경이 제공되네요. 

저의 경우 이번에 tf-nightly가 필요했습니다. 

그래서 TensorFlow2, python3.6 환경을 activate  한 후 설치를 시도했죠.

{{< figure src="/images/post/nipa_docker/Untitled_1.png" >}}

|what...?|
|:--:|
|![NIPA%20x%20Docker%20ef94d24dfbc64a6cae24a83a59bd352f/Untitled%202.png](https://jjerry-k.github.io/public/img/nipa_docker/Untitled_2.png)|

음....conda 버전의 문제인가 싶어서 base conda를 update  하려 했습니다.

{{< figure src="/images/post/nipa_docker/Untitled_3.png" >}}

|what...?|
|:--:|
|![NIPA%20x%20Docker%20ef94d24dfbc64a6cae24a83a59bd352f/Untitled%202.png](https://jjerry-k.github.io/public/img/nipa_docker/Untitled_2.png)|

뭐야..이건 또 왜 안되는거야... 짜증이 났습니다. 

대충 `너무 옛날 버전의 conda니까 최소 4.8로 재설치 해주세요.` 라는 내용입니다. 

`하....이건 좀 너무한데...그냥 Docker나 설치하자..` 라는 생각을 하게 되었습니다.

그럼 Docker 설치에 대해 포스팅 해보겠습니다.

Docker 에 대한 자세한 설명은 하지 않을 겁니다. 

홈페이지 혹은 Docker 에 대한 포스팅을 참고하시기 바랍니다. 

간단히 말씀드리면 OS 단계까지 가상환경을 만드는 겁니다. 

그럼 설치 방법에 대해 적겠습니다. 

```bash
# 2020.10.10 추가 사항
conda uninstall curl

# SET UP THE REPOSITORY
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# INSTALL DOCKER ENGINE
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# VERIFY THAT DOCKER ENGINE IS INSTALLED CORRECTLY
sudo docker run hello-world
```

만약에 제대로 설치 되었다면 마지막에 다음과 같은 출력이 남습니다

{{< figure src="/images/post/nipa_docker/Untitled_4.png" >}}

여기까지 하시면 기본 Docker 설치는 끝났습니다. 

하지만 이것만 설치하면 GPU 는 사용하지 못합니다. 

GPU를 쓰기 위해선 [nvidia-docker](https://github.com/NVIDIA/nvidia-docker)를 설치를 해야 합니다.

nvidia-docker는 간단히 말하면 docker 에서 데스크탑의 GPU를 사용할 수 있도록 nvidia에서 만든(?)것입니다.

설치법은 다음과 같습니다.

```bash
# Ubuntu 16.04/18.04/20.04, Debian Jessie/Stretch/Buster
# Add the package repositories
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

# Test nvidia-docker
sudo docker run --gpus all nvidia/cuda:10.0-base nvidia-smi
```

이 또한 설치가 제대로 되었다면 마지막에 다음과 같이 `nvidia-smi` 출력이 나올 겁니다. 

{{< figure src="/images/post/nipa_docker/Untitled_5.png" >}}

|하....편안....|
|:--:|
|![NIPA%20x%20Docker%20ef94d24dfbc64a6cae24a83a59bd352f/Untitled%206.png](https://jjerry-k.github.io/public/img/nipa_docker/Untitled_6.png)|

이번엔 NIPA에 Docker 설치하는 과정을 포스팅 해봤습니다. 

공짜로 빌려주는 건 좋으나 환경 구축은 역시나....해야 하네요.

제가 쓰는 Docker image는 [개인적인 도커 파일](https://jjerry-k.github.io/living/2020/05/05/dockerfile/) 에 있으니 참고하세요!

## P.S
- 2020.10.10 내용 추가
  - sudo usermod -aG docker {유저명} 을 수행하시면 sudo 명령어가 필요 없습니다!