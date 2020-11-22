---
title: Docker Usage (1)
date: 2020-10-24T18:30:46+06:00
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
  - "Docker"

# post type
type: "post"
---

Docker 에 대한 설명은 안합니다. 

사용법을 보러 오시는 분이라면 어느 정도 Docker 가 뭔지는 아실테니...

자세한 설명이 보고 싶으시다면 [공식 홈페이지](https://docs.docker.com/get-started/overview/) 혹은 책을 참고하세요.

설치 방법은 간단하게 다음과 같습니다.

```bash
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

# DOCKER ENGINE 설치
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Docker 동작 확인
sudo docker run hello-world

# sudo 를 붙이지 않기 위해 사용자 계정을 docker 그룹에 추가
sudo usermode -aG docker {계정명}

sudo reboot
```

# 커맨드 소개

`docker` 라고 입력하면 수 많은 커맨드가 나옵니다.

그 중에 이번 포스팅에 등장하는 커맨드를 정리 해보려 합니다. 

`docker ps`: 컨테이너 리스트 출력 

`docker images`: 이미지 리스트 출력

`docker rm`: 컨테이너 제거

`docker rmi`: 이미지 제거

`docker build`: Dockerfile 을 이용하여 이미지 구축

`docker pull`: Docker hub 에 있는 이미지 다운로드

`docker run`: 이미지를 실행하여 컨테이너 생성

# 자신만의 Image, Container 만들어보기

예시는 ubuntu에 python 3.x를 설치하는 과정입니다. 

`docker run` 옵션에 대해서는 [링크](https://docs.docker.com/engine/reference/commandline/run/)(여기) 에서 확인하세요. 

```bash
# 지원하는 ubuntu tag
# 14.04, trusty-20191217, trusty
# 16.04, xenial-20200916, xenial
# 18.04, bionic-20200921, bionic
# 20.04, focal-20200925, focal, latest, rolling
# 20.10, groovy-20200921, groovy, devel

# Docker image download
docker pull ubuntu:{원하는 버전 tag}
# ex)
# docker pull ubuntu:18.04
# docker pull ubuntu:groovy

# Container 생성
docker run -ti ubuntu:{원하는 버전 tag} bash
```

{{< figure src="/images/post/Docker_Usage_01/Untitled.png" >}}

{{< figure src="/images/post/Docker_Usage_01/Untitled_1.png" >}}

```bash
# Docker container 에서 실행.
apt update

apt install -y build-essential cmake git curl wget vim unzip 

apt install -y ca-certificates libjpeg-dev libpng-dev software-properties-common

add-apt-repository ppa:deadsnakes/ppa

apt install python{원하는 버전}

# 설치 확인
ls /usr/bin/ | grep python

exit
```

apt install 부분에서 python 3 중 stable 버전이 설치될 겁니다. 

그래서 지금은 3.8이 설치 됩니다. ( 3.8 을 설치하실 분들은 apt로 python을 설치할 필요 없음 )

추가적으로 저는 3.7을 설치했습니다. 

그 결과 마지막 커맨드 (`ls /usr/bin/ | grep python`)를 입력하면 다음과 같이 출력이 나옵니다. 

{{< figure src="/images/post/Docker_Usage_01/Untitled_2.png" >}}

이렇게 하면 Container에 원하는 환경을 세팅했습니다. 

```bash
docker ps -a
```

{{< figure src="/images/post/Docker_Usage_01/Untitled_3.png" >}}

이를 Image로 만들어야 합니다. 

```bash
docker commit {컨테이너 이름} {이미지 이름:태그}
docker images
docker rmi {컨테이너 이름}
```

{{< figure src="/images/post/Docker_Usage_01/Untitled_4.png" >}}

앞으로는 `docker run -ti --rm {이미지 이름:태그} bash` 와 같이 실행하면 됩니다!

# Dockerfile 이용해보기

이전의 예시는 Image download 부터 commit 까지 하나하나 직접 커맨드를 입력했습니다. 

그렇지 않고 파일을 만들고 그걸 이용해서 Image를 생성하는 방법이 있습니다. 

`Dockerfile`과 `docker build`를 이용합니다. 

`Dockerfile`을 만들 때도 커맨드를 사용하게 되는데 예시에서 사용할 커맨드는 다음과 같습니다.

`FROM`: 어떤 image를 베이스로 할 것인지 지정.

`LABEL`: 해당 Dockerfile로 만든 이미지의 정보, 작성자등의 정보 작성. (꼭 할 필요는 없음)

`ARG`: Dockerfile 내에서 사용되는 환경변수 (`ENV`와 혼동되기 쉬움)

`RUN`: image를 구성에 필요한 각 단계를 실행

```bash
FROM ubuntu:{원하는 버전 tag}
LABEL maintainer "Jerry Kim <jaeyeol2931@gmail.com>"
ARG PYTHON_VERSION={원하는 버전}

# Docker container 에서 실행.

RUN apt update -q

RUN DEBIAN_FRONTEND='noninteractive' apt install -y build-essential cmake git curl wget vim unzip

RUN DEBIAN_FRONTEND='noninteractive' apt install -y ca-certificates libjpeg-dev libpng-dev software-properties-common

RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt install -y python$PYTHON_VERSION

# 설치 확인
RUN ls /usr/bin/ | grep python
```

대충 디렉토리를 하나 만들고 위 내용이 담긴 Dockerfile을 만듭니다. 

{{< figure src="/images/post/Docker_Usage_01/Untitled_5.png" >}}

그리고 Dockerfile이 있는 디렉토리로 이동하여 다음 커맨드를 입력합니다.

```bash
docker build -t {이미지 이름:태그} .
```

{{< figure src="/images/post/Docker_Usage_01/Untitled_6.png" >}}

그럼 다음과 마지막에 다음과 같은 출력이 나오고 `docker images`를 해보면 잘 생성된 것을 볼 수 있습니다. 

{{< figure src="/images/post/Docker_Usage_01/Untitled_7.png" >}}

{{< figure src="/images/post/Docker_Usage_01/Untitled_8.png" >}}

## P.S

- apt → apt-get 으로 바꿔도 상관없어요.
- 피곤하네요.
- 의욕이 없네요.
- Docker Usage (2) 는 뭐로 하지..