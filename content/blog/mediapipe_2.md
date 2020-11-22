---
title: MediaPipe - (2)
date: 2020-11-14T18:30:46+06:00
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

저번 Mediapipe와 Face mesh 포스팅에 이어서 Mediapipe의 Hands 를 테스트 해보겠습니다. 

## 실행 코드

```python
import time
import cv2 as cv
import mediapipe as mp
mp_drawing = mp.solutions.drawing_utils
mp_hands = mp.solutions.hands

hands = mp_hands.Hands(
	min_detection_confidence=0.7, min_tracking_confidence=0.5)
cap = cv.VideoCapture(0)

prevTime = 0
# idx = 0
while cap.isOpened():
    success, image = cap.read()
    curTime = time.time()
    if not success:
        break
    
    image = cv.cvtColor(cv.flip(image, 1), cv.COLOR_BGR2RGB)
    image.flags.writeable = False
    results = hands.process(image)

    image.flags.writeable = True
    image = cv.cvtColor(image, cv.COLOR_RGB2BGR)
    if results.multi_hand_landmarks:
        for hand_landmarks in results.multi_hand_landmarks:
            mp_drawing.draw_landmarks(
				image, hand_landmarks, 
                mp_hands.HAND_CONNECTIONS)
    
    sec = curTime - prevTime
    prevTime = curTime
    fps = 1/(sec)
    str = f"FPS : {fps:0.1f}"

    cv.putText(image, str, (0, 100), cv.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0))
    cv.imshow('MediaPipe Hands', image)
    # cv.imwrite(f"./sample_{idx:05d}.jpg", image) # for making gif
    # idx += 1
    if cv.waitKey(1) & 0xFF == ord('q'):
        break

hands.close()
cap.release()
```

음....살짝살짝 끊기긴 하네요.

{{< figure src="/images/post/mediapipe/hands.gif" >}}

다음엔 파이썬으로 할 수 있는 마지막인 Pose 예제를 해보겠습니다.
