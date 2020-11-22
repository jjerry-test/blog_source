---
title: Markdown 사용법
date: 2018-10-19T18:30:46+06:00
draft: false

#post thumb
image: #"images/featured-post/post-1.jpg"

# meta description
description: "this is meta description"
math: true

# taxonomies
categories:
  - "Blog"
tags:
  - "Markdown"

# post type
type: "post"
---


Markdown은 2004년 존그루버에 의해 만들어졌으며 쉽게 쓰고 읽을 수 있으며 HTML로 변환이 가능한 텍스트 기반의 마크업언어입니다. 특수기호와 문자를 이용한 매우 간단한 구조의 문법을 사용하여 웹에서도 빠르게 컨텐츠를 작성하고 직관적으로 인식할 수 있습니다. Github을 사용하는 사람이라면 가장 먼저 만나게 되는 파일이 README.md 파일인데요. 이 파일도 Markdown으로 작성된 파일입니다. 마크다운을 통해서 설치방법, 소스코드 설명, 이슈 등을 간단하게 기록하고 가독성을 높일 수 있어서 많은 사람들이 사용하게 되었습니다!


## Table of contents

- [기본 사용법](#%ea%b8%b0%eb%b3%b8-%ec%82%ac%ec%9a%a9%eb%b2%95)
  - [Headings](#headings)
- [h1 Heading](#h1-heading)
  - [h2 Heading](#h2-heading)
    - [h3 Heading](#h3-heading)
      - [h4 Heading](#h4-heading)
        - [h5 Heading](#h5-heading)
          - [h6 Heading](#h6-heading)
  - [Paragraphs](#paragraphs)
  - [Newline](#newline)
  - [Horizontal Line](#horizontal-line)
  - [Emphasis](#emphasis)
    - [Bold](#bold)
    - [Italics](#italics)
  - [Blockquotes](#blockquotes)
  - [Lists](#lists)
    - [Unordered](#unordered)
    - [Ordered](#ordered)
    - [Time-saving Tip](#time-saving-tip)
  - [Code](#code)
    - [Inline code](#inline-code)
    - ["Fenced" code block](#%22fenced%22-code-block)
    - [Indented code](#indented-code)
    - [Syntax highlighting](#syntax-highlighting)
  - [Links](#links)
    - [Autolinks](#autolinks)
    - [Inline links](#inline-links)
  - [Images](#images)
  - [Raw HTML](#raw-html)
  - [Escaping with backslashes](#escaping-with-backslashes)
- [그 외 사용법](#%ea%b7%b8-%ec%99%b8-%ec%82%ac%ec%9a%a9%eb%b2%95)
  - [Strikethrough](#strikethrough)
  - [Tables](#tables)
    - [Aligning cells](#aligning-cells)

# 기본 사용법


## Headings

Heading 은 `h1` 부터 `h6` 까지 있고 `#` 의  개수로 단계가 정해집니다.

사용법 :

```
# h1 Heading
## h2 Heading
### h3 Heading
#### h4 Heading
##### h5 Heading
###### h6 Heading
```

적용 후 :

# h1 Heading
## h2 Heading
### h3 Heading
#### h4 Heading
##### h5 Heading
###### h6 Heading

---
## Paragraphs

문단을 나누는 법입니다. 문단 사이에는 하나 이상의 빈 줄로 구분됩니다.

사용법 :

```
<p>이 문장은 첫번째 문단의 첫번째 문장입니다.</p>
<p>이 문장은 두번째 문단의 첫번째 문장입니다. 이 문장은 두번째 문단의 두번째 문장입니다.</p>
```


적용 후 :

<p>이 문장은 첫번째 문단의 첫번째 문장입니다.</p>
<p>이 문장은 두번째 문단의 첫번째 문장입니다. 이 문장은 두번째 문단의 두번째 문장입니다.</p>

---

## Newline

`공백 두칸 후 엔터`, `<br>`을 이용하여 개행을 할 수 있습니다.  
(`<br>`은 굳이....)

사용법 :

```
test1`공백 두칸 후 엔터`
test2

test1<br>test2
```

적용 후 :

test1  
test2

test1<br>test2

## Horizontal Line

Markdown 문서에 수평선을 추가 할 수 있습니다.

사용법 :
```
`___`: 밑줄(_) 3개

`---`: 대쉬(-) 3개

`***`: 별표(*) 3개
```

적용 후 :

___

---

***

---

## Emphasis

### Bold

볼드체 적용도 가능합니다.

```
**이렇게 하면 볼드체!**
```

적용 후 :

**이렇게 하면 볼드체!**


### Italics

이텔릭체 적용도 가능합니다.

```
_이렇게 하면 이텔릭체!_
```

적용 후 :

_이렇게 하면 이텔릭체!_

---

## Blockquotes

블럭인용은 `>` 으로 합니다.  
Heading과 처럼 `>` 개수로 인용 안에 인용을 추가 할 수 있습니다.

사용법 :

```
> 이것은 인용구에요.
```

적용 후 :

> 이것은 인용구에요.


다중 인용 사용법 :

```
> 이것은 첫번째 인용이에요.
>> 이것은 두번째 인용이에요.
>>> 이것은 세번째 인용이에요.
```

적용 후 :

> 이것은 첫번째 인용이에요.
>> 이것은 두번째 인용이에요.
>>> 이것은 세번째 인용이에요.

---

## Lists

목록에는 순서가 없는 목록, 순서가 있는 목록이 있습니다.

### Unordered

순서가 없는 목록은 `*`, `-`, `+` 로 사용할 수 있습니다.

사용법 :

```
+ 음식
+ 가구
+ 운동
  - 농구
  - 축구
  - 야구
```
적용 후 :

+ 음식
+ 가구
+ 운동
  - 농구
  - 축구
  - 야구

또한 다음과 같이 사용할 수 있습니다.  

사용법 :

```
- 신체
  - 머리
  - 상체
  - 하체
```

적용 후:

- 사람
  - 머리
    - 눈
    - 코
    - 입
  - 상체
  - 하체

- 개미
  - 머리
  - 가슴
  - 배


### Ordered

순서가 있는 목록을 만들 때는 번호를 매기면 됩니다.

```
1. 노트북을 켠다.
2. Atom 에디터를 켠다.
3. 프로젝트 폴더를 연다.
4. 코딩을 한다.
```
적용 후 :

1. 노트북을 켠다.
2. Atom 에디터를 켠다.
3. 프로젝트 폴더를 연다.
4. 코딩을 한다.



### Time-saving Tip

순서가 있는 목록에서 시간을 아끼는 방법입니다.  
`1.`, `2.`,... 라고 적을 필요 없이 `1.` 만 적으면 자동으로 번호를 매깁니다.


```
1. 노트북을 켠다.
1. Atom 에디터를 켠다.
1. 프로젝트 폴더를 연다.
1. 코딩을 한다.
```

적용 후 :

1. 노트북을 켠다.
1. Atom 에디터를 켠다.
1. 프로젝트 폴더를 연다.
1. 코딩을 한다.

---

## Code

### Inline code

문장 중간에 <code>` `</code>를 이용하여 code를 넣을 수 있습니다.

```
파이썬에서 모듈을 쓰려면 `import '모듈명'` 이라고 하면 됩니다.
```

적용 후 :

파이썬에서 모듈을 쓰려면 `import '모듈명'` 이라고 하면 됩니다.



### "Fenced" code block

code block을 만들어서 code를 넣을 수 있습니다.

<pre>
```python
import os
import sys
```
</pre>

적용 후 :

```python
import os
import sys
```



### Indented code

들여쓰기(공백 4개)를 이용하여 code를 쓸 수 있습니다.  
하지만 별로 추천하는 방법은 아닙니다.  
왜냐하면 **syntax highlighting**이 안됩니다.

```
    import sys
    impot os
```

적용 후 :

    import sys
    impot os




### Syntax highlighting

"Fenced" code block 은 어떤 프로그래밍 언어의 code block 을 만들건지 적어서 사용을 합니다.  
그러면 그 언어에 맞게 Syntax highlighting을 합니다.

<pre>
```python
import os
import sys

a = 2
b = 5

print("Hello, World!")
print(a + b)
```
</pre>

Which renders to:

```python
import os
import sys

a = 2
b = 5

print("Hello, World!")
print(a + b)
```

---

## Links

링크를 거는 방법은 `Autolinks`, `Inline links`, `Link titles`, 'Named Anchors' 이렇게 네 가지가 있습니다.  
이 포스팅에선 `Autolinks`, `Inline links` 이 두 가지를 설명하겠습니다.

### Autolinks

`<`, `>` 사이에 링크를 적으면 자동으로 링크가 생성됩니다.

```
<https://jjerry-k.github.io>
```

적용 후 :

<https://jjerry-k.github.io>


### Inline links

문장 안에 링크를 생성할 수 있습니다.

```
[Jerry's Blog](https://jjerry-k.github.io)
```

적용 후 :

[Jerry's Blog](https://jjerry-k.github.io)

---

## Images

이미지를 올리는 방법입니다.

```
첫번째 방법
![Minion](http://octodex.github.com/images/minion.png)
```

적용 후 :

![Minion](http://octodex.github.com/images/minion.png)


```
두번째 방법
![Alt text](http://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")
```

적용 후 :

![Alt text](http://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")

위 두 방법은 이미지 사이즈 조절을 할 수 없습니다.  
만약 사이즈 조절이 필요하다면 `<img src="" height="" width="">를 이용하면 됩니다.`

```
<img src="http://octodex.github.com/images/dojocat.jpg" height="100" width="100">
```

적용 후 :
<img src="http://octodex.github.com/images/dojocat.jpg" height="100" width="100">

---

## Raw HTML

이미지에서 HTML 문법을 쓸 수 있다는걸 확인했다시피 Markdown 에서 HTML 문법을 사용할 수 있습니다.

```
여기가 **<a href="https://jjerry-k.github.io">Jerry의 블로그</a>**입니다.

여기가 **[Jerry의 블로그](https://jjerry-k.github.io)**입니다.
```

적용 후 :

여기가 <a href="https://jjerry-k.github.io">**Jerry의 블로그**</a>입니다.

여기가 [**Jerry의 블로그**](https://jjerry-k.github.io)입니다.

---

## Escaping with backslashes

`\` 를 이용하여 문장안에 기호를 사용할 수 있습니다.


```
\*를 문장에 쓰고 싶다!
```

적용 후 :

\*를 문장에 쓰고 싶다!

---

# 그 외 사용법


## Strikethrough

문장에 줄을 그을 수 있습니다.

```
~~블로그....귀찮다....~~
```

적용 후 :

~~블로그....귀찮다....~~

---

## Tables

표를 만들 수 있습니다.
`|`, `-`를 이용하여 작성합니다.



```
| 이름 | 학점 |
| --- | --- |
| 제리 |  B+ |
|  톰  | C+ |
|스파이크| B0 |
```

적용 후 :

| 이름 | 학점 |
| --- | --- |
| 제리 |  B+ |
|  톰  | C+ |
|스파이크| B0 |


### Aligning cells

셀 정렬은 `:`를 이용합니다.  
왼쪽 정렬은 `:`을 사용하지 않으면 됩니다.

**Center text in a column**

중앙 정렬은 다음과 같이 합니다.

```
| 이름 | 학점 |
| :-: | :-: |
| 제리 |  B+ |
|  톰  | C+ |
|스파이크| B0 |
```

| 이름 | 학점 |
| :-: | :-: |
| 제리 |  B+ |
|  톰  | C+ |
|스파이크| B0 |


**Right-align the text in a column**

오른쪽 정렬은 다음과 같이 합니다.

```
| 이름 | 학점 |
| --: | --: |
| 제리 |  B+ |
|  톰  | C+ |
|스파이크| B0 |
```

적용 후 :

| 이름 | 학점 |
| --: | --: |
| 제리 |  B+ |
|  톰  | C+ |
|스파이크| B0 |


Markdown 설명에 대한 포스팅... **끝!**
