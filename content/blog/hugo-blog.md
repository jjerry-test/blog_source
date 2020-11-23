---
title: "Hugo Blog"
date: 2020-11-23T20:41:18+09:00
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
  - "Hugo"

# post type
type: "post"
---

이번에 Github Blog를 이전하게 되었습니다!

기존에는 [Jekyll](https://jekyllrb.com) 기반의 블로그를 사용했었는데요. 

이게 약간.. 편한 듯 불편한 듯(특히나 gem bundle....관리).. 뭔가 부족한 느낌이였습니다. 

Jekyll이 아닌 다른 기반의 Generator 를 찾아보기 시작했습니다. 

후보군은 세 개가 있었습니다. Hexo, Hugo, Gatsby...

[Hexo](https://hexo.io/ko/)는 Jekyll 보다는 낫지만 별로라는 평이 있었고 [Gastby](https://www.gatsbyjs.com)는 프론트 알못인 저에겐 그냥 어렵...더군요.

그래서 [Hugo](https://gohugo.io)를 이용해보기로 했습니다. 

그럼 `Hugo를 이용한 블로그 세팅` 시작하겠습니다. 

### 준비물
- 2개의 github repository
    - 블로그 소스용: 이름 막 지어도 상관없음. ex) blog_source
    - 호스팅용: {Username}.github.io 로 만드셔야 합니다. ex) jjerry-k.github.io

- 원하는 테마
    - https://themes.gohugo.io 여기서 원하는걸 골라놓으세요.


### 세팅 과정

#### 1. Repository 생성
준비문에서 얘기했듯 두개의 repository를 준비합니다. 
- 블로그 소스용
{{< figure src="/images/post/hugo-blog/img_01.png" >}}

- 호스팅용
    - 사진을 올려야하는데 저는 이미 ... Jekyll로 쓰고 있던지라 ... 패스
    - 블로그 소스용 repository 처럼 비어있도록 만들어주세요. 

#### 2. Hugo 설치 및 프로젝트 생성.
```bash
brew install hugo

hugo new site {프로젝트 이름}
```

hugo를 설치하고 새 프로젝트를 생성합니다. 

저는 편의를 위해 프로젝트 이름을 **blog_source** 라고 했습니다. 

{{< figure src="/images/post/hugo-blog/img_02.png" >}}

#### 3. 테마 설치
프로젝트 디렉토리에 themes 디렉토리가 보입니다. 
themes 디렉토리로 이동하여 위에서 골랐던 테마를 다운로드 합니다.
저는 [liva-hugo](https://github.com/themefisher/liva-hugo) 를 사용했습니다.

```bash
cd blog_source
cd themes
git clone https://github.com/themefisher/liva-hugo.git
```

{{< figure src="/images/post/hugo-blog/img_03.png" >}}

{{< figure src="/images/post/hugo-blog/img_04.png" >}}

liva-hugo 는 이해가 쉽도록 exampleSite를 이용해보려고 합니다. 
blog_source/themes/liva-hugo/exampleSite 에 있는 content, static, config.toml 을 blog_source 에 있는 위치에 복사해줍니다. 
```bash
cp -r themes/liva-hugo/exampleSite/content/* ./content
cp -r themes/liva-hugo/exampleSite/static/* ./static
cp themes/liva-hugo/exampleSite/config.toml ./
```
{{< figure src="/images/post/hugo-blog/img_05.png" >}}

#### 4. 서버 실행 및 글쓰기
현재 블로그 상태가 어떤지 궁금합니다. 일단 hugo server를 실행시켜 봅니다.
``` bash
# 현재 위치: 프로젝트 디렉토리
hugo server -p {원하는 포트 번호} -D # Default PORT 1313 
```
{{< figure src="/images/post/hugo-blog/img_06.png" >}}

그리고 localhost:1313 로 접속을 하면 예시를 사이트 양식을 가져왔기 때문에 다음과 같이 나옵니다. 
{{< figure src="/images/post/hugo-blog/img_07.png" >}}


포스팅을 하기 전에 다른 포스팅을 확인해봅니다. 
{{< figure src="/images/post/hugo-blog/img_08.png" >}}

liva-hugo는 이러한 템플릿을 바탕으로 포스팅을 작성해야합니다.

세부 내용은 직접 사용하시면서 익히시길....

자 그럼 포스팅을 한번 써보도록 합시다.

`hugo new blog/hello.md` 라고 입력을 해도 되고 `blog/hello.md 를 직접 생성`하셔도 됩니다. 

그 후 템플릿에 맞게 작성을 해줍니다. 

{{< figure src="/images/post/hugo-blog/img_09.png" >}}

이렇게 작성 후 저장을 하면 블로그에 다음과 같이 글이 생성된 것을 볼 수 있습니다. 

{{< figure src="/images/post/hugo-blog/img_10.png" >}}

hugo 공통적으로 템플릿에 `draft: ` 부분을 `true`로 한다면 블로그에 반영되지 않습니다. 

반대로 `false` 를 적는다면 블로그에 반영이 됩니다. 

#### 5. Github에 배포

커맨드로 바로 적겠습니다. 

``` bash
# 현재 위치: 프로젝트 디렉토리
git init
git remote add origin https://github.com/jjerry-k/blog_source #{블로그 소스용 repository}
git submodule add -b master https://github.com/jjerry-k/jjerry-k.github.io public #{호스팅용 repository}
```

그 후 빌드 & 배포를 합니다. 
``` bash
# 현재 위치: 프로젝트 디렉토리
hugo -t liva-hugo # hugo -t {테마 이름}

cd public
git add .
git commit -m "Update"
git push

cd ..
git add .
git commit -m "Update"
git push
```


1~5번 까지의 과정을 거친 후 {Username}.github.io 로 접속을 해보면 정상적으로 블로그가 생긴 것을 볼 수 있습니다. 

만약 새 글을 쓰고 싶다면?

4번과 5번을 반복하시면 됩니다. 


## P.S
- 블로그 이전 느므 힘들다...