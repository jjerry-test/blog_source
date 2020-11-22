---
title: Seaborn Tutorial Part 1-A
date: 2019-05-09T18:30:46+06:00
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

# Index
- [Index](#index)
  - [A. Visualizing statistical relationships](#a-visualizing-statistical-relationships)
    - [Relating variables with scatter plots](#relating-variables-with-scatter-plots)
    - [Emphasizing continuity with line plots](#emphasizing-continuity-with-line-plots)
      - [Aggregation and representing uncertainty](#aggregation-and-representing-uncertainty)
      - [Plotting subsets of data with semantic mappings](#plotting-subsets-of-data-with-semantic-mappings)
      - [Plotting with date data](#plotting-with-date-data)
    - [Showing multiple relationships with facets](#showing-multiple-relationships-with-facets)


## A. Visualizing statistical relationships
Relationships 시각화에선 `relplot()` 이라는걸 주로 사용합니다. 
`relplot()` 에는 `kind`라는 옵션으로 `scatter`, `line` 을 그릴 수 있습니다.  
일단! 다음과 같이 기본적인 패키지를 import 하고 진행하겠습니다! 
``` python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style="darkgrid") # 추후 Part 3 에서 다룰 내용!
```  

### Relating variables with scatter plots
Scatter plot을 해볼겁니다!  
`scatterplot()`을 사용해도 되지만 `relplot()`을 사용해서 그려보겠습니다.  
가장 먼저 ... 사용할 데이터를 읽어오겠습니다. 
``` python
tips = sns.load_dataset("tips")
tips.head(5)
```  
위를 실행하면 다음 사진과 같이 출력이 나옵니다.  
{{< figure src="/images/post/sb_part1a/001.png" >}}
정확히 무슨 데이터인지는 모르겠지만... 어떤 가게의 가계부...? 같습니다.
총 금액, 팁, 성별, 흡연 여부, 요일, 시간대, 크기(...?) 등의 카테고리가 있네요.  
그럼 한번 plot 해보겠습니다.  
``` python
sns.relplot(x="total_bill", y="tip", data=tips);
```  
{{< figure src="/images/post/sb_part1a/002.png" >}}

다음과 같은 figure가 나오네요!  
x, y, data에 들어간 의미를 알아볼까요?
`x=` 는 x축을 어떤 데이터로 할지 정하는 부분입니다.
`y=` 는 당연히 y축이겠죠?
`data=` 는 어떤 data를 plot에 사용할지 적는 부분입니다.  
그래서 plot하는 코드를 풀어서 얘기해보자면  
`tips`라는 DataFrame에서 `total_bill`을 x축으로 `tip`을 y축으로 골라서 scatter plot 하라는 얘기입니다.  
좀 더 해볼까요?  
``` python
sns.relplot(x="total_bill", y="tip", hue="smoker", data=tips);
```  
{{< figure src="/images/post/sb_part1a/003.png" >}}

`x, y, data`는 위랑 다를게 없는데... `hue`라는 옵션이 추가가 되었습니다.  
`hue='smoke'`라고 흡연 여부에 대해 색상으로 표시를 해줍니다!


하나 또 있습니다. 
``` python
sns.relplot(x="total_bill", y="tip", hue="smoker", style="smoker", data=tips);
```  
{{< figure src="/images/post/sb_part1a/004.png" >}}

`style` 옵션이 추가되었어요!
`style='smoker'`를 추가해주면서 plot 스타일이 추가되었네요!  
다음 사진은 `style="time"` 옵션을 준거에요!  
{{< figure src="/images/post/sb_part1a/005.png" >}}

**색으로는 흡연여부**를 표시하고 **plot 스타일로는 시간대**를 표시해주네요!  

자, `hue` 옵션의 또 다른 예시입니다.  

```python
sns.relplot(x="total_bill", y="tip", hue="size", data=tips);
```  
{{< figure src="/images/post/sb_part1a/006.png" >}}

이전 예시에선 **Yes** or **No** 였죠.  
이번 수치에 대해 색별로 의미를 줬습니다!  
다음과 같이 `pallette` 옵션을 줘서 색을 바꿀 수도 있어요!  
`pallette`에 대한 자세한건 **Part 3** 에서 다루겠습니다.
```python
sns.relplot(x="total_bill", y="tip", hue="size", palette="ch:r=-.5,l=.75", data=tips);
```  
{{< figure src="/images/post/sb_part1a/007.png" >}}

오...scatter plot의 끝이 보여요...  
`size` 옵션입니다.

```python
sns.relplot(x="total_bill", y="tip", size="size", data=tips);
```  
{{< figure src="/images/post/sb_part1a/008.png" >}}

`size="size"`라고 옵션을 줬어요!  
plot의 크기에 따라 의미가 나뉘어졌습니다!  
다음고 같이 `sizes`를 이용해서 크기 범위를 정해줄수도 있네요!

```python
sns.relplot(x="total_bill", y="tip", size="size", sizes=(15, 200), data=tips);
```  
{{< figure src="/images/post/sb_part1a/009.png" >}}


### Emphasizing continuity with line plots

이 파트는 연속적인 값을 가진 데이터에 대한 plot입니다.  
다음과 같이 DataFrame을 하나 만들어 봅시다!

```python
df = pd.DataFrame(dict(time=np.arange(500), value=np.random.randn(500).cumsum()))
df.head(5)
```
{{< figure src="/images/post/sb_part1a/010.png" >}}

결과는 사진과 다를 수 있어요!  
time, value 를 가지고 있다는 거에 초점을 맞추시면 됩니다!  
일별로 뭔가 값이 들어가 있네요.  
이를 `relplot()` 을 이용하여 그려보겠습니다.
`kind` 옵션에 `"line"` 라고 주면 됩니다!  
`autofmt_xdata()` 라는건 이름에서 유추할 수 있듯이 x 축 레이블을 데이터에 맞게 format을 자동으로 맞춰주는거에요!  
지금은 x 축이 날짜니까 날짜에 대해선 x 축 레이블을 살짝쿵 기울인거에요!  
이걸 쓰지 않으면 날짜가 겹쳐질거에요...(한번 해보세요..)

```
g = sns.relplot(x="time", y="value", kind="line", data=df)
g.fig.autofmt_xdate()
```
{{< figure src="/images/post/sb_part1a/011.png" >}}

위 예시는 x 축이 연속적이지만 시계열 데이터였습니다!  
만약 연속적이지만 이동경로와 같이 x, y 축 좌표만 가진 데이터라면?  
예시를 들어볼게요! 다음과 같이 x, y 에 대한 데이터를 만듭니다.
```python
df = pd.DataFrame(np.random.randn(500, 2).cumsum(axis=0), columns=["x", "y"])
df.head(5)
```
{{< figure src="/images/post/sb_part1a/012.png" >}}

이런 위치에 대한 데이터는 `sort = False` 옵션을 줘야합니다!  
그렇지 않으면 .... x 데이터를 자동으로 sorting 해서 plot 해버립니다..

```python
sns.relplot(x="x", y="y", sort=False, kind="line", data=df);
```
{{< figure src="/images/post/sb_part1a/013.png" >}}

#### Aggregation and representing uncertainty

이 파트는 집계 및 신뢰구간 표시에 대한 설명입니다.  
**seaborn**은 기본 값으로 95% 신뢰구간을 표시해준다고 하녜요!  
다음과 같이 데이터를 load 해줍니다!  

```python
fmri = sns.load_dataset("fmri")
fmri.head(5)
```
{{< figure src="/images/post/sb_part1a/014.png" >}}

fmri data 군요! 일단 무슨 의미인지 잘 모르겠습니다!  
각 환자별로 timepoint 를 가지고 signal을 가지는건 알겠네요..  
이 데이터를 이용해 다음과 같이 plot을 해봅시다!  
뭔가 선이랑 범위(?)로 보이는 불투명한 부분이 생겼습니다!  
선은 해당 timepoint 에서 signal 의 mean 값이고 불투명한 부분은 신뢰구간을 의미합니다!  

```python
sns.relplot(x="timepoint", y="signal", kind="line", data=fmri);
```
{{< figure src="/images/post/sb_part1a/015.png" >}}

>> "그럼...이런 데이터는 항상 신뢰구간을 같이 봐야하는가?"  

아닙니다. `ci`(Confidence Intervals) 옵션을 바꿔주면 됩니다!  
`ci=None` 이라고 옵션을 주고 plot을 하면 신뢰구간이 표현이 안됩니다!  

```python
sns.relplot(x="timepoint", y="signal", ci=None, kind="line", data=fmri);
```
{{< figure src="/images/post/sb_part1a/016.png" >}}

또 다른 옵션이 있습니다.  
데이터가 매우 큰 경우! `ci` 옵션에 표준 편차를 넣어주면 각 timepoint 에서 분산을 표현해줍니다!  

```python
sns.relplot(x="timepoint", y="signal", kind="line", ci="sd", data=fmri);
```
{{< figure src="/images/post/sb_part1a/017.png" >}}

마지막으로... 이런 집계말고 정말 원본 그대로 plot 해보고 싶다면!  
`estimator=None`이라고 주면 됩니다.  

```python
sns.relplot(x="timepoint", y="signal", estimator=None, kind="line", data=fmri);
```
{{< figure src="/images/post/sb_part1a/018.png" >}}

#### Plotting subsets of data with semantic mappings

이 파트에선 `relplot()` 을 이용해서 scatter plot, line plot을 동시에 표현합니다.  
데이터는 위 파트에서 썼던 **fmri** 데이터를 사용합니다!  
그리고 위 파트와 같이 `relplot(kind="line")`을 쓰지만 `hue="event"`라는 옵션을 주도록합니다!  
한번에 scatter plot과 line plot이 표현되네요!  

```python
sns.relplot(x="timepoint", y="signal", hue="event", kind="line", data=fmri);
```
{{< figure src="/images/post/sb_part1a/019.png" >}}

그럼...`style`도 추가해보도록 하죠!  
`hue="region", style="event"`라고 옵션을 줍니다!   
점점 표현해주는게 많아지죠?  

```python
sns.relplot(x="timepoint", y="signal", hue="region", style="event", kind="line", data=fmri);
```
{{< figure src="/images/post/sb_part1a/020.png" >}}

또한 선 스타일과 마커 옵션을 줄 수도 있어요!  
`dashes=False, markers=True`를 추가해보세요!  
점선이 모두 실선이 되었고 마커가 추가되었습니다!

```python
sns.relplot(x="timepoint", y="signal", hue="region", style="event", dashes=False, markers=True, kind="line", data=fmri);
```
{{< figure src="/images/post/sb_part1a/021.png" >}}

괜히 정보가 많아지면...해석이 겁나 어려워질 수 있습니다..  
다음과 같이 단순화하는게 좋을 때도 있습니다!  

```python
sns.relplot(x="timepoint", y="signal", hue="event", style="event", kind="line", data=fmri);
```
{{< figure src="/images/post/sb_part1a/022.png" >}}

필요에 따라 모든 샘플 각각을 plot 해야하기도 하죠..  
다음 예시는 `event`가 **stim** 인 데이터들을 **subject** 별로 plot을 합니다!  
(저 plot이 되는 방법은 추후에 좀 더 자세히 설명을 적을게요!)  

```python
sns.relplot(x="timepoint", y="signal", hue="region", units="subject", estimator=None, kind="line", data=fmri.query("event == 'stim'"));
```
{{< figure src="/images/post/sb_part1a/023.png" >}}

여기서는 Colormap을 조금씩 다뤄보는 구간입니다.  
다음과 같이 데이터를 load 합니다!  
(뭔지는 모르겠습니다...)

```python
dots = sns.load_dataset("dots").query("align == 'dots'")
dots.head(5)
```
{{< figure src="/images/post/sb_part1a/024.png" >}}

지금까지 해왔던거 처럼 plot을 해봅니다.

```python
sns.relplot(x="time", y="firing_rate", hue="coherence", style="choice", kind="line", data=dots);
```
{{< figure src="/images/post/sb_part1a/025.png" >}}

음....근데 위에 사진이 뭔가 부족하다고 느껴집니다.  
자세히 보시면 그려지는 실선, 점선은 각각 6개인데 표현된 색상은 4개네요...  
다음과 같이 작성하면 pallette를 custom하여 색상을 6개로 늘릴 수 있습니다!  

```python
palette = sns.cubehelix_palette(light=.8, n_colors=6)
sns.relplot(x="time", y="firing_rate",
            hue="coherence", style="choice",
            palette=palette,
            kind="line", data=dots);
```
{{< figure src="/images/post/sb_part1a/026.png" >}}

또는 다음과 같이 Colormap을 Normalization 할 수도 있죠!  

```python
from matplotlib.colors import LogNorm
palette = sns.cubehelix_palette(light=.7, n_colors=6)
sns.relplot(x="time", y="firing_rate",
            hue="coherence", style="choice",
            hue_norm=LogNorm(),
            kind="line", data=dots);
```
{{< figure src="/images/post/sb_part1a/027.png" >}}

아니면... 다음과 같이 `size`에 의미를 부여할 수도 있겠죠.  

```python
sns.relplot(x="time", y="firing_rate",
            size="coherence", style="choice",
            kind="line", data=dots);
```
{{< figure src="/images/post/sb_part1a/028.png" >}}

여기선 Colormap 변경이 주요 내용이였습니다.  
그럼 다음과 같이 Colormap도 주면서...`size`를 이용해서 의미를 부여하는 것도 가능하겠죠!?  

```python
sns.relplot(x="time", y="firing_rate",
           hue="coherence", size="choice",
           palette=palette,
           kind="line", data=dots);
```
{{< figure src="/images/post/sb_part1a/029.png" >}}


#### Plotting with date data

이전에 날짜 혹은 시간과 연관된 데이터를 사용할 경우 `autofmt_xdata()`라는 부분이 있었습니다.  
이는 x축 레이블의 format을 자동으로 맞춰주는 부분이라고 했었는데요.  
가령 포맷을 변경해야하는 상황이 발생한다면..?  
`matplotlib` 문서를 참고하여 변경하셔야합니다..  
왜냐하면 seaborn의 뼈대가 matplotlib 이니까요!  

```python
df = pd.DataFrame(dict(time=pd.date_range("2017-1-1", periods=500),
                       value=np.random.randn(500).cumsum()))
df.head(5)
```
{{< figure src="/images/post/sb_part1a/030.png" >}}

```python
g = sns.relplot(x="time", y="value", kind="line", data=df)
g.fig.autofmt_xdate()
```
{{< figure src="/images/post/sb_part1a/031.png" >}}


### Showing multiple relationships with facets

지금까지는 단 1개의 figure 만 plot 했습니다!  
하지만 보통..다수의 figure가 필요하죠..  
이번엔 그 부분에 대한 내용입니다.  
[`relplot()`](https://seaborn.pydata.org/generated/seaborn.relplot.html#seaborn.relplot)은 [FacetGrid](https://seaborn.pydata.org/generated/seaborn.FacetGrid.html#seaborn.FacetGrid) 기반이기 때문에 쉽게 가능합니다.  
"facet" 이라는 단어가 나올텐데요.  
이는 전체 figure 하나를 facet이라고 칭합니다.
다음과 같이 데이터를 load 하고 plot 해주세요!
`col="time"` 이라는 옵션을 추가함으로써 **Lunch**에 대한 figure와 **Dinner**에 대한 figure **두 개**가 plot 됩니다!  
여기선 1x2 facet 이라고 할 수 있어요!  

```python
tips = sns.load_dataset("tips")
tips.head(5)
sns.relplot(x="total_bill", y="tip", hue="smoker",
            col="time", data=tips);
```
{{< figure src="/images/post/sb_part1a/032.png" >}}

또한 다음과 같이 두 변수에 대해 figure를 나눌 수도 있습니다.  
`col="region", row="event"`라고 하면 **행**은 **"event"**를 기준으로 **열**은 **"region"**으로 총 4개가 plot 됩니다!  
이건 2x2 facet!  

```python
fmri = sns.load_dataset("fmri")
fmri.head(5)
sns.relplot(x="timepoint", y="signal", hue="subject",
            col="region", row="event", height=3,
            kind="line", estimator=None, data=fmri);
```
{{< figure src="/images/post/sb_part1a/033.png" >}}

**fmri** 데이터의 경우 여러 subject가 있었습니다.  
그 각각 subject 별로 figure를 만들고 싶을땐...?  
다음과 같이 작성합니다.  
`col="subject", col_wrap=5` 는 열을 **subject**를 기준으로 5개씩 끊어서 plot 하겠다는 의미입니다.  
`height`는 facet의 높이(인치)를 정합니다.  
`aspect`는 `height`에 맞춰 비율을 정하구요.  
그럼 총 14개의 figure가 plot되고 3x5 facet이 생성됩니다!  

```python
sns.relplot(x="timepoint", y="signal", hue="event", style="event",
            col="subject", col_wrap=5,
            height=3, aspect=.75, linewidth=2.5,
            kind="line", data=fmri.query("region == 'frontal'"));
```
{{< figure src="/images/post/sb_part1a/034.png" >}}


여기까지 Part 1의 A 내용이였습니다.  
그럼 "어떤 내용이 부족해요!", "이 내용 잘 모르겠어요!" 하는 부분을 남겨주시면 추가하도록 할게요!  
감사합니다!