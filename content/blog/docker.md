---
title: 자주 사용하는 Docker Command 정리
date: 2020-08-30T18:30:46+06:00
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

``` bash
# nvidia docker 서비스 시작
sudo service nvidia-docker start

# 특정 포트 터널링, 경로 마운트, Docker image:tag 를 이용하여 container 로 실행
docker run -ti -rm -p {호스트포트}:{도커포트} -v {호스트경로}:{도커경로} {IMAGE_NAME:tag} bash

# 종료된 Container 삭제
docker rm {CONTAINER_NAEM}

# Docker Image 삭제
docker rmi {IMAGE_NAME}

# 종료된 Container를 삭제하지 않고 새로운 IMAGE로 생성
docker commit {CONTAINER_NAEM} {IMAGE_NAME:TAG}

# Docker container 내에서 jupyter notebook 혹은 jupyter lab을 실행할때 사용되는 커맨드
CUDA_VISIBLE_DEVICES=0 jupyter notebook --ip=0.0.0.0 --port=포트번호 --allow-root

``` 