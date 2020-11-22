---
title: Mac Terminal Customizing
date: 2018-11-07T18:30:46+06:00
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
  - "Macbook"

# post type
type: "post"
---

저는 터미널을 마음대로 바꾸는걸 좋아합니다.  
기본 터미널을 대체할 앱이 있긴하지만 추가적으로 설치하는걸 안좋아해서..ㅎㅎ  
그래서 Customizing 하는 법을 포스팅하려고 합니다.  
Mac 터미널에서 환경변수 설정은 `.bash_profile` 에서 합니다.
Ubuntu 에서 `.bashrc`와 같다고 생각하시면 되요.

``` bash
# terminal customize
# 컬러 적용 여부
export CLICOLOR=1
# 디렉토리의 생상
export LSCOLORS=GxFxCxDxBxegedabagaced
# 유저 및 호스트의 색상
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\]\$'
```

첫번째 옵션은 1이면 Customizing응 한다는 의미입니다.  

두번째 옵션이 좀 문제인데요..  
알아보기 매우 힘듭니다..  
저도 기억하기 힘들어서 포스팅을 하는거죠.  
자..두번째 옵션을 두 부분으로 나눠서 설명드리겠습니다.  

```
Gx Fx Cx Dx Bx
1x 2x 3x 4x 5x

1x : 디렉토리 색상
2x : symbolic link 색상
3x : socket 색상
4x : pipe 색
5x : 실행파일 색상
```

```
eg ed ab ag ac ed
1a 2b 3c 4d 5e 6f

1a : block special 색상
2b : char special 색상
3c : exe_setuid 색상
4d : ext_setgid 색상
5e : a-dir_writeothers_sticky 색상
6f : b-dir_writeothers_NOsticky 색상
```
솔직히 socket, pipe, 1a ~ 6f 까지는 뭔지 잘 모르겠습니다..  
제대로 배우지 않아서...ㅎㅎ

색상 설명
```
a     black
b     red
c     green
d     brown
e     blue
f     magenta
g     cyan
h     light grey

A     bold black
B     bold red
C     bold green
D     bold brown  (거의 노란색)
E     bold blue
F     bold magenta
G     bold cyan
H     bold light grey (거의 흰색)
x     default foreground or background
```

모든 색상설정은 알파벳 두개로 구성이 됩니다.  
앞에 알파벳은 글자의 색상이고 뒤에 알파벳은 배경의 색상입니다.

세번째 옵션을 살펴보겠습니다.  
이 옵션 또한 복잡하게 써있네요..
```
'\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\]\$'

```

이건 터미널을 켰을때 유저와 PC 이름을 어떻게 보여줄 것인가를 정합니다.

`'\[\033[01;32m\]\u@\h\[\033[00m\]` 에서 {USER_NAME}@{PC_NAME}을 초록색 볼드체로 하겠다라는 의미입니다. (01 : 볼드체, 32m : 초록색)

`\[\033[01;35m\]\w\[\033[00m\]` 에서 ~을 자주색 볼드체로 하겠다라는 의미입니다. (01 : 볼드체, 35m : 자주색)


자세한 정보는 추후에 더 추가하겠습니다!
