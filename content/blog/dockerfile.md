---
title: 개인적인 도커 파일
date: 2020-05-05T18:30:46+06:00
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

# 지극히 개인이 사용하기 위한 Dockerfile

---

- 환경을 만들 때마다 추가될 예정입니다.
- 마음껏 편하신대로 Copy & Paste 하세요!

## TensorFlow
```Dockerfile
FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04
LABEL maintainer "Jerry Kim <jaeyeol2931@gmail.com>"
ARG PYTHON_VERSION=3.7
RUN apt-get update
RUN apt-get install -y \
        build-essential \
        cmake \
        git \
        curl \
        wget \
        ca-certificates \
        libjpeg-dev \
        libpng-dev

RUN apt-get update && apt-get -y upgrade

# 2020.10.11 내용 추가
# Docker container에 ssh로 접속하고 싶다면....
# RUN mkdir /var/run/sshd
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

ENV PATH /opt/conda/bin:$PATH

```