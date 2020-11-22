---
title: scp를 이용해서 파일 or 디렉토리 복사하기!
date: 2018-12-08T18:30:46+06:00
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
  - "Command"

# post type
type: "post"
---

대부분이 그렇겠지만 딥러닝, 머신러닝 하시는 분들은 우분투 서버를 이용합니다.  
물론 저도 그렇구요. 가끔 파일을 로컬에 복사할 일이 있습니다.  
 `mobaXterm` 이라던가 `xshell` 같은 프로그램으로 옮길 수도 있지만 제 경험상 대용량이라던가 파일이 많다면 끊기더구요..  
 그래서 CLI 환경에서 하는 방법을 찾아보다가 `scp` 라는 명령어가 있더군요.  
 방법은 간단합니다.
``` bash
scp -r (계정이름)@(IP):(복사할 파일 경로) (저장할 경로)
```

이렇게 하면 끝나더군요. scp에 대한 자세한 설명은 추후에 추가하겠습니다.
