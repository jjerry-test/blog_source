---
title: Weights & Biases Usage - [1]
date: 2020-08-27T18:30:46+06:00
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

이번 포스팅은 [Weights & Biases](https://www.wandb.com) 를 활용하여 Network 성능 비교 예시를 하려고 합니다. 

어려운 글이 아니기 때문에 금방 금방 따라하실 수 있을 것 같습니다!

### Task

- Flower classification
    - daisy, roses, dandelion, sunflowers, tulips
- List of pretrained-model
    - [tf.keras.applications](https://www.tensorflow.org/versions/r2.2/api_docs/python/tf/keras/applications)
- Detail of training
    - Image size: 150x150x3
    - Epochs: 5
    - Batch size: 256
    - Freezing: True

자세한 코드는 [for_wandb 라는 repository](https://github.com/jjerry-k/for_wandb)에 올려놨으니 확인하시면 됩니다. 

train.sh를 실행하게 되면 위에 적혀있는 pretrined model 만 변경해서 classification 을 수행하게 됩니다! 

그 후 weights & biases 화면을 가서 확인해 보면...

각 모델별 loss, acc, val_loss, val_acc graph를 확인할 수 있습니다. 

{{< figure src="/images/post/wandb_usage_1/Untitled.png" >}}

좌측 상단에 Run 옆을 보시면 테이블 모양 아이콘이 있는데 이를 누르면 다음과 같이 테이블로 정리되어 있는 것을 확인 하실 수 있습니다.

{{< figure src="/images/post/wandb_usage_1/Untitled_1.png" >}}

이번 포스팅은 Weights & Biases를 이용하여 모델 별 성능 비교를 해보았습니다. 

조만간...Sweep 이라는 Hyperparameter search and model optimization 방법에 대해 포스팅을 해보려 합니다!

## P.S

- 마스크 답답.....
- 날씨 후덥지근, 짜증....