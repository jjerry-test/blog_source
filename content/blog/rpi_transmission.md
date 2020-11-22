---
title: Raspberry pi 4 에 Transmission 세팅하기
date: 2020-04-20T18:30:46+06:00
draft: false

#post thumb
image: #"images/featured-post/post-1.jpg"

# meta description
description: "this is meta description"
math: true

# taxonomies
categories:
  - "Living"
tags:
  - "Hardware"

# post type
type: "post"
---

# Raspberry pi 4 & Transmission Container

---

# 1. Docker Install

``` bash
curl -fsSL get.docker.com -o get-docker.sh

sudo bash get-docker.sh

sudo usermod -aG docker pi
```
그리고 재부팅

# 2. Pull Transmission Image

``` bash
docker pull linuxserver/transmission
```

# 3. Create Transmission Container

``` bash
docker create \
    --name=transmission \
    -e PUID=1000 \
    -e PGID=1000 \
    -e TZ=Asia/Seoul \
    -e USER={username} \
    -e PASS={password} \
    -p 9091:9091 \
    -p 51413:51413 \
    -p 51413:51413/udp \
    -v {path to data}:/config \
    -v {path to downloads}:/downloads \
    -v {path to watch folder}:/watch \
    --restart unless-stopped \
    linuxserver/transmission
```

# 4. Run Container

``` bash
docker start transmission
```