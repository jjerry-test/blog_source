---
title: jupyter Lab 에서 단축키 설정하는 방법!
date: 2019-09-07T18:30:46+06:00
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

파이썬, 딥러닝을 하시는 분들 중 Jupyter 부류를 이용하시는 분들이 꽤 많습니다. `Jupyter Notebook, Jupyter Lab,...`  
저는 둘 다 사용해보긴 하지만 주로 **Jupyter Lab** 을 사용합니다.  
이유는 그냥...좀 더 보기 편해서..?  
두 환경의 차이는 다음 링크에서 확인해주세요.  
- [Jupyter Notebook](https://jupyter.readthedocs.io/en/latest/running.html#running)
- [Jupyter Lab](https://jupyterlab.readthedocs.io/en/stable/index.html)

#### 참고사항  
https://github.com/jupyterlab/jupyterlab/issues/7122  
며칠 전 이슈에 올라온 상황입니다.  
jupyter lab 1.0.2 버전에 extension을 설치하면 sidebar 부분이 깨지는 버그가 있네요...  
1.1.1 에선 고쳐졌다고 합니다.


**<span style="font-size:25pt;">자, 다시 본론으로 돌아가봅니다.</span>**

Jupyter Lab 에서 단축키로 설정할 수 있는 기능들은 다음과 같습니다.

'notebook:create-new'  
'notebook:interrupt-kernel'  
'notebook:restart-kernel'  
'notebook:restart-clear-output'  
'notebook:restart-run-all'  
'notebook:reconnect-to-kernel'  
'notebook:change-kernel'  
... (너무 많다....)  
'notebook:hide-all-cell-outputs'  
'notebook:show-all-cell-outputs'  
'notebook:enable-output-scrolling'  
'notebook:disable-output-scrolling'  
'notebook:save-with-view'  

너무 많은 관계로 **[링크](https://github.com/jupyterlab/jupyterlab/blob/af548c2674427da79d54ad5c4b69bb175463e9a0/packages/notebook-extension/src/index.ts#L69-L197)** 참고해주세요.  


이번 포스팅에선 예시로 
`Restart and Clear` 에 대해서 shortcut을 설정해보겠습니다.

## 설정 방법 

먼저 Jupyter Lab 을 실행시켜주세요.

{{< figure src="/images/post/shortcut/fig01.png" >}}

**Advanced Setting Editor** 를 클릭해주세요.

{{< figure src="/images/post/shortcut/fig02.png) " >}}

좌측에 **Keyboard Shortuts** 를 선택해주세요.

{{< figure src="/images/post/shortcut/fig03.png" >}}

여기서 왼쪽의 창은 default setting에 대한 설명이고 오른쪽을 Custom 을 위해 기입하는 부분입니다.  

그럼 예시대로 `Restart and Clear` 에 대해서 shortcut을 설정해보겠습니다.

위에 기능에 대해서 링크 올려드렸었죠? 그 깃헙에서 링크에 대한 내용을 먼저 찾아봅니다.

{{< figure src="/images/post/shortcut/fig04.png" >}}

거기서 '{기능 이름}' 부분을 복사해주세요.

그리고 다음과 같이 기입해줍니다.  

{{< figure src="/images/post/shortcut/fig05.png" >}}

그리고 우측 상단에 저장버튼을 누르고 노트북에서 Shift + Command + C 를 눌렀을때 `Restart and Clear` 이 작동하게 됩니다.  

사진만 보고 따라 적으시기 귀찮으실테니 code block 으로 남깁니다.

```
"shortcuts": [
    {
        "command": "kernelmenu:restart-and-clear",
        "keys": ["Shift + Ctrl + C"],
        "selector": "[data-jp-kernel-user]:focus"
        }]
```

과정을 요약해드리면 (Jupyter Lab 켜기 ~ Editor 열기 까지는 생략)
1. 기능에 대한 링크에서 자신이 원하는 기능 찾기
2. 위에 code block 에서 "command": 부분에 '{기능 이름}' 기입
3. "keys": 에 원하는 커맨드 넣기 (복수개 가능)
4. "selector": 에 .jp-Notebook:focus" 혹은 "[data-jp-kernel-user]:focus" 기입
5. 저장 후 즐겁게 사용!

shortcut 설정은 여기까지 입니다.  
혹시 이외에 다른 설정에 대해 궁금한거 있으시면 comment 남겨주세요!


### 참고사항
>만약 **A 기능은 Shift + Alt + C** 이고 **B 기능은 Alt + Shift + C** 일때... 전체적으로 보면 같은 키 입력이지만 순서가 다르기 때문에 **별개의 shortcut으로 작동**합니다.