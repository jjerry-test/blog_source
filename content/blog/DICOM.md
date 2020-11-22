---
title: Python으로 DICOM 영상을 읽어보자!
date: 2019-07-06T18:30:46+06:00
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
  - "Usage"

# post type
type: "post"
---

예~~전에 [NIfTI](https://jjerry-k.github.io/python/2019/01/23/nifti/) 파일을 load 하는 방법을 올렸었습니다!   
이번에는 Python에서 [DICOM](https://www.dicomstandard.org) 포맷의 데이터를 load 하는 방법에 대한 포스팅을 해보려고 합니다.  
 

가장 먼저 관련 패키지인 [`Pydicom`](https://pydicom.github.io/pydicom/stable/index.html) 을 설치를 해줍니다.  
 

``` bash
conda install -c conda-forge pydicom
```

저번과 똑같이 단순한 설치방법!  

이제 코딩으로 읽어보겠습니다.  
예시 데이터로 다음 [링크](https://github.com/pydicom/pydicom/blob/master/pydicom/data/test_files/MR_small.dcm)에 있는 영상을 이용하였습니다.
``` python

import pydicom as di
from matplotlib import pyplot as plt

data = di.read_file(".dcm 경로")
#data = di.dcmread(".dcm 경로") # 편한거 쓰시면 됩니다.

img = data.pixel_array

plt.imshow(img) # 슬라이스 1장일 경우
#plt.imshow(img[:,:,"slice 번호"]) # 슬라이스가 여러 장일 경우
plt.show()
```
 
 이런 식으로 작성하시면 됩니다.  
 예시를 보여드리면

{{< figure src="/images/post/dicom/01.png" >}}

예시 영상이 좀 작네요...  
어쨌든 이런 식으로 읽습니다. 

흠....NIfTI와 DICOM을 했으니...다음엔 **Insight Meta-Image** 를 해보겠습니다!