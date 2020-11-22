---
title: NIPA x VScode !
date: 2020-07-15T18:30:46+06:00
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

지금까지 [Docker(이하 도커) 세팅](https://jjerry-k.github.io/deeplearning/2020/06/28/nipa_docker) 까지 포스팅을 했었습니다. 

Docker 까진 좋은데...연결을 항상 Terminal 혹은 CMD를 켜서 ssh로 해야하나..? 생각이 듭니다.

그래서 이래저래 찾아봤습니다. 

Docker 공식 문서를 보니 [Dockerize an SSH service](https://docs.docker.com/engine/examples/running_ssh_service/) 이런 글이 있더군요. 

이 글을 참고하여 image(이하 이미지)를 만들어 보기로 했습니다. 

그럼 빠르게 빠르게 진행하겠습니다. 

## 1. Dockerfile 생성 및 build

```docker
FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu16.04
LABEL maintainer "Jerry Kim <jaeyeol2931@gmail.com>"
ARG PYTHON_VERSION=3.7
RUN apt-get update
RUN apt-get install -y \
        build-essential \
        cmake \
        git \
        curl \
        wget \
        vim \
        unzip \
        ca-certificates \
        libjpeg-dev \
        libpng-dev \
        openssh-server

RUN apt-get update && apt-get -y upgrade

#RUN mkdir /var/run/sshd
RUN echo 'root:{개인 비밀번호}' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

RUN rm -rf /var/lib/apt/lists/*

RUN curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o ~/miniconda.sh

RUN chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

RUN /opt/conda/bin/conda install -y python=$PYTHON_VERSION numpy pyyaml scipy ipython mkl mkl-include ninja cython typing opencv matplotlib tqdm && \
    /opt/conda/bin/conda install -y jupyter jupyterlab seaborn pillow pandas pylint scikit-learn scikit-image tensorflow-gpu && \
    /opt/conda/bin/conda update -y --all && \
    /opt/conda/bin/conda clean -ya
```

중간에 `RUN echo 'root:{개인 비밀번호}' | chpasswd` 에서 ssh 접속시 사용할 비밀번호를 적어주세요!

```bash
# Example
RUN echo 'root:test' | chpasswd
```

위 내용들을 vim이나 nano같은 에디터를 이용해서 Dockerfile을 만들어주세요!

{{< figure src="/images/post/nipa_vscode/Untitled.png" >}}

그리고 다음과 같이 커맨드를 입력하여 도커 이미지를 build 합니다.

```bash
docker build -t {이미지 이름} .
```

{{< figure src="/images/post/nipa_vscode/Untitled_1.png" >}}

뭐 이런 저런 Log 들이 촤라———라락 넘어갈겁니다. 계속 기다려 주세요.... 

`docker images` 를 입력하면 제대로 생성된 것을 볼 수 있습니다!

{{< figure src="/images/post/nipa_vscode/Untitled_2.png" >}}

## 2. Container 실행

이미지를 실행하여 container(이하 컨테이너) 만들어 줍니다. 

세부 옵션은 **구.글.링** 아시죠?

```bash
docker run -d -P -v /home/ubuntu/jerry/:/jerry --name {컨테이너 이름} {이미지 이름}

docker port {컨테이너 이름} 22
```

{{< figure src="/images/post/nipa_vscode/Untitled_3.png" >}}

컨테이너를 만들고 해당 컨테이너의 22번 포트 (ssh 포트)가 nipa의 몇번 포트와 연결되어 있는지 출력해줍니다.

## 3. VSCode를 이용하여 접속

> vscode 에 Remote - SSH 플러그인이 설치가 되어 있다는 전제 하에 진행합니다.

새로운 호스트를 추가해줍니다. 

{{< figure src="/images/post/nipa_vscode/Untitled_4.png" >}}

`ssh root@{NIPA IP} -p {포트 번호}` 라고 입력하고 엔터!

{{< figure src="/images/post/nipa_vscode/Untitled_5.png" >}}

그럼 우하단에 `Host를 추가했습니다!` 와 같이 알림이 뜹니다. 

추가를 했으니 이제 Host에 연결을 해봅니다. 

비밀번호는 맨 처음에 Dockerfile에서 썼던 비밀번호 입니다!

{{< figure src="/images/post/nipa_vscode/Untitled_6.png" >}}

아마 처음에는 세팅이 오래 걸릴겁니다. 우하단에 알림이 없어질 때까지 기다려주세요 ! 

기초 세팅이 다 완료 되면 컨테이너의 vscode-server에 플러그인을 설치해야 합니다. 

저는 아래 4개 플러그인을 설치했어요.

{{< figure src="/images/post/nipa_vscode/Untitled_7.png" >}}

그 후에 테스트 코드를 돌려봅니다. 

{{< figure src="/images/post/nipa_vscode/Untitled_8.png" >}}

정상적으로 잘 작동하네요!

후...이제 Vim으로 코딩을 안할 수 있습니다. 

이번 포스팅은 정말 환경 구축이 처음이신 분들께는 불친절한 포스팅일 수도 있습니다. 

죄송합니다. 일단 제 일기처럼 쓰는 포스팅이라서요. 감안해서 읽어주세요. 

## P.S.

- 근데 막상 내가 NIPA를 .....주로 쓰지 않음...
- 나에게 NIPA는 환경 구축 포스팅을 적는 용도...