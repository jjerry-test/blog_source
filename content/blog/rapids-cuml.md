---
title: RAPIDS APIs ( cuML )
date: 2020-08-20T18:30:46+06:00
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

어제는 [RAPIDS에 대한 소개와 RAPIDS APIs 중 cuDF 에 대한 예제에 대한 포스팅](https://jjerry-k.github.io/deeplearning/2020/08/19/rapids/)을 했습니다. 

오늘은 RAPIDS APIS 중 [cuML](https://docs.rapids.ai/api/cuml/stable/) 에 대한 예제 포스팅을 간.단.하.게 해보겠습니다.

비교를 위해 KNN Classifier를 준비하였고 성능 비교를 위해 [Scikit-learn](https://scikit-learn.org/stable/) 을 사용하였습니다. 

```python

# %%
# RAPIDS cuML kNN model
import time
import cudf, cuml
import pandas as pd
from cuml.neighbors import KNeighborsClassifier as cuKNeighbors
from sklearn.neighbors import KNeighborsClassifier as skKNeighbors

print("========================================")
print("========================================")
print("============= Using cuML ===============")
print("========================================")
print("========================================")

train = cudf.read_csv('./mnist/train.csv')
test = cudf.read_csv('./mnist/test.csv')

start = time.time()
model = cuKNeighbors(n_neighbors=7)
model.fit(train.iloc[:,1:785], train.iloc[:,0])
# y_hat = model.predict(test) # Exception occured (version 0.14.0) 
print(f"Elapsed Time: {time.time()-start}\n")


print("========================================")
print("========================================")
print("========== Using Scikit-learn ==========")
print("========================================")
print("========================================")

train = pd.read_csv('./mnist/train.csv')
test = pd.read_csv('./mnist/test.csv')

start = time.time()
model = skKNeighbors(n_neighbors=7)
model.fit(train.iloc[:,1:785], train.iloc[:,0])
# y_hat = model.predict(test)
print(f"Elapsed Time: {time.time()-start}")

```

``` bash

========================================
========================================
============= Using cuML ===============
========================================
========================================
Elapsed Time: 0.3921339511871338

========================================
========================================
========== Using Scikit-learn ==========
========================================
========================================
Elapsed Time: 23.88076663017273

```

Test 시 성능도 비교하려했으나 cuML 버전 에러로 인해 테스트는 못했습니다. 

그래도 fit 부분에서 매우 큰 차이를 보입니다!

역시나....GPU네요!


## P.S
- 너무 간단하게 테스트하는건가...