---
title: Python으로 NIfTI 영상을 읽어보자!
date: 2019-01-23T18:30:46+06:00
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

거의 한달 반...만에 글을 씁니다..!  
이번에는 Python에서 [NIfTI](https://nifti.nimh.nih.gov/) 포맷의 데이터를 load 하는 방법에 대한 포스팅을 해보려고 합니다.  
저는 Anaconda를 사용중이기에..제 사용환경에 맞게 설명을 하겠습니다.  

가장 먼저 관련 패키지인 [`Nibabel`](http://nipy.org/nibabel/) 을 설치를 해줍니다.  
 

``` bash
conda install -c conda-forge nibabel
```

이러면 설치는 끝입니다.

``` python

import nibabel as nib
from matplotlib import pyplot as plt

data = nib.load(".nii 경로")
img = data.get_data()

#plt.imshow(img)# 슬라이스 1장일 경우
plt.imshow(img[:,:,"slice 번호"])
plt.show()
```
 
 이런 식으로 작성하시면 됩니다. 

 예시를 보여드리면

{{< figure src="/images/post/nifti/01.png" >}}

이렇습니다!

 추후엔 DICOM 다루는 법에 대해서 업로드 해보겠습니다!