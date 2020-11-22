---
title: MediaPipe - (3)
date: 2020-11-15T18:30:46+06:00
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

저번 Mediapipe의 Hands 포스팅에 이어서 Mediapipe의 Pose 를 테스트 해보겠습니다. 

## 실행 코드

```python
import time
import cv2 as cv
import mediapipe as mp
mp_drawing = mp.solutions.drawing_utils
mp_pose = mp.solutions.pose

prevTime = 0
idx = 0
pose = mp_pose.Pose(
    min_detection_confidence=0.5, min_tracking_confidence=0.5)
cap = cv.VideoCapture('./ufc.gif')
while cap.isOpened():
    success, image = cap.read()
    curTime = time.time()
    if not success:
        break
    
    image = cv.cvtColor(cv.flip(image, 1), cv.COLOR_BGR2RGB)
    image.flags.writeable = False
    results = pose.process(image)

    image.flags.writeable = True
    image = cv.cvtColor(image, cv.COLOR_RGB2BGR)
    mp_drawing.draw_landmarks(
        image, results.pose_landmarks, mp_pose.POSE_CONNECTIONS)

    sec = curTime - prevTime
    prevTime = curTime
    fps = 1/(sec)
    str = f"FPS : {fps:0.1f}"
    
		cv.putText(image, str, (0, 100), cv.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0))
    cv.imshow('MediaPipe Pose', image)
    cv.imwrite(f"./sample_{idx:05d}.jpg", image) # for making gif
    idx += 1
    if cv.waitKey(1) & 0xFF == ord('q'):
        break
pose.close()
cap.release()
```

좀 더 해봐야겠지만 일단 지금 코드로는 제대로 잡진 못하는 것 같네요..

흠....코드를 좀 수정해봐야겠습니다..

{{< figure src="/images/post/mediapipe/pose_output.gif" >}}


