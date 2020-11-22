---
title: "Review: MRI interpolation using Deep Learning"
date: 2019-07-05T18:30:46+06:00
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
  - "Paper"

# post type
type: "post"
---

# Deep Generative Adversarial Networks for Thin-Section Infant MR Image Reconstruction

- Jiaqi Gu<sup>1</sup>, Zezu Li<sup>1</sup>, YuanYuan Wans<sup>1, 3</sup>, Haowei Yang<sup>2</sup>, Zhongwei Qiao<sup>2</sup>, and Jinhua Yu<sup>1, 3</sup>
- <sup>1</sup>School of Information Science and Technology, Fudan University, Shanghai 200433, China  
<sup>2</sup>The Children's Hospital of Fudan University, Shanghai 201102, China  
<sup>3</sup>Key Laboratory of Medical Imaging Computing and Computer Assisted Intervention of Shanghai, Department of Electronic Engineering, Institute of Functional
and Molecular Medical Imaging, Fudan University, Shanghai 200433, China
---

## Abstract
- Thin section magnetic resonance images (**Thin MRI**) 는 뇌수술, 뇌 구조 분석에 좋은 영상.
- 하지만 Thick section magnetic resonance images (**Thick MRI**) 에 비해 imaging cost가 많이 들기 때문에 잘 사용되지 않음.
- Thick MRI 2 Thin MRI 제안.
- Two stage( GAN -> CNN )로 구성하였고 Thick MRI의 Axial, Sigittal plane을 이용하여 Thin MRI의 Axial reconstruction.
- 3D-Y-Net-GAN 은 Axial, Sagittal Thick MRI 를 이용하여 Fusion. 
- 3D-Dense U-Net은 Sagittal plane에 대해 세부적인 calibrations, structual correction 제공.
- Loss function 은 structual detail을 Network가 capture 할 수 있도록 제안.
- bicubic, sparse representation, 3D-SRU-Net 과 비교.
- 35번의 Cross-validation, 114개를 이용하여 두개의 testset 구성.
  - PSNR : 23.5 % 증가.
  - SSIM : 90.5 % 증가.
  - MMI : 21.5 % 증가.


## Introduction
- Thin MRI 는 slice thickness가 1mm이고 sapcing gap이 0mm.
- 하지만 항상 Thin MRI를 사용할 수 없음.
- 일반적으로 사용하는 Thick MRI는 slice thickness가 4~6mm 이고 sapcing gap이 0.4~1mm.
  - 해상도 : Thin MRI > Thick MRI
