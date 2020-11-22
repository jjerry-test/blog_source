---
title: MediaPipe - (1)
date: 2020-11-13T18:30:46+06:00
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

이번 포스팅에선 Google의 MediaPipe에 대해서 다뤄보려합니다. 

MediaPipe is a framework for building multimodal (eg. video, audio, any time series data), cross platform (i.e Android, iOS, web, edge devices) applied ML pipelines. With MediaPipe, a perception pipeline can be built as a graph of modular components, including, for instance, inference models (e.g., TensorFlow, TFLite) and media processing functions.

> MediaPipe란 multi modal, cross platform 을 구축하기위한 프레임워크입니다. MediaPipe를 사용하면 TensorFlow, TFLite 같은 inference model과 미디어 처리 기능들을 모듈형식으로 구축할 수 있습니다.

라고 적혀있는 듯합니다. 

그냥 간단히 말하면..

> 만들어 놓은거 있으니까 모바일, Edge device, Web 필요한 곳에 가져다 쓰세요.

그렇다면 써봐야죠.

먼저 지원하는 항목입니다. 

## Solution list

<div class="table-wrapper">
<table> <thead> <tr> 
<th style="text-align: left"><a href=""></a></th> 
<th style="text-align: center">Android</th> 
<th style="text-align: center">iOS</th> 
<th style="text-align: center">Desktop</th> 
<th style="text-align: center">Python</th> 
<th style="text-align: center">Web</th> 
<th style="text-align: center">Coral</th> </tr> </thead>
 <tbody> <tr> <td style="text-align: left"><a href="https://google.github.io/mediapipe/solutions/face_detection">Face Detection</a></td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> </tr> 
 <tr> <td style="text-align: left"><a href="https://google.github.io/mediapipe/solutions/face_mesh">Face Mesh</a></td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> </tr> 
 <tr> <td style="text-align: left"><a href="https://google.github.io/mediapipe/solutions/iris">Iris</a></td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> </tr> 
 <tr> <td style="text-align: left"><a href="https://google.github.io/mediapipe/solutions/hands">Hands</a></td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> </tr> 
 <tr> <td style="text-align: left"><a href="https://google.github.io/mediapipe/solutions/pose">Pose</a></td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> </tr> 
 <tr> <td style="text-align: left"><a href="https://google.github.io/mediapipe/solutions/hair_segmentation">Hair Segmentation</a></td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> </tr> 
 <tr> <td style="text-align: left"><a href="https://google.github.io/mediapipe/solutions/object_detection">Object Detection</a></td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">✅</td> </tr> 
 <tr> <td style="text-align: left"><a href="https://google.github.io/mediapipe/solutions/box_tracking">Box Tracking</a></td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> </tr> 
 <tr> <td style="text-align: left"><a href="https://google.github.io/mediapipe/solutions/instant_motion_tracking">Instant Motion Tracking</a></td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> </tr> 
 <tr> <td style="text-align: left"><a href="https://google.github.io/mediapipe/solutions/objectron">Objectron</a></td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> </tr> 
 <tr> <td style="text-align: left"><a href="https://google.github.io/mediapipe/solutions/knift">KNIFT</a></td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> </tr> 
 <tr> <td style="text-align: left"><a href="https://google.github.io/mediapipe/solutions/autoflip">AutoFlip</a></td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> </tr> 
 <tr> <td style="text-align: left"><a href="https://google.github.io/mediapipe/solutions/media_sequence">MediaSequence</a></td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> </tr> 
 <tr> <td style="text-align: left"><a href="https://google.github.io/mediapipe/solutions/youtube_8m">YouTube 8M</a></td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">✅</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> 
 <td style="text-align: center">&nbsp;</td> </tr> 
 </tbody> </table></div>



이번 포스팅에선 Face Mesh를 테스트 해보겠습니다. 

## 설치법

```bash
# mediapipe가 opencv 4.0.0 이하와 호환이래요..
pip install mediapipe opencv-python==3.4.11.45
```

...? 겁나...간단합니다.

## 실행 코드

```python
import cv2 as cv
import mediapipe as mp
mp_drawing = mp.solutions.drawing_utils
mp_face_mesh = mp.solutions.face_mesh

face_mesh = mp_face_mesh.FaceMesh(
    min_detection_confidence=0.5, min_tracking_confidence=0.5)
drawing_spec = mp_drawing.DrawingSpec(color=(128,128,128), thickness=1, circle_radius=1)
cap = cv.VideoCapture(0)

while cap.isOpened():
    success, image = cap.read()
    if not success:
        break

    image = cv.cvtColor(cv.flip(image, 1), cv.COLOR_BGR2RGB)
    image.flags.writeable = False
    results = face_mesh.process(image)

    image.flags.writeable = True
    image = cv.cvtColor(image, cv.COLOR_RGB2BGR)
    if results.multi_face_landmarks:
        for face_landmarks in results.multi_face_landmarks:
            mp_drawing.draw_landmarks(
                image=image,
                landmark_list=face_landmarks,
                connections=mp_face_mesh.FACE_CONNECTIONS,
                landmark_drawing_spec=drawing_spec,
                connection_drawing_spec=drawing_spec)
    cv.imshow('MediaPipe FaceMesh', image)
    if cv.waitKey(1) & 0xFF == ord('q'):
        break
face_mesh.close()
cap.release()
```

이걸 돌린다면 우째 나올까요???

다음 애니메이션은 코드를 깨작 수정하여 GIF로 만든 것입니다. 

{{< figure src="/images/post/mediapipe/face_mesh.gif" >}}

별 기대 안하고 돌렸는데 제 맥미니 (Intel(R) Core(TM) i5-8500B CPU @ 3.00GHz) 으로 평균 30fps 이상 나오네요!

GIF는 이것저것 처리를 한거라 30fps 처럼 안보입니다..

이용해서 뭔가 재밌는걸 만들 수 있을 것 같습니다!

추후에 시간이 된다면 Hands랑 Pose에 대한 결과도 추가로 올리겠습니다!

## 참고 자료

[https://mediapipe.dev/](https://mediapipe.dev/)

[https://google.github.io/mediapipe/](https://google.github.io/mediapipe/)

[https://opensource.google/projects/mediapipe](https://opensource.google/projects/mediapipe)

## P.S

- 구글...갓글...