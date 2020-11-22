---
title: Paper Reading Roadmap
date: 2020-08-21T18:30:46+06:00
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

> 본 포스팅은 [고려대학교 산업경영공학부 Data Science & Business Analytics 연구실](http://dsba.korea.ac.kr)의 [강필성 교수님의 자료](https://www.facebook.com/groups/TensorFlowKR/permalink/1275047779502944/)를 정리한 포스팅입니다. 

---

# Contents of Posting
- [Contents of Posting](#contents-of-posting)
- [Paper Reading Roadmap](#paper-reading-roadmap)
  - [ML Basics](#ml-basics)
  - [Data Mining](#data-mining)
    - [General](#general)
    - [Patter Mining](#patter-mining)
    - [Clustering](#clustering)
  - [Artificial Intelligence](#artificial-intelligence)
    - [General](#general-1)
    - [Reinforcement Learning](#reinforcement-learning)
    - [Transfer Learning](#transfer-learning)
  - [Supervised Learning](#supervised-learning)
    - [Kernel Machines](#kernel-machines)
    - [Ensemble](#ensemble)
  - [Semi-supervvised Learning](#semi-supervvised-learning)
  - [Unsupervised Learning](#unsupervised-learning)
  - [Neural Network](#neural-network)
    - [General](#general-2)
    - [Structure](#structure)
    - [Learning Strategies](#learning-strategies)
  - [NLP](#nlp)
    - [General](#general-3)
    - [Topic Modeling](#topic-modeling)
    - [Repersentation Learning](#repersentation-learning)
    - [Classification](#classification)
    - [Summarization](#summarization)
    - [Machine Translation](#machine-translation)
    - [Question Answering](#question-answering)
  - [Vision](#vision)
    - [Classification](#classification-1)
    - [Object Detection](#object-detection)
    - [Localization & Segmentation](#localization--segmentation)

# Paper Reading Roadmap

## ML Basics
- The matrix calculus you need for deep learning 
- Statistical Modeling: The Two Cultures 
- Machine learning: Trends, perspectives, and prospects 
- An introduction to ROC analysis 
- Learning from imbalanced data 
- Variational inference: A review for statisticians 
- The expectation-maximization algorithm 
- Dimension Reduction: A Guided Tour

## Data Mining

### General
- [Interestingness Measures for Data Mining: A Survey](https://dl.acm.org/doi/10.1145/1132960.1132963)
- [The PageRank citation ranking: Bringing order to the web](http://ilpubs.stanford.edu:8090/422/1/1999-66.pdf)
- [Process Mining Manifesto](https://link.springer.com/content/pdf/10.1007/978-3-642-28108-2_19.pdf)
- [An Introduction to Variable and Feature Selection](https://www.jmlr.org/papers/volume3/guyon03a/guyon03a.pdf)

### Patter Mining
- [Fast Algorithm for Mining Association Rules](https://web.stanford.edu/class/cs345d-01/rl/ar-mining.pdf)
- [A survey of sequential pattern mining](https://dl.acm.org/doi/10.1145/3314107)
- [A Survey of Parallel Sequential Pattern Mining](https://arxiv.org/pdf/1805.10515.pdf)

### Clustering
- [A density-based algorithm for discovering clusters in large spatial databases with noise](https://www.aaai.org/Papers/KDD/1996/KDD96-037.pdf)
- [Data Clustering: A Review](http://users.eecs.northwestern.edu/~yingliu/datamining_papers/survey.pdf)
- [Techniques of Cluster Algorithms in Data Mining](https://cs.nju.edu.cn/zhouzh/zhouzh.files/course/dm/reading/reading06/grabmeier_dmkd02.pdf)
- [Survey of Clustering Data Mining Techniques](https://www.cc.gatech.edu/~isbell/reading/papers/berkhin02survey.pdf)
- [On Clustering Validation Techniques](https://web.itu.edu.tr/sgunduz/courses/verimaden/paper/validity_survey.pdf)
- [clValid: An R Package for Cluster Validation](https://cran.r-project.org/web/packages/clValid/vignettes/clValid.pdf)
  
## Artificial Intelligence

### General
- [Learning Deep Architectures for AI](https://www.iro.umontreal.ca/~lisa/pointeurs/TR1312.pdf)
- [Representation learning: A review and new perspectives](https://arxiv.org/pdf/1206.5538.pdf)
- [Generative Adversarial Networks](https://papers.nips.cc/paper/5423-generative-adversarial-nets.pdf)
- [From evolutionary computation to the evolution of things](https://www.nature.com/articles/nature14544)
- [Probabilistic machine learning and artificial intelligence](https://www.nature.com/articles/nature14541)
- [AutoML: A Survey of the State-of-the-Art](https://arxiv.org/pdf/1908.00709.pdf)

### Reinforcement Learning
- [Human-level control through deep reinforcement](https://deepmind.com/research/publications/human-level-control-through-deep-reinforcement-learning)
- [Mastering the game of Go with deep neural networks and tree search](https://deepmind.com/research/publications/mastering-game-go-deep-neural-networks-tree-search)
- [An Introduction to Deep Reinforcement Learning](https://arxiv.org/pdf/1811.12560.pdf)
- [World Models](https://arxiv.org/pdf/1803.10122.pdf)

### Transfer Learning
- [Zero-shot learning through cross-modal transfer](https://papers.nips.cc/paper/5027-zero-shot-learning-through-cross-modal-transfer.pdf)
- [Lifelong Learning with Dynamically Expandable Networks](https://arxiv.org/pdf/1708.01547.pdf)

## Supervised Learning

### Kernel Machines
- [An Introduction to Kernel-based Learning Algorithms](https://pdfs.semanticscholar.org/2eb2/ca05a79d1d81033237aad416ad4a1ce90a70.pdf)
- [A Tutorial on Support Vector Machine for Pattern Recognition](https://www.di.ens.fr/~mallat/papiers/svmtutorial.pdf)
- [A Tutorial on Support Vector Regression](https://alex.smola.org/papers/2003/SmoSch03b.pdf)
- [A Tutorial on nu-Support Vector Machines](http://is.tuebingen.mpg.de/fileadmin/user_upload/files/publications/pdf3353.pdf)

### Ensemble
- [Bagging Predictors](https://www.stat.berkeley.edu/~breiman/bagging.pdf)
- [Random Forests](https://www.stat.berkeley.edu/~breiman/randomforest2001.pdf)
- [A short introduction to boosting](https://cseweb.ucsd.edu/~yfreund/papers/IntroToBoosting.pdf)
- [Greedy Function Approximation: A Gradient Boosting Machine](https://statweb.stanford.edu/~jhf/ftp/trebst.pdf)
- [Gradient Boosting Machine, A Tutorial](https://www.frontiersin.org/articles/10.3389/fnbot.2013.00021/full)
- [XGBoost: A Scalable Tree Boosting System](https://arxiv.org/pdf/1603.02754.pdf)
- [LightGBM: A Highly Efficient Gradient Boosting Decision Tree](https://papers.nips.cc/paper/6907-lightgbm-a-highly-efficient-gradient-boosting-decision-tree.pdf) 
- [CatBoost : unbiased boosting with categorical features](https://papers.nips.cc/paper/7898-catboost-unbiased-boosting-with-categorical-features.pdf)

## Semi-supervvised Learning
- [Combining Labeled and Unlabeled Data with Co-Training](https://www.cs.cmu.edu/~avrim/Papers/cotrain.pdf)
- [Semi-supervised Learning with Deep Generative Models](https://papers.nips.cc/paper/5352-semi-supervised-learning-with-deep-generative-models.pdf) 
- [Semi-Supervised Classification with Graph Convolutional Networks](https://arxiv.org/pdf/1609.02907.pdf)
- [MixMatch: A Holistic Approach to Semi-Supervised Learning](https://papers.nips.cc/paper/8749-mixmatch-a-holistic-approach-to-semi-supervised-learning.pdf)
- [ReMixMatch: Semi-Supervised Learning with Distribution Alignment and Augmentation Anchoring](https://arxiv.org/pdf/1911.09785.pdf)
- [FixMatch: Simplifying Semi-Supervised Learning with Consistency and Confidence](https://arxiv.org/pdf/2001.07685.pdf)

## Unsupervised Learning
- [Anomaly Detection: A Survey](http://cucis.ece.northwestern.edu/projects/DMS/publications/AnomalyDetection.pdf)
- [Deep Learning for Anomaly Detection: A Survey](https://arxiv.org/pdf/1901.03407.pdf)
- [A Review of Novelty Detection](https://www.sciencedirect.com/science/article/abs/pii/S016516841300515X)
- [LOF: Identifying Density-Based Local Outliers](https://www.dbs.ifi.lmu.de/Publikationen/Papers/LOF.pdf)
- [Support Vector Data Description](http://homepage.tudelft.nl/a9p19/papers/ML_SVDD_04.pdf)
- [Isolation Forest](https://cs.nju.edu.cn/zhouzh/zhouzh.files/publication/icdm08b.pdf?q=isolation-forest)
- [Isolation-based Anomaly Detection](https://cs.nju.edu.cn/zhouzh/zhouzh.files/publication/tkdd11.pdf)
- [DeepLog: Anomaly Detection and Diagnosis from System Logs through Deep Learning](https://www.cs.utah.edu/~lifeifei/papers/deeplog.pdf)

## Neural Network

### General
- [Deep learning](https://www.cs.toronto.edu/~hinton/absps/NatureDeepReview.pdf)

### Structure
- [Long Short-Term Memory](https://www.bioinf.jku.at/publications/older/2604.pdf)
- [LSTM: A Search Space Odyssey](https://arxiv.org/pdf/1503.04069.pdf)
- [Empirical Evaluation of Gated Recurrent Neural Networks on Sequence Modeling Sequence to sequence learning with neural networks](https://arxiv.org/pdf/1412.3555.pdf)
- [Memory Networks](https://arxiv.org/pdf/1410.3916.pdf)
- [End-To-End Memory Networks](https://papers.nips.cc/paper/5846-end-to-end-memory-networks.pdf)
- [WaveNet: A Generative Model for Raw Audio](https://deepmind.com/blog/article/wavenet-generative-model-raw-audio)
- [An Introduction to Variational Autoencoders](https://arxiv.org/pdf/1906.02691.pdf)
- [A Comprehensive Survey on Graph Neural Networks](https://arxiv.org/pdf/1901.00596.pdf)

### Learning Strategies
- [Batch Normalization: Accelerating Deep Network Training by Reducing Internal Covariate Shift](https://arxiv.org/pdf/1502.03167.pdf)
- [Dropout: A Simple Way to Prevent Neural Networks from Overtting](https://jmlr.org/papers/volume15/srivastava14a.old/srivastava14a.pdf)
- [ADAM: A Method for Stochastic Optimization](https://arxiv.org/pdf/1412.6980.pdf)
- [An overview of gradient descent optimization algorithms](https://arxiv.org/pdf/1609.04747.pdf)
- [Layer normalization](https://arxiv.org/pdf/1607.06450.pdf)
- [Group normalization](https://openaccess.thecvf.com/content_ECCV_2018/papers/Yuxin_Wu_Group_Normalization_ECCV_2018_paper.pdf)

## NLP

### General
- [Natural Language Processing (Almost) from Scratch](https://www.jmlr.org/papers/volume12/collobert11a/collobert11a.pdf)
- [Advances in natural language processing](https://science.sciencemag.org/content/349/6245/261)
- [Recent trends in deep learning based natural language processing](https://arxiv.org/pdf/1708.02709.pdf)

### Topic Modeling
- An introduction to latent semantic analysis 
- Probabilistic latent semantic analysis 
- Probabilistic topic models
- [Latent Dirichlet Allocation](https://www.jmlr.org/papers/volume3/blei03a/blei03a.pdf)

### Repersentation Learning
- [A Neural Probabilistic Language Model](https://www.jmlr.org/papers/volume3/bengio03a/bengio03a.pdf)
- [Distributed representations of words and phrases and their compositionality](https://papers.nips.cc/paper/5021-distributed-representations-of-words-and-phrases-and-their-compositionality.pdf)
- [Efficient Estimation of Word Representations in Vector Space](https://arxiv.org/pdf/1301.3781.pdf)
- [Glove: Global vectors for word representation](https://nlp.stanford.edu/pubs/glove.pdf)
- [Learning Phrase Representations using RNN Encoder–Decoder for Statistical Machine Translation](https://arxiv.org/pdf/1406.1078.pdf)
- [Enriching word vectors with subword information](https://arxiv.org/pdf/1607.04606.pdf)
- [Bert: Pre-training of deep bidirectional transformers for language understanding](https://arxiv.org/pdf/1810.04805.pdf)
- [Deep contextualized word representations](https://arxiv.org/pdf/1802.05365.pdf)
- [Improving language understanding by generative pre-training](https://cdn.openai.com/research-covers/language-unsupervised/language_understanding_paper.pdf)
- [Language models are unsupervised multitask learners](https://cdn.openai.com/better-language-models/language_models_are_unsupervised_multitask_learners.pdf)
- [Language Models are Few-Shot Learners](https://arxiv.org/pdf/2005.14165.pdf)

### Classification
- [Convolutional neural networks for sentence classification](https://arxiv.org/pdf/1408.5882.pdf)
- [Deep learning for sentiment analysis: A survey](https://arxiv.org/pdf/1801.07883.pdf)

### Summarization
- [TextRank: Bringing Order into Texts](https://web.eecs.umich.edu/~mihalcea/papers/mihalcea.emnlp04.pdf)
- [A Neural Attention Model for Abstractive Sentence Summarization](https://arxiv.org/pdf/1509.00685.pdf)


### Machine Translation
- [On the Properties of Neural Machine Translation: Encoder-Decoder Approaches](https://arxiv.org/pdf/1409.1259.pdf)
- [Effective Approaches to Attention-based Neural Machine Translation](https://www-nlp.stanford.edu/pubs/emnlp15_attn.pdf)
- [Neural Machine Translation by Jointly Learning to Aligh and Translate](https://arxiv.org/pdf/1409.0473.pdf)
- [Google's Neural Machine Translation System: Bridging the Gap between Human and Machine Translation](https://arxiv.org/pdf/1609.08144.pdf)
- [Attention is all you need](https://papers.nips.cc/paper/7181-attention-is-all-you-need.pdf)

### Question Answering
- [VQA: Visual Question Answering](https://arxiv.org/pdf/1505.00468.pdf)
- [Ask Me Anything: Dynamic Memory Networks for Natural Language Processing](https://arxiv.org/pdf/1506.07285.pdf)
- [Squad: 100,000+ questions for machine comprehension of text](https://arxiv.org/pdf/1606.05250.pdf)
- [Know what you don't know: Unanswerable questions for SQuAD](https://arxiv.org/pdf/1806.03822.pdf)

## Vision

### Classification
- [Imagenet classification with deep convolutional neural networks](https://papers.nips.cc/paper/4824-imagenet-classification-with-deep-convolutional-neural-networks.pdf)
- [Visualizing and understanding convolutional networks](https://arxiv.org/pdf/1311.2901.pdf)
- [Very Deep Convolutional Networks for Large-Scale Image Recognition](https://arxiv.org/pdf/1409.1556.pdf)
- [Going deeper with convolutions](https://arxiv.org/pdf/1409.4842.pdf)
- [Deep residual learning for image recognition](https://arxiv.org/pdf/1512.03385.pdf)
- [Densely Connected Convolutional Networks](https://arxiv.org/pdf/1608.06993.pdf)

### Object Detection
- [Overfeat: Integrated recognition, localization and detection using convolutional networks](https://arxiv.org/pdf/1312.6229.pdf) 
- [Rich feature hierarchies for accurate object detection and semantic segmentation](https://arxiv.org/pdf/1311.2524.pdf)
- [Fast R-CNN](https://arxiv.org/pdf/1504.08083.pdf)
- [Faster R-CNN: Towards Real-Time Object Detection with Region Proposal Networks](https://arxiv.org/pdf/1506.01497.pdf)
- [You Only Look Once: Unified, Real-Time Object Detection](https://arxiv.org/pdf/1506.02640.pdf)
- [YOLO9000: Better, Faster, Stronger](https://arxiv.org/pdf/1612.08242.pdf)
- [YOLOv3: An Incremental Improvement](https://arxiv.org/pdf/1804.02767.pdf)
- [YOLOv4: Optimal Speed and Accuracy of Object Detection](https://arxiv.org/pdf/2004.10934.pdf)

### Localization & Segmentation
- [U-Net: Convolutional Networks for Biomedical Image Segmentation](https://arxiv.org/pdf/1505.04597.pdf)
- [Learning deep features for discriminative localization](https://arxiv.org/pdf/1512.04150.pdf)
- [Grad-CAM: Visual Explanations from Deep Networks via Gradient-based Localization](https://arxiv.org/pdf/1610.02391.pdf)