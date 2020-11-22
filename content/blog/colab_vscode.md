---
title: Colab x VSCode !
date: 2020-07-13T18:30:46+06:00
draft: false

#post thumb
image: #"images/featured-post/post-1.jpg"

# meta description
description: "this is meta description"
math: true

# taxonomies
categories:
  - "DeepLearning"
tags:
  - "Tools"

# post type
type: "post"
---


> 본 포스팅은 [Colab on steroids: free GPU instances with SSH access and Visual Studio Code Server](https://towardsdatascience.com/colab-free-gpu-ssh-visual-studio-code-server-36fe1d3c5243) 내용을 (많이) 참고하여 작성하였습니다.

많은 분들이 Google Colaboratory (코랩) 를 사용하실겁니다. (무료니까...) 

무료로 고성능(?)의 하드웨어를 쓸 수 있다는 건 참 좋은 것입니다!

하지만...문제는 Jupyter Notebook 형식으로 써야한다는거...아 물론 편하신 분들도 있겠죠!?

전 개인적으로 별로 안좋아합니다. (물론 애초에 안쓰기도 함.)

근데 SSH, VSCode Server를 이용해서 Colab에 접속을...하는 포스팅이 있더군요. 

갑자기 실험쥐 정신이 튀어나와서 진행을 해봤습니다. 

뻘소리 그만하고 간단 간단 설명 시작하겠습니다. 

## 1. ngrok으로 token 만들기

ngrok은 대충 로컬 웹 서버를 SSH 접속이나 모바일 테스트 할 수 있도록 공공 URL로 접근 가능토록 해주는 것입니다.  가격은 걱정하지 마세요. 1개는 무료거든요. 

{{< figure src="/images/post/colab_vscode/Untitled.png" >}}


어쨌든 가입을 하고 token을 생성 해줍니다. 

{{< figure src="/images/post/colab_vscode/Untitled_1.png" >}}


{{< figure src="/images/post/colab_vscode/Untitled_2.png" >}}

## 2. Colab에 ngrok 설치 및 실행

노트북 설정을 먼저 해주세요. (ex) CPU, GPU, TPU

{{< figure src="/images/post/colab_vscode/Untitled_3.png" >}}

그리고 셀에 다음과 같이 코드를 실행합니다. 

아래 authtoken 에는 ngrok의 Authtoken을 적어주세요. (당연하지만 스트링으로)

```python
# Install useful stuff
! apt install --yes ssh screen nano htop ranger git > /dev/null
# SSH setting
! echo "root:carbonara" | chpasswd
! echo "PasswordAuthentication yes" > /etc/ssh/sshd_config
! echo "PermitUserEnvironment yes" >> /etc/ssh/sshd_config
! echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
! service ssh restart > /dev/null
# Download ngrok
! wget -q -c -nc https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
! unzip -qq -n ngrok-stable-linux-amd64.zip
# Run ngrok
authtoken = **"PUT_YOUR_TOKEN_HERE"**
get_ipython().system_raw('./ngrok authtoken $authtoken && ./ngrok tcp 22 &')
! sleep 3
# Get the address for SSH
import requests
from re import sub
r = requests.get('http://localhost:4040/api/tunnels')
str_ssh = r.json()['tunnels'][0]['public_url']
str_ssh = sub("tcp://", "", str_ssh)
str_ssh = sub(":", " -p ", str_ssh)
str_ssh = "ssh root@" + str_ssh
print(str_ssh)
```

{{< figure src="/images/post/colab_vscode/Untitled_4.png" >}}

출력으로 나온 커맨드를 이용하여 한번 터미널에서 테스트를 해봅니다. 비밀번호는 `carbonara` 입니다. 

{{< figure src="/images/post/colab_vscode/Untitled_5.png" >}}

## 3. VSCode에서 실행하기

먼저 Colab 화면에서 다음 코드를 실행해서 Google Drive를 마운트 해줍니다.

```python
# Mount Google Drive and make some folders for vscode
from google.colab import drive
drive.mount('/googledrive')
! mkdir -p /googledrive/My\ Drive/colabdrive
! mkdir -p /googledrive/My\ Drive/colabdrive/root/.local/share/code-server
! ln -s /googledrive/My\ Drive/colabdrive /
! ln -s /googledrive/My\ Drive/colabdrive/root/.local/share/code-server /root/.local/share/
```

{{< figure src="/images/post/colab_vscode/Untitled_6.png" >}}

VSCode를 켜고 ssh로 접속을 해봅니다. 

{{< figure src="/images/post/colab_vscode/Untitled_7.png" >}}

접속해서 Colab Notebooks 디렉토리에 접근한 화면입니다. Google Drive랑 동일한 것을 확인할 수 있죠!

{{< figure src="/images/post/colab_vscode/Untitled_8.png" >}}

## 4. 코드 작성 및 실행

코드 실행 여부를 테스트 해보겠습니다. 

일단 Colab 에는 VSCode 플러그인이 설치 되어 있지 않기 때문에 python이나 개인적으로 필요한 플러그인들을 설치해줍니다. 

저는 테스트이니 아래 세 가지만 설치했습니다.

{{< figure src="/images/post/colab_vscode/Untitled_9.png" >}}

그럼 한번 실행해보죠.

{{< figure src="/images/post/colab_vscode/Untitled_10.png" >}}

오.....신기...

이렇게 연결해서 사용이 가능합니다. 

`htop`를 이용해서 리소스 모니터링도 가능하죠.

{{< figure src="/images/post/colab_vscode/Untitled_11.png" >}}

여기까지 Colab x VSCode 포스팅입니다. 뭐....어떤 면에선 편할 것 같지만 막...편할 것 같진 않네요. 

아직 이 상황을 겪지 않아서 모르겠지만 원래 코랩의 큰 문제가 있죠. Session timeout.... 

일정 시간동안 동작이 없으면 연결이 끊겨서 다시 실행을 시켜야하는....상황이 오죠.

{{< figure src="/images/post/colab_vscode/Untitled_12.png" >}}

나한테 왜 그래...

그 상황이 왔을 때 느낌으로는 VSCode의 SSH 접속이 끊길 것 같네요. 흠.... 실험 후에 추가로 적어 보겠습니다.


## P.S

끊겼습니다. 


{{< figure src="https://github.com/jjerry-k/jjerry-k.github.io/blob/master/public/img/colab_vscode/Untitled_13.png?raw=true" >}}


VSCode 를 봐도..

{{< figure src="https://github.com/jjerry-k/jjerry-k.github.io/blob/master/public/img/colab_vscode/Untitled_14.png?raw=true" >}}


그렇습니다. 제 생각대로 Colab의 Session time이 끝나면...끊기네요..ㅎㅎ
편하게 쓰기는 힘들 듯...