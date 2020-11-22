---
title: TensorFlow Multi GPU 사용법
date: 2020-06-14T18:30:46+06:00
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
  - "TensorFlow"

# post type
type: "post"
---

 이번 포스팅은 Multi GPU 시스템에서 Google의 머신러닝 오픈 소스 플랫폼인 [TensorFlow](https://www.tensorflow.org/)사용법에 관한 것입니다!  
거두절미하고 바로 코딩으로 들어가겠습니다!  



## Single GPU 예시
- 다음 코드는 Single GPU를 이용하여 mnist data를 분류하는 코드입니다. 


``` python
# Import Package
import os
import numpy as np
import tensorflow as tf
from tensorflow.keras import layers, models, losses, optimizers, datasets, utils

# Data Prepare
(train_x, train_y), (test_x, test_y) = datasets.mnist.load_data()
train_x, test_x = np.expand_dims(train_x/255., -1), np.expand_dims(test_x/255., -1)
print("Train Data's Shape : ", train_x.shape, train_y.shape)
print("Test Data's Shape : ", test_x.shape, test_y.shape)

# Build Network
cnn = models.Sequential()
cnn.add(layers.Conv2D(16, 3, activation='relu', input_shape=(28, 28, 1,)))
cnn.add(layers.MaxPool2D())
cnn.add(layers.Conv2D(32, 3, activation='relu'))
cnn.add(layers.MaxPool2D())
cnn.add(layers.Flatten())
cnn.add(layers.Dense(10, activation='softmax'))

cnn.compile(optimizer=optimizers.Adam(), loss=losses.sparse_categorical_crossentropy, metrics=['accuracy'])                
print("Network Built!")

# Training Network
epochs=10
batch_size = 4096
history = cnn.fit(train_x, train_y, epochs=10, batch_size=batch_size, validation_data=(test_x, test_y))
```

## Multi GPU 예시
- 다음 코드는 Multi GPU를 이용한 코드입니다. 

``` python
# Import Package
import os
import numpy as np
import tensorflow as tf
from tensorflow.keras import layers, models, losses, optimizers, datasets, utils

# Data Prepare
(train_x, train_y), (test_x, test_y) = datasets.mnist.load_data()
train_x, test_x = np.expand_dims(train_x/255., -1), np.expand_dims(test_x/255., -1)
print("Train Data's Shape : ", train_x.shape, train_y.shape)
print("Test Data's Shape : ", test_x.shape, test_y.shape)

# Build Network
strategy = tf.distribute.MirroredStrategy()
with strategy.scope():
    cnn = models.Sequential()
    cnn.add(layers.Conv2D(16, 3, activation='relu', input_shape=(28, 28, 1,)))
    cnn.add(layers.MaxPool2D())
    cnn.add(layers.Conv2D(32, 3, activation='relu'))
    cnn.add(layers.MaxPool2D())
    cnn.add(layers.Flatten())
    cnn.add(layers.Dense(10, activation='softmax'))

    cnn.compile(optimizer=optimizers.Adam(), loss=losses.sparse_categorical_crossentropy, metrics=['accuracy'])                
print("Network Built!")

# Training Network
epochs=10
batch_size_each_gpu = 4096
batch_size = batch_size_each_gpu*len(gpus)

history = cnn.fit(train_x, train_y, epochs=10, batch_size=batch_size, validation_data=(test_x, test_y))
```

어렵지 않습니다. `Build Network` 주석 부분과 `Training Network` 부분에 `batch_size`만 조금 수정해주시면 끝납니다!  
{{< figure src="/images/post/tf_multi_gpu/bob.png" >}}

하지만 이렇게 하면 무식하게 GPU의 모든 메모리를 할당합니다.  
그렇기 떄문에 다음과 같이 코드를 추가하여 `필요한 만큼` 할당하도록 합니다. 

## 필요한 만큼의 GPU 메모리만 사용하기

``` python
# Import Package
import os
import numpy as np
import tensorflow as tf
from tensorflow.keras import layers, models, losses, optimizers, datasets, utils

# Data Prepare
(train_x, train_y), (test_x, test_y) = datasets.mnist.load_data()
train_x, test_x = np.expand_dims(train_x/255., -1), np.expand_dims(test_x/255., -1)
print("Train Data's Shape : ", train_x.shape, train_y.shape)
print("Test Data's Shape : ", test_x.shape, test_y.shape)

# For Efficiency
gpus = tf.config.experimental.list_physical_devices('GPU')
if gpus:
    try:
        for gpu in gpus:
            tf.config.experimental.set_memory_growth(gpu, True)
        logical_gpus = tf.config.experimental.list_logical_devices('GPU')
        print(len(gpus), "Physical GPUs,", len(logical_gpus), "Logical GPUs")
    except RuntimeError as e:
        print(e)

# Build Network
strategy = tf.distribute.MirroredStrategy()
with strategy.scope():
    cnn = models.Sequential()
    cnn.add(layers.Conv2D(16, 3, activation='relu', input_shape=(28, 28, 1,)))
    cnn.add(layers.MaxPool2D())
    cnn.add(layers.Conv2D(32, 3, activation='relu'))
    cnn.add(layers.MaxPool2D())
    cnn.add(layers.Flatten())
    cnn.add(layers.Dense(10, activation='softmax'))

    cnn.compile(optimizer=optimizers.Adam(), loss=losses.sparse_categorical_crossentropy, metrics=['accuracy'])                
print("Network Built!")

# Training Network
epochs=10
batch_size_each_gpu = 4096
batch_size = batch_size_each_gpu*len(gpus)

history = cnn.fit(train_x, train_y, epochs=10, batch_size=batch_size, validation_data=(test_x, test_y))
```

기존 Multi GPU 코드와 달라진 점은 
1. `For Efficiency`라는 부분이 추가.
2. `strategy = tf.distribute.MirroredStrategy()`을 `Build Network`에서 `For Efficiency`의 가장 첫번째 라인으로 이동.

이렇게 변경 후 실행 후 nvidia-smi와 같은 모니터링 툴을 확인해보시면 이전과는 다르게 GPU 메모리를 필요한 만큼만 사용하는걸 보실 수 있습니다!



## P.S 
- 다음은 뭘로 포스팅하지...

## 번외편 (Using gradient tape)

``` python 

# %%
# Import Package
import os
import numpy as np
import tensorflow as tf
from tensorflow.keras import layers, models, losses, optimizers, datasets, utils

gpus = tf.config.experimental.list_physical_devices('GPU')
if gpus:
    try:
        # Currently, memory growth needs to be the same across GPUs
        for gpu in gpus:
            tf.config.experimental.set_memory_growth(gpu, True)
        logical_gpus = tf.config.experimental.list_logical_devices('GPU')
        print(len(gpus), "Physical GPUs,", len(logical_gpus), "Logical GPUs")
    except RuntimeError as e:
        # Memory growth must be set before GPUs have been initialized
        print(e)

# %%
# Data Prepare
epochs=10
batch_size_each_gpu = 4096
batch_size = batch_size_each_gpu*len(gpus)

(train_x, train_y), (test_x, test_y) = datasets.mnist.load_data()
train_x, test_x = np.expand_dims(train_x/255., -1), np.expand_dims(test_x/255., -1)

print("Train Data's Shape : ", train_x.shape, train_y.shape)
print("Test Data's Shape : ", test_x.shape, test_y.shape)

# %%
# Build Network
class build_model(models.Model):
    def __init__(self):
        super(build_model, self).__init__()

        self.conv1 = layers.Conv2D(16, 3, activation='relu')
        self.pool1 = layers.MaxPool2D()

        self.conv2 = layers.Conv2D(32, 3, activation='relu')
        self.pool2 = layers.MaxPool2D()

        self.flatten = layers.Flatten()
        self.dense = layers.Dense(10, activation='softmax')
    
    def call(self, x):
        x = self.conv1(x)
        x = self.pool1(x)

        x = self.conv2(x)
        x = self.pool2(x)

        x = self.flatten(x)

        return self.dense(x)

print("Network Built!")

# Set mirrored Strategy
strategy = tf.distribute.MirroredStrategy()

with strategy.scope():
    
    # Prepare dataset 
    train_dataset = tf.data.Dataset.from_tensor_slices((train_x, train_y)).shuffle(len(train_x)).batch(batch_size) 
    train_dist_dataset = strategy.experimental_distribute_dataset(train_dataset)
    
    test_dataset = tf.data.Dataset.from_tensor_slices((test_x, test_y)).batch(batch_size) 
    test_dist_dataset = strategy.experimental_distribute_dataset(test_dataset)

    # Make Network
    cnn = build_model()

    # Set Loss & Metric function
    loss_object = tf.keras.losses.SparseCategoricalCrossentropy(reduction=tf.keras.losses.Reduction.NONE)
    def compute_loss(labels, predictions):
        per_example_loss = loss_object(labels, predictions)
        return tf.nn.compute_average_loss(per_example_loss, global_batch_size=batch_size)
        
    test_loss = tf.keras.metrics.Mean(name='test_loss')

    train_accuracy = tf.keras.metrics.SparseCategoricalAccuracy(name='train_accuracy')
    test_accuracy = tf.keras.metrics.SparseCategoricalAccuracy(name='test_accuracy')

    # Set optimizer
    optimizer = tf.keras.optimizers.Adam()

    # Define taining, test function
    def train_step(inputs):
        images, labels = inputs

        with tf.GradientTape() as tape:
            predictions = cnn(images, training=True)
            loss = compute_loss(labels, predictions)

        gradients = tape.gradient(loss, cnn.trainable_variables)
        optimizer.apply_gradients(zip(gradients, cnn.trainable_variables))

        train_accuracy.update_state(labels, predictions)
        return loss 
    
    def test_step(inputs):
        images, labels = inputs

        predictions = cnn(images, training=False)
        t_loss = loss_object(labels, predictions)

        test_loss.update_state(t_loss)
        test_accuracy.update_state(labels, predictions)

    # Define training, test function suitable for Mirrored Strategy 
    @tf.function
    def distributed_train_step(dataset_inputs):
        per_replica_losses = strategy.experimental_run_v2(train_step, args=(dataset_inputs,))
        return strategy.reduce(tf.distribute.ReduceOp.SUM, per_replica_losses, axis=None)
 
    @tf.function
    def distributed_test_step(dataset_inputs):
        return strategy.experimental_run_v2(test_step, args=(dataset_inputs,))

    # Train Network
    for epoch in range(epochs):
    
        # Training Loop
        total_loss = 0.0
        num_batches = 0
        for x in train_dist_dataset:
            total_loss += distributed_train_step(x)
            num_batches += 1
        train_loss = total_loss / num_batches

        # Test Loop
        for x in test_dist_dataset:
            distributed_test_step(x)

        template = ("에포크 {}, 손실: {}, 정확도: {}, 테스트 손실: {}, 테스트 정확도: {}")
        print (template.format(epoch+1, train_loss, train_accuracy.result()*100, test_loss.result(), test_accuracy.result()*100))

        test_loss.reset_states()
        train_accuracy.reset_states()
        test_accuracy.reset_states()
```