---
title: RAPIDS!!!
date: 2020-08-19T18:30:46+06:00
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

> RAPIDS is a suite of software libraries for executing end-to-end data science & analytics pipelines entirely on GPUs.

위 글은 [RAPIDS 공식 홈페이지](https://rapids.ai/index.html)에서 가져온 내용입니다. 

말 그대로 모든 과정을 GPU 에서 실행하도록 도와주는 라이브러리입니다. 

## PREREQUISITES

**GPU**

- NVIDIA Pascal™ or better with **[compute capability](https://developer.nvidia.com/cuda-gpus)** 6.0+

**OS**

- Ubuntu 16.04/18.04 or CentOS 7 with `gcc/++` 7.5+
- See [RSN 1](https://docs.rapids.ai/notices/rsn0001) for details on our recent update to `gcc/++` 7.5  RHEL 7 support is provided through CentOS 7 builds/installs

**Docker**

- Docker CE v19.03+ and **[nvidia-container-toolkit](https://github.com/NVIDIA/nvidia-docker#quickstart)**
- [Legacy Support](https://rapids.ai/start.html#-docker-container) - Docker CE v17-18 and [nvidia-docker2](https://github.com/NVIDIA/nvidia-docker/wiki/Installation-(version-2.0))

**CUDA & NVIDIA Drivers**

- One of the following supported versions: [10.0](https://developer.nvidia.com/cuda-10.0-download-archive) & v410.48+  [10.1.2](https://developer.nvidia.com/cuda-10.1-download-archive-update2) & v418.87+  [10.2](https://developer.nvidia.com/cuda-10.2-download-archive) & v440.33+

## RAPIDS APIs

- RAPIDS 에는 현재 5개의 라이브러리를 제공.
- **cuDF ( 요것이 Main )**
    - Python GPU DataFrame library
- cuML
    - a suite of libraries that implement machine learning algorithms and mathematical primitives functions
- cuGraph
    - a GPU accelerated graph analytics library
- nvStrings
    - a pandas-like API that will be familiar to data engineers & data scientists
- Cyber Log Accelerators(CLX)
    - a collection of RAPIDS examples for security analysts, data scientists, and engineers to quickly get started applying RAPIS and GPU acceleration to real-world cybersecurity use cases

## Installation Guide

[https://rapids.ai/start.html#get-rapids](https://rapids.ai/start.html#get-rapids)

### Anaconda or Miniconda

- 설치하는데 시간이 꽤나 오래 걸려요...

```bash
conda install -c rapidsai -c nvidia -c conda-forge \
    -c defaults rapids=0.14 python=3.7 cudatoolkit=10.1
# cudatoolkit은 사용하는 DL 프레임워크 호환성 고려하세요!
```

## Example

이번 포스팅에선 cuDF 에 대한 예제를 보여드리려 합니다. 

추가적으로 [Dask](https://dask.org/), [Dask-cuDF](https://github.com/rapidsai/dask-cudf) 라는 2개의 라이브러리를 사용합니다. 

먼저 사용할 Package 들을 import 해줍니다.

```python
import os

import numpy as np
import pandas as pd
import cudf
import dask_cudf
```

다음 예시는 pandas와 cudf 를 비교하는 예시입니다.

```python
# Series
s = pd.Series([1,2,3,None,4])
print("Pandas")
print(s)

gs = cudf.Series([1,2,3,None,4])
print("\ncuDF")
print(gs)

dask_gs = dask_cudf.from_cudf(gs, npartitions=2)

print("\nDask-cuDF")
print(dask_gs.compute())
```

```python
Pandas
0    1.0
1    2.0
2    3.0
3    NaN
4    4.0
dtype: float64

cuDF
0       1
1       2
2       3
3    null
4       4
dtype: int64

Dask-cuDF
0       1
1       2
2       3
3    null
4       4
dtype: int64
```

```python
# DataFrame 
pdf = pd.DataFrame({'a': list(range(20)), 'b': list(reversed(range(20))), 'c': list(range(20))})
print("\nPandas")
print(pdf.head(5))

gdf = cudf.DataFrame.from_pandas(pdf)
print("\ncuDF")
print(gdf.head(5))

dask_gdf = dask_cudf.from_cudf(gdf, npartitions=2)

print("\nDask-cuDF")
print(dask_gdf.compute().head(5))
```

```python
Pandas
   a   b  c
0  0  19  0
1  1  18  1
2  2  17  2
3  3  16  3
4  4  15  4

cuDF
   a   b  c
0  0  19  0
1  1  18  1
2  2  17  2
3  3  16  3
4  4  15  4

Dask-cuDF
   a   b  c
0  0  19  0
1  1  18  1
2  2  17  2
3  3  16  3
4  4  15  4
```

```python
# Sorting
print("\nPandas")
print(pdf.sort_values(by='b').head(5))

print("\ncuDF")
print(gdf.sort_values(by='b').head(5))

print("\nDask-cuDF")
print(dask_gdf.sort_values(by='b').compute().head(5))
```

```python
Pandas
     a  b   c
19  19  0  19
18  18  1  18
17  17  2  17
16  16  3  16
15  15  4  15

cuDF
     a  b   c
19  19  0  19
18  18  1  18
17  17  2  17
16  16  3  16
15  15  4  15

Dask-cuDF
     a  b   c
19  19  0  19
18  18  1  18
17  17  2  17
16  16  3  16
15  15  4  15
```

이번엔 큰 DataFrame을 만들어서 sorting 속도를 비교하는 코드입니다. 

```python
# %%
# Speed Test
num_element = 1000000
pdf = pd.DataFrame({'a': list(range(num_element)), 'b': list(reversed(range(num_element))), 'c': np.random.randint(0, 1200000, num_element)})
print(pdf.head(5))

gdf = cudf.DataFrame.from_pandas(pdf)
print(gdf.head(5))

dask_gdf = dask_cudf.from_cudf(gdf, npartitions=2)
print(dask_gdf.compute().head(5))
```

실행 속도는 ipython의 [timeit](https://ipython.readthedocs.io/en/stable/interactive/magics.html#magic-timeit) 이라는 magic function 을 이용하였습니다. 

```python
%%timeit
pdf.sort_values(by="c")

%%timeit
gdf.sort_values(by="c")

%%timeit
dask_gdf.sort_values(by="c").compute()

```

`num_element`를 바꿔가면서 테스트를 해봤습니다. 

```python
# num_element = 1000
448 µs ± 38.8 µs per loop (mean ± std. dev. of 7 runs, 1000 loops each)
2.84 ms ± 1.56 ms per loop (mean ± std. dev. of 7 runs, 100 loops each)
83.4 ms ± 47.7 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

# num_element = 10000
1.39 ms ± 42.8 µs per loop (mean ± std. dev. of 7 runs, 1000 loops each)
3.14 ms ± 1.99 ms per loop (mean ± std. dev. of 7 runs, 100 loops each)
89.9 ms ± 24.3 ms per loop (mean ± std. dev. of 7 runs, 10 loops each)

# num_element = 100000
13.8 ms ± 467 µs per loop (mean ± std. dev. of 7 runs, 100 loops each)
5.61 ms ± 2.55 ms per loop (mean ± std. dev. of 7 runs, 100 loops each)
116 ms ± 29.3 ms per loop (mean ± std. dev. of 7 runs, 10 loops each)

#num_element = 1000000
225 ms ± 31.4 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
8.17 ms ± 534 µs per loop (mean ± std. dev. of 7 runs, 100 loops each)
118 ms ± 27 ms per loop (mean ± std. dev. of 7 runs, 10 loops each)
```

적은 양에서는 CPU 가 더 빠르지만 점점 대규모로 늘어나니....GPU 가 빠르군요.

아! Dask_cuDF는 보통 multi gpu 일 때 사용하는데 제가 실험한 환경은 NIPA 수시 사용자...환경이라 V100 단일 환경이었습니다. 

그래서...dask_gdf 에 대한 속도는 믿지 마세요..

## P.S 
- 서터레스를 많이 받습니다. 
- 원인은....'그' 집회...