- 인간의 뇌 발달에 대한 insight를 주기 때문에 유아의 brain MR image는 어른의 brain MR image 보다 연구에 가치가 있음
- 하지만 유아의 MR image를 얻는게 쉽지 않음.
- 그래서 Thick to Thin 제안.
- 기존 traditional interpolation algorithm
  - 시각적으로는 성능이 좋아보임. 하지만 성인의 brain 에 초점을 맞춤.
  - **[Interpolation-based super-resolution reconstruction: effects of slice thickness](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4478865/pdf/JMI-001-034007.pdf)**
  - **[Evaluation of interpolation effects on upsampling and accuracy of cost functions-based optimized automatic image registration](https://www.hindawi.com/journals/ijbi/2013/395915/)**
- Frame interpolation 방법과 같이 적용 가능.
  - **[Slice Interpolation in MRI Using a Decomposition-reconstruction Method](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=8110374)**
- Super-resolution 문제로 적용할 수도 있음.
  - **[Image super-resolution via sparse representation](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=5466111)**
- CNN, GAN 이 발전하면서 super-resolution 이 탄력을 받음.
  - **[[Context-Sensitive Super-Resolution for Fast Fetal Magnetic Resonance Imaging](https://link.springer.com/chapter/10.1007/978-3-319-67564-0_12)**]
  - **[[Deep Generative Adversarial Neural Networks for Compressive Sensing MRI](https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=8417964)]**
- 이전에 성인의 Thick MRI를 Thin MRI 로 reconstruction 하는 3D-SRGAN 제안했으나 axial plane만 고려했음. **[[Reconstruction of Thin-Slice Medical Images Using Generative Adversarial Network](https://link.springer.com/chapter/10.1007%2F978-3-319-67389-9_38)]**
- Deep Learning 이 reconstruction performance 뿐 아니라 reconstruction time 감소에도 매우 효과적인걸 보임.

## Proposed Method

### A. Overview
- CNN은 기존에도 super-resolution에서 많이 사용됨.
- 하지만 최근까지 제안된 Network는 대부분 2D image에 대한 upscaling.
- 몇몇 Network는 3D image로 확장했지만 그렇게 효과를 보지 못했음.
- 이 논문의 Flow
{{< figure src="/images/post/thin/fig01.PNG" >}}

{{< figure src="/images/post/thin/fig02.PNG" >}}

### B. Network Architecture
- First stage는 3D-Y-Net-GAN 으로 Thick MRI를 Thin MRI로 생성 후 3D-DenseU-Net으로 recalibration.
  
#### 3D-Y-Net-GAN
- Input : Axial, Sagittal Thick MRI
- Output : Thin MRI
- r : Upscaling Factor ( r = 8 일 경우의 예시 )

{{< figure src="/images/post/thin/fig03.PNG" >}}

- Feature Extraction Branches
  - 각 input에 대한 feature 추출.
  - Maxpooling layer에서 [1, 2, 1], [2, 1, 1]의 다른 strides factor 적용.
  - 3D convolutional layer 는 Convolution + Batch Normalization + Swish 로 구성.
    - [Swish](https://arxiv.org/pdf/1710.05941.pdf)는 Activation 의 종류로 ReLU로 인해 생기는 Dead neuron을 극복할 수 있음. **-> 근데 굳이 왜 swish일까...**
  - layers 를 거친 후 shape 의 변화
    - Axial : [H, W, S, 1] -> [H/2, W/2, S, 32]
    - Sagittal : [H, W, r*S, 1] -> [H/2, W/2, S, 32] 
  - Axial과 Sagittal의 shape이 다르기 때문에 Sagittal 에 대해서 preprocessing으로 3개의 3d convolution layer 적용.
  
- Feature Fusion Branch
  - 두 feature를 channel 방향으로 Concatanation.
  - W 방향으로 Upsampling 후 H 방향으로 Downsampling feature 를 Concatanation.
  - H 방향으로 Upsampling 후 첫번째 Block의 Feature map을 Concatanation
  - U-Net 에서 아이디어를 얻었고 structual alignment, gradient-vanishing 등을 완화.
  
- Reconstruction Branch
  - Figure 3 (b) 와 같은 구조.
  - Upsampling layer 3개를 연속으로 붙여서 8배 확장하는 구조 대신에 Multipath upscaling strategy 적용. **-> Artifact 완화 효과...?**

- Discriminator
{{< figure src="/images/post/thin/fig04.PNG" >}}

  - Axial Image, Saggital Image, Combination Image 가 Real Pair인지 Fake Pair인지 감별.
  - Input : \\((I^A, I^Y, I^S), (I^A, I^{GT}, I^S)\\)
  - Output : Real, Fake

#### 3D-DenseU-Net
{{< figure src="/images/post/thin/fig05.PNG" >}}

- 전체적인 구조는 U-Net이지만 2개의 Enhanced residual block 을 적용하여 detail recalibration.
- Input :  \\(I^Y, I^S, I^{YA}\\) **-> 어떻게 3개가 input으로...?**
- Output : Thin MR Image
- \\(I^A\\) 를 \\(I^Y\\) 의 해당 위치에 insertion 하여 \\(I^{YA}\\) 생성. -> 아직 이해 X..
  - Axial Information 을 이용하여 정확한 axial 을 만들기 위해...
  - \\(I^S\\) 를 \\(I^Y\\) 에 insertion하게 되면 Sagittal 에 대한 information 이 과해지기 때문에 Reconstrtion Axial Image의 Quality 가 안좋아 질 것!
- End-to-End 가 아니라 각각 따로따로 학습. **-> Faster RCNN 과 같은 방식으로 할런지....?**
  
#### Loss Function
- \\(G\\) 는 generator 라는 의미.
- Self-Adaptive Charbonnier Loss
  - 일반적으로 많이 사용되는 \\(\ell2\\) 전반적으로 Smoothing 하게 만들어지고 \\(\ell1\\) 은 GT와 Prediction 의 차이로 indiscriminate 하게 학습.
  - [Deep Laplacian Pyramid Networks for Fast and Accurate Super-Resolution](https://arxiv.org/pdf/1704.03915.pdf)에 따르면 **Charbonnier loss**(미분가능한 $\ell1$의 분산)가 \\(\ell1, \ell2\\) 보다 성능이 뛰어남. 
  - [Deep Learning for Isotropic Super-Resolution from Non-Isotropic 3D Electron Microscopy](https://arxiv.org/pdf/1706.03142.pdf) 에 따르면 **Cubic-weighted mean square error** 가 Generated 영상과 Ground truth 간의 차이가 큰 "어려운" 부분의 성능을 강조.
  - 다음과 같은 Loss 제안.
  - \\(\epsilon\\) 은 default로 \\(10^{-6}\\)

$$L^G_{SC} = \frac{1}{rLWH}\sum_{x,y,z=1,1,1}^{L,W,rH}\sqrt{(I^{GT}_{x,y,z}-I^Y_{z,y,z})^2+\epsilon}\cdot\bigg(\frac{1}{2}+\frac{(I^{GT}_{x,y,z}-I^Y_{z,y,z})^2}{2max((I^{GT}-I^Y)^2)}\bigg)$$

- 3-D Gradient Correction Loss
  - Charbonnier Loss는 Pixelwise difference에 대한 Loss, Gradient에 대한 손실을 줄 수 있음.
  - 다음과 같이 각 axis에 대한 Gradient 를 이용하여 Loss 제안.

$$L^G_{GC} = \mathbb{E}[(\nabla_{x}I^{GT}_{x,y,z} - \nabla_{x}I^Y_{x,y,z})^2] \\\  + \mathbb{E}[(\nabla_{y}I^{GT}_{x,y,z} - \nabla_{y}I^Y_{x,y,z})]^2 \\\ + \mathbb{E}[(\nabla_{z}I^{GT}_{x,y,z} - \nabla_{z}I^Y_{x,y,z})^2]$$

- Adversarial Loss
  - LSGAN Loss 사용. 

$$L^D=\frac{1}{2}\mathbb{E}[(D(I^{GT}, I^A, I^S)-1)^2+D(I^Y, I^A, I^S)^2]$$

$$L^G_{AD}=\mathbb{E}[(D(I^Y, I^A, I^S)-1)^2]$$

- \\(\ell_2\\) Weight Regularization Loss
  - (Loss는 아니지만...)
  - Overfitting을 방지하기 위해 사용.

$$L^G_{WR} = \sum\Vert W_G\Vert^2_2$$


- 3D-Y-Net-GAN Loss 
  - \\(L_G = L^G_{SC} + \lambda_1L^G_{GC} + \lambda_2L^G_{AD} + \lambda_3L^G_{WR}\\)
  
- 3D-DenseU-Net Loss 
  - \\(L = L_{SC} + \lambda_1L_{GC} + \lambda_3L_{WR}\\)


## Experimental Result
- Multiplanar 의 효율성을 검증하기 위해 다음과 같이 세 가지 경우로 나눔.
  - Axial, Sagittal 둘 다 이용.
  - Axial 만 이용.
  - Saigittal 만 이용.

- Loss function을 검증하기 위해 네 가지 경우로 나눔.
  - \\(\ell1norm + L_{GC} + L_{AD} + L_{WR}\\) (pixelwise loss를 \\(\ell1norm\\)으로 대체.)
  - \\(L_{SC} + L_{GC} + L_{WR}\\)
  - \\(L_{SC} + L_{AD} + L_{WR}\\)
  - \\(L_{SC} + L_{GC} + L_{AD} + L_{WR}\\)

- Evalutaion Method 로는 아래와 같이 네 가지 기법과 자신들의 Network
  - [Bicubic interpolation](https://ieeexplore.ieee.org/document/1163711)
  - [Sparse representation](https://ieeexplore.ieee.org/document/5466111)
  - [3D-SRU-Net](https://arxiv.org/abs/1706.03142)
  - 3D-Y-Net-GAN
  - 3D-Y-Net-GAN + 3D-DenseU-Net

- Metrics으로는 다음 세 가지 사용.
  - PSNR(Peak Signal-to-Noise Ratio)

$$
\begin{alignedat}{2}
MAX_I = 255 \\\ 
PSNR = 20\cdot\log_{10}\Bigg(\frac{MAX_I}{\sqrt{\frac{1}{rLWH}\sum_{x, y, z}(I^R_{x,y,z}-I^{GT}_{x,y,z})^2}}\Bigg)
\end{alignedat}
$$

  - SSIM(Structural SIMilarity)

$$L=255(\text{dynamic\ range})$$
$$\mu:\text{Variance} $$
$$\mu\_{ab}:\text{Covariance} $$
$$c\_1=(k\_1L)^2 $$
$$c\_2=(k\_2L)^2 $$
$$SSIM=\frac{(2\mu\_a\mu\_b+c_1)(2\sigma\_{ab}+c_2)}{(\mu\_a^2+\mu\_b^2+c\_1)(\sigma\_a^2+\sigma_b^2+c_2)}$$

  - NMI(Normalized Mutual Information)

$$H(X) = -\sum\_{x\_i}\in{X} p(x\_i)\log {p(x\_i)}$$
$$H(X, Y) = -\sum_{y_i\in{Y}} \sum_{x_i\in{X}}p(x_i, y_i)\log{p(x_i, y_i)}$$
$$NMI(X, Y) = 2\frac{H(X) + H(Y) - H(X, Y)}{H(X)+H(Y)}$$

- pixel 값을 [-1, 1]로 clipping -> 다시 8-bit gray scale로 변환.
- Generated MR images 와 Ground truth가 비슷할 수록 높은 값을 가짐.


### A. Data and Preprocessing

-  총 154 samples의 2~5세 유아 Axial, Sagittal Thick MRI, Axial Thin MRI

{{< figure src="/images/post/thin/tab01.PNG" >}}

- Table 1. 과 같은 parameter 사용.
- Dataset 분할
  - Cross Validation Dataset : 40 samples
  - Test 1 Dataset : 65 samples
  - Test 2 Dataset : 49 samples 
- Preprocessing
  - 각 영상별로 다른 parameter를 가지고 있고 intensities 도 다양하기 때문에 spatial misalignment, intensity imblance를 발견.
  - Registration을 위해 SPM12 를 이용하여 unified spatial normalization 수행.
    - DICOM to NIfTI
    - Segment gray matter, white matter, cerebrospinal fluid, skull, scalp, and air mask.
    - Nonlinear deformation field
    - ICBM Asian brain template in affine regularization
  - Grayscale Normalization
    - MRI 는 16 bit..
    - 단순 linear transformation 으로 [-1, 1]로 mapping.
  - Histogram Matching
    - 고정된 샘플을 reference로 histogram matching 적용.
    - histogram imbalance 제거.
- Data Augmentation
  - Radial Transformation
    - **[Image Augmentation using Radial Transform for Training Deep Neural Networks](https://arxiv.org/pdf/1708.04347.pdf)**
  - Mirror Reflection

### B. Experimental Settings
- 5-fold cross-validation 적용.
- 35 개중 랜덤으로 28:7로 training:validation . **-> 앞에선 40개라더니..?**
- Training 3D-Y-Net-GAN 
  - Batch Size : 16
  - Epochs : 200
  - [Adam Optimizer Parameter](https://arxiv.org/pdf/1412.6980.pdf)
    - \\(\beta_1\\): 0.9
    - Learning rate schedule
      - Initial value : 5*10<sup>-4</sup>
      - Decay Step : 252
      - Decay rate : 0.989
  - $\lambda_1, \lambda_2, \lambda_3$ : 0.2, 0.02, 0.1
  - He initializer

- Training 3D-DenseU-Net
  - Batch Size : 12
  - Epochs : 300
  - Adam Optimizer Parameter
    - \\(\beta_1\\): 0.9
    - Learning rate schedule
      - Initial value : 5*10<sup>-4</sup>
      - Decay Step : 373
      - Decay rate : 0.989
  - \\(\lambda_1, \lambda_3\\) : 1, 0.001
  - He initializer

- SR Parameter
  - Dictionary size = 512
  - Patch number = 100,000
  - Patch size = 13 x 13
  - Sparsity Regularization = 0.15
  - Overlap = 12.

- Training 3D-SRU-Net
  - Batch Size : 32
  - Epochs : 300
  - Adam Optimizer Parameter
    - \\(\beta_1\\): 0.9
    - Initial value : 5*10<sup>-4</sup>


#### C. Ablation Experiment On Input Data
- Input을 변경하면서 실험 진행. 
{{< figure src="/images/post/thin/fig06.PNG" >}}
{{< figure src="/images/post/thin/tab02.PNG" >}}
- Axial 과 Sagittal 을 같이 사용했을 때가 좀 더 세부적인 구조, 적은 왜곡을 보임.
  - 두 축의 영상이 서로 조합하여 reconstruction task를 향상.
- Quantitive evaluation 에서도 더 높은 지표를 산출.

#### D. Ablation Experiment On Loss Function
- Loss를 변경하면서 실험 진행.
{{< figure src="/images/post/thin/fig07.PNG" >}}
{{< figure src="/images/post/thin/tab03.PNG" >}}
- Self-Adaptive Charbonnier Loss에 비해 \\(\ell1 norm\\) 이 흐린 영상을 생성.
- Without Gradient Correction Loss
  - 덜 선명한 영상을 생성.
- Without Adversarial Loss
  - 덜 realistic 영상을 생성. **-> ?????그냥 쓴 말인가..**
- **Table3 ...지표 좀 이상..**

#### E. Comparison With Other  Methods
- 다른 Method들과 비교.
{{< figure src="/images/post/thin/fig08.PNG" >}}
{{< figure src="/images/post/thin/tab04.PNG" >}}
- 제안한 method로 생성된 image가 가장 Realistic하고 Ground truth 와 가장 비슷하다고 함.
- 대부분 Quantitative evaluation 에서 제안한 method가 다른 것들을 다 뛰어넘음.

## Conclusion 
- **제안한 Method 에선 Data preprocessing이 매우 중요하다......**