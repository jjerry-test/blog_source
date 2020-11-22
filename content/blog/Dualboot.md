---
title: Windows 10 & Ubuntu 16.04 듀얼부팅
date: 2016-08-16T18:30:46+06:00
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
  - "Setting"

# post type
type: "post"
---

Deep Learning을 하기 위해 windows를 사용할 수도 있겠지만...  
저는 Ubuntu를 사용하기로 했습니다. 왜냐하면 Ubuntu로 배웠으니..ㅎㅎ  
자, 그럼 시작하겠습니다 .  
제가 예전에 16.04를 다운받아서 설치한거라..  
다운로드는 16.04.1로 되어있는데 설치는 16.04로 되어있습니다.  
하지만 설치 방법은 똑같음!  
그리고 듀얼부팅은 Windows가 먼저 설치되어야 한다는거 잊지마세요.  

## 1. 설치 전에 확일 해야할 사항
- BIOS에서 secure booting disable
- Windows 에서 빠른 시작 켜기 옵션 끄기

{{< figure src="![image](/images/post/dualboot/01.jpeg)" >}}

{{< figure src="![image](/images/post/dualboot/02.jpeg)" >}}

{{< figure src="![image](/images/post/dualboot/03.jpeg)" >}}

{{< figure src="![image](/images/post/dualboot/04.jpeg)" >}}

#### 1.1 설치 할 디스크 볼륨 만들기

{{< figure src="![image](/images/post/dualboot/05.jpeg)" >}}

저는 HDD에 설치할 거니까 HDD 주 파티션에서 마우스 오른쪽 클릭!

{{< figure src="![image](/images/post/dualboot/06.jpeg)" >}}

볼륨을 축소합시다.

{{< figure src="![image](/images/post/dualboot/07.jpeg)" >}}

원하시는 만큼 입력하세요.
102,400 MB는 예시일뿐...

{{< figure src="![image](/images/post/dualboot/08.jpeg)" >}}

할당되지 않은 부분이 100GB 생겼네요!

{{< figure src="![image](/images/post/dualboot/09.jpeg)" >}}

## 2. Ubuntu 설치 과정

#### 2.1 Ubuntu 16.04.1 LTS image Download

[http://www.ubuntu.com/download/desktop](http://www.ubuntu.com/download/desktop)에 들어갑니다.

{{< figure src="![image](/images/post/dualboot/10.jpeg)" >}}

Download를 클릭하면 다음 사진과 같이 나오는데 흠...잘 모르겠습니다.  
후원..같지만 'Not now, take me to the download'를 클릭합니다.

{{< figure src="![image](/images/post/dualboot/11.jpeg)" >}}

다운로드 창이 자동으로 나옵니다.   
저장할 경로 지정해주세요!

{{< figure src="![image](/images/post/dualboot/12.jpeg)" >}}

#### 2.2 Ubuntu 16.04.1 LTS 부팅 디스크 만들기

[https://rufus.akeo.ie](https://rufus.akeo.ie)에서 util을 받습니다.

{{< figure src="![image](/images/post/dualboot/13.jpeg)" >}}

Util을 실행!  
처음으로 부팅 디스크로 쓸 USB를 선택합니다.

{{< figure src="![image](/images/post/dualboot/14.jpeg)" >}}

OS image를 불러와야겠죠?  
저~~기 아이콘 눌러주세요!

{{< figure src="![image](/images/post/dualboot/15.jpeg)" >}}

ISO 파일이 있는 곳으로 가서 선택하고 열기!

{{< figure src="![image](/images/post/dualboot/16.jpeg)" >}}

그리고 시작을 누릅니다!

{{< figure src="![image](/images/post/dualboot/17.jpeg)" >}}

구구절절... 구구절절... 'OK' 눌러주세요.

{{< figure src="![image](/images/post/dualboot/18.jpeg)" >}}

이런 경고는...저에게 통하지 않습니다..  
'확인'을 눌러주세요!

{{< figure src="![image](/images/post/dualboot/19.jpeg)" >}}

진행이 됩니다.

{{< figure src="![image](/images/post/dualboot/20.jpeg)" >}}

되고 있는...건가..?

{{< figure src="![image](/images/post/dualboot/21.jpeg)" >}}

6분 36초 정도 걸렸네요..

{{< figure src="![image](/images/post/dualboot/22.jpeg)" >}}

그럼 이제 설치를 해보겠습니다.


#### 2.3 Ubuntu 설치하기

BIOS 세팅에서 부팅 순서를 USB로 바꿔주시거나  
Boot Option에서 USB를 선택해서 부팅합니다.  
검은 화면이 나오면서 'Try Ubuntu without installing', 'Install 어쩌고...' 등이 있는데요.  
저는 스크린샷을 해야하므로 'Try Ubuntu without installing' 을 선택했습니다.  
'또로롱'하면서 화면이 뜹니다!

{{< figure src="![image](/images/post/dualboot/23.jpeg)" >}}

바탕화면에 'Install Ubuntu 16.04 LTS' 실행합니다.    
디렉토리 이름이 영어인게 좋으니까 일단 English로 진행.

{{< figure src="![image](/images/post/dualboot/24.jpeg)" >}}

설치하면서 업데이트, 다른 소프트웨어 설치 여부는..마음대로...

{{< figure src="![image](/images/post/dualboot/25.jpeg)" >}}

설치 방식에 대한 옵션이 나옵니다.  
'Something else'를 선택해주세요.  
그래야 더 안심하고 설치하니까요...

{{< figure src="![image](/images/post/dualboot/26.jpeg)" >}}

윈도우에서 파티션을 나눴었죠.  
저는 SSD에 윈도우, HDD에 우분투를 설치할 것이니..  
HDD 파티션을 나눠놨었습니다.  
얼마나 나눌건지는..여러분 마음...
전 64GB 정도 나눴습니다. (100GB 뺐다가 다시 줄임...)
'free space'를 선택하고 왼쪽 아래에 '+'버튼을 눌러주세요.

{{< figure src="![image](/images/post/dualboot/27.jpeg)" >}}

먼저 Swap 파티션부터 만들죠.  
자신의 RAM 용량과 똑같이 맞추라는 분도 계시고  
요즘은 RAM 용량이 다 커서 필요없다는 분도 계셔서  
저는 그 중간인 8GB를 Swap으로 만들었습니다.  
설정법은 아래 사진과 같이!  
그리고 'OK'를 누릅시다.

{{< figure src="![image](/images/post/dualboot/28.jpeg)" >}}

아래 사진과 같이 swap 영역이 unknown으로 만들어집니다.  
이제 Ubuntu 파티션을 만들어보죠.  
똑같이 'free space' 를 선택하고 '+' 버튼을 눌러줍니다.

{{< figure src="![image](/images/post/dualboot/29.jpeg)" >}}

'Size'에는 남은 용량을 다 씁니다.  
나머지는 아래 사진과 같이 설정 !  
그리고 'OK'를 누릅시다.

{{< figure src="![image](/images/post/dualboot/30.jpeg)" >}}

이제 Boot loader 경로를 지정해야하는데요.  
아랫 부분에 'Device for boot loader installation'에서   
디스크를 선택하면 됩니다.   
SSD에 지정을 하시기도 하지만 저는 HDD 지정을 했습니다.  
그리고 'Install Now'을 클릭합니다.

{{< figure src="![image](/images/post/dualboot/31.jpeg)" >}}

디스크가 변경됩니다. 뭐 이런 내용이 뜨는데  
그냥. 조용히. 살포시.  
'Continue' 를 눌러줍시다.  
(불안하시면 다시 확인 하시구요..)  

{{< figure src="![image](/images/post/dualboot/32.jpeg)" >}}

위치 설정하시구요!

{{< figure src="![image](/images/post/dualboot/33.jpeg)" >}}

키보드 설정은 그냥 영어로 놔두세요.    
나중에 설치 후에 설정 할겁니다!

{{< figure src="![image](/images/post/dualboot/34.jpeg)" >}}

계정 설정을 합니다!  
저는 Jerry니까... 우분투 계정도 Jerry.

{{< figure src="![image](/images/post/dualboot/35.jpeg)" >}}

설치 시작!!

{{< figure src="![image](/images/post/dualboot/36.jpeg)" >}}

그저... 기다림...

{{< figure src="![image](/images/post/dualboot/37.jpeg)" >}}

{{< figure src="![image](/images/post/dualboot/38.jpeg)" >}}

설치가 완료되었습니다!  
과감히 바로 'Restart Now'를 클립했습니다.

{{< figure src="![image](/images/post/dualboot/39.jpeg)" >}}


첫 포스팅이라 굉장히 난잡하고 스크롤이 촤라라라락하네요...  
좀 더 정리해서 쓰는 습관을 들여야지...  


Ubuntu를 접하게 되면서 굉장히 다사다난한 경험을 하는 저와 제 노트북....  
어쩌면 조만간 Windows 와 Ubuntu를 재설치 할 수도 있을 듯합니다..  
다음 포스팅은 설치 후 세팅에 관련하여 하겠습니다!
