---
title: Python Installation for mac
date: 2018-09-27T18:30:46+06:00
draft: false

#post thumb
image: #"images/featured-post/post-1.jpg"

# meta description
description: "this is meta description"
math: true

# taxonomies
categories:
  - "Python"
tags:
  - "Setting"

# post type
type: "post"
---

``` bash
# brew 설치.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# wget 설치.
brew install wget

#pyenv 설치.
brew install pyenv

# bash_profile 에 경로 추가.
echo 'export PYENV_ROOT="${HOME}/.pyenv"' >> ~/.zshrc

echo 'export PATH="${PYENV_ROOT}bin:$PATH"' >> ~/.zshrc

echo 'eval "$(pyenv init -)"' >> ~/.zshrc

exec $SHELL

# 설치할 수 있는 환경 보여줌.
pyenv install --list

# 위에서 환경 확인 후 원하는 버전 입력.
pyenv install <버전 이름>

# system  과 <버전 이름> 두 환경이 존재.
pyenv versions

# <버전 이름>으로 default version 변경.
pyenv global <버전 이름>

pyenv versions


# tmp 폴더 에선 system 이라는 버전으로 사용.
mkdir tmp

cd tmp

pyenv local system

```

**pyenv** 를 사용하면 특정 폴더에서는 python2 로 작동하고 그 외에는 python3 로 작동하게 할 수 있습니다!

감사합니다!
