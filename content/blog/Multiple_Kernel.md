---
title: jupyter (ipython) 여러 커널 사용하기!
date: 2019-07-10T18:30:46+06:00
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

Anaconda 를 사용하다보면 여러 가상환경을 만들게 됩니다. (아닐수도 있구요...)  
그 후에 jupyter 를 사용하시는 분들이라면 대부분 이렇게 사용하실 겁니다.  

``` bash
conda activate 환경이름
jupyter notebook
```

`conda activate 환경이름` 이라는걸 **무.조.건** 써줘야하죠..  
이게 매우 귀찮았습니다...  
> "activate 없이 base에서 `jupyter notebook`을 실행해도 가상환경을 잡을 수 있는 방법이 없나.."   

이런 생각 많이들 하실 것 같습니다.  
당연히 방법이 있습니다!  
그 방법에 대해 알려드리겠습니다.  

``` bash
conda activate {환경이름}
python -m ipykernel install --user --name {환경이름} --display-name {Jupyter에 표시될 이름}
```

이렇게 하시면 됩니다. 예시를 직접 보여드리겠습니다. 

{{< figure src="/images/post/multi_kernel/01.png" >}}

저는 base 환경만 썼습니다. 가상환경을 가볍게 하나 만들도록 할게요!

{{< figure src="/images/post/multi_kernel/02.png" >}}

`test`라는 가상환경을 만들었습니다. 먼저 **kernel을 추가하지 않고** jupyter notebook을 실행해보겠습니다.  

{{< figure src="/images/post/multi_kernel/03.png" >}}
{{< figure src="/images/post/multi_kernel/04.png" >}}

첫번째 사진을 보시면 **Python 3** 만 나오는걸 보실 수 있습니다. 저 **Python 3** 는 base의 Python을 가리킵니다.  
base에는 제가 tensorflow를 설치해놨기 때문에 import 가 잘 작동하는군요..  
그럼 kernel을 추가해보겠습니다.  (일단 test 환경에 ipython 이 안깔려있어서 설치함..)

{{< figure src="/images/post/multi_kernel/05.png" >}}
{{< figure src="/images/post/multi_kernel/06.png" >}}

커널을 추가하고 나면 `Installed ~~~~` 라는 메세지를 보실 수 있어요!  
그럼 다시 base로 돌아가서 jupyter notebook을 실행해보겠습니다.

{{< figure src="/images/post/multi_kernel/07.png" >}}
{{< figure src="/images/post/multi_kernel/08.png" >}}

첫번째 사진을 보시면 추가하기 전과는 다르게 **test** 라는 항목이 추가되었습니다!  
실행을 해봐도 tensorflow 모듈이 없다고 나오는걸 확인하실 수 있습니다!  
앞으로는 `conda activate ~~`를 안하셔도 되요! (뿌듯)  


이번 포스팅은 여기까지 입니다.  
많은 분들께 도움이 되었으면 좋겠네요!  

**PS. jupyter notebook 우측 상단쪽에 어떤 커널로 실행하고 있는지 표시가 됩니다.  (`Logout` 아래)** 