---
title: (개인적으로) 무.조.건 설치하는 Anaconda 패키지
date: 2019-06-30T18:30:46+06:00
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

이번 포스팅은 제가 많이 쓰는 패키지들에 대해서 적어보려고 합니다.   
추후에 포맷하고 다시 세팅할 수도 있으니까....  
저는 Anaconda가 아닌 **Miniconda**를 사용하기 때문에 어지간하면 하나 하나 설치를 해줘야해요. 
물론 머리로는 기억하고 있지만 커맨드 쓰기가 귀찮으니...적어놓으려고 합니다!  
각각 설명은...생략할거에요. 보시는 분들 구글링 실력을 믿습니다.  

#### Scientific uses
- numpy, scipy, pandas 
- `conda install numpy scipy pandas`

#### Visualization
- matplotlib, seaborn
- `conda install matplotlib seaborn`
  
#### Image Processing
- pillow, scikit-image, opencv
- `conda install pillow scikit-image opencv`
 
#### ML & DL 
- scikit-learn, tensorflow, pytorch (keras도 썼었는데...이번에 뺐어요..)
- `conda install scikit-learn tensorflow`
- `conda install -c pytorch pytorch torchvision`

#### Medical Image Processing
- pydicom, nibabel, simpleitk
- `conda install -c conda-forge pydicom nibabel`
- `conda install -c SimpleITK SimpleITK`
  
#### Tools
- tqdm, jupyter, jupyter-lab
- `conda install  tqdm jupyter jupyterlab`


이....정도네요!  
솔직히 제가 이렇게 포스팅을 하는 이유는....  
이미 제 노트북을...한번 갈아엎었습니다...  
conda 를 4.7.5 로 올리는 순간...모든게 날아갔거든요.  
하...얼른 세팅하러 갑니다..


 **P.S** conda 를 조심하세요...