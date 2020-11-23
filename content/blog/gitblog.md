---
title: Jekyll Blog
date: 2018-10-24T18:30:46+06:00
draft: false

#post thumb
image: #"images/featured-post/post-1.jpg"

# meta description
description: "this is meta description"
math: true

# taxonomies
categories:
  - "Blog"
tags:
  - "Jekyll"

# post type
type: "post"
---

안녕하세요! Jerry 입니다.  
요즘 깃헙으로 블로그를 하려고 하시는 분이 많은데요!  
한번 만드는 법을 포스팅해보려고 합니다!  
깃헙 블로그는 보통 `Jekyll` 이라는 정적 사이트 생성기를 이용합니다.  
자세한 설명은 [**여기서**](https://jekyllrb-ko.github.io/docs/home/) 확인 하시면 됩니다.  
블로그 만드는 방법은 두 가지가 있는데요.

1. 테마를 자기가 만드는 방법.

2. 공개된 테마를 가져와서 수정하는 방법.

전 **2번 방법** 으로 했습니다.  
왜냐하면 전 웹 프로그래밍 언어를 모르니까요..ㅎㅎ  
그래서 **2번 방법** 에 대해 포스팅하려고 합니다.


## 1. 원하는 테마 다운받기.

[**템플릿 모음1**](http://jekyllthemes.org)
[**템플릿 모음2**](https://jekyllthemes.io)

위 링크는 템플릿에 대한 정보를 모아놓은 사이트입니다.  
링크에 자신이 원하는 템플릿을 들어가보면 대부분 깃헙 repository 로 연결됩니다.  
예시로 **템플릿 모음1** 에 있는 `Prologue` 라는 테마를 적용해보겠습니다.

{{< figure src="/images/post/gitblog/01.png" >}}

`Download`를 바로 누르셔도 되고 `Homepage`에 들어가서 `git clone, Download ZIP` 하셔도 상관없습니다.  
다운로드 받은 후에 알집을 풀어주세요!  
전 `Home`에 풀었구요.  

{{< figure src="/images/post/gitblog/02.png" >}}

{{< figure src="/images/post/gitblog/03.png" >}}

그 폴더 안에는 이렇게 구성이 되어 있습니다.

## 2. 루비 젬 설치.

템플릿을 만들면서 바로 바로 수정되는 사항을 볼 수 있다면 좋겠죠?  
그렇기 때문에 **루비 젬** 이라는 것을 설치 해야합니다.  
OS 별 설치법은 [**여기서**](https://jekyllrb-ko.github.io/docs/installation/) 확인하시면 됩니다.

저는 Mac OS 를 기준으로 작성하겠습니다.  
`gem install jekyll bundler` 까지 진행하세요.



## 3. localhost 서버 열기.

다음과 같이 터미널을 열고 압축푼 경로로 이동해줍니다.

{{< figure src="/images/post/gitblog/04.png" >}}

그리고 `bundle install` 이라고 입력합니다.  

{{< figure src="/images/post/gitblog/05.png" >}}

그러면 뭐 이것 저것 설치가 될거에요.

{{< figure src="/images/post/gitblog/06.png" >}}

서버를 열 준비는 끝났습니다.  
이제 터미널에 `bundle exec jekyll serve` 라고 입력해주세요.

{{< figure src="/images/post/gitblog/07.png" >}}

사진과 같이 나올거에요!  
밑에 `http://127.0.0.1:4000/jekyll-theme-prologue`라고 나와있네요!  
그럼 인터넷 브라우저를 켜주시고 주소창에 입력해주세요!

그럼 다음과 같은 창이 열립니다.

{{< figure src="/images/post/gitblog/08.png" >}}

이제 블로그를 할 준비는 완료했습니다!  
다음엔 테마를 토대로 커스터마이징 하는 포스팅을 준비해보겠습니다!
