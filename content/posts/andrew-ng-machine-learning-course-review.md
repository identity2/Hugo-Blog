---
title: "Andrew Ng Machine Learning Course Review and Brief Notes"
date: 2019-06-15T10:02:39+08:00
draft: false
---

Just completed the renowned [Andrew Ng's Machine Learning course](https://www.coursera.org/learn/machine-learning) (on Coursera) these couple of days. Since many people are curious about this course, I will do a quick write up on how I think about this course and what I actually learned.

# About the Instructor
Andrew Ng is the co-founder of Google Brain and Coursera, and an adjunct professor at Stanford University. He was also a former vice president and chief scientist at Baidu working on large scale artificial intelligence projects. Therefore, without a doubt, Andrew Ng is one of the most knowledgeable people in the world for teaching machine learning.

# About the Course
Since this is an introduction to machine learning course, very little mathematics and nearly zero statistics background is required. However, people familiar with probability/statistics, vector calculus, and linear algebra will find it a lot easier to understand the formulas and the mathematical derivations. Furthermore, a couple videos are provided between the course for reviewing some basic concepts of linear algebra and manipulations of matrices which would be used in the programming exercises.

<br />

Though Python is the most popular language for machine learning nowadays, the course is taught in Matlab (or Octave). To many, this might be a minus for the course, but I find it simpler to implement the machine learning algorithms in Octave than in Python due to the cleaner syntax (for math equations). This lets us focus on the mathematical equations and the machine learning concepts themselves rather than the details of programming languages. As for programming background, I would say that familiarity with the basics of programming (i.e. loops, if-statements, assignments, operators, etc.) is sufficient for you to handle the programming exercises.

<br />

Andrew Ng delivers course materials very clear and with details, but his voice is a little soft and requires additional attention to follow through.

<br />

Overall, this is a pretty decent course for beginners to get a broad understanding of how machine learning works.

# Topics Covered
### Introduction
This is a brief section which introduces different methods in machine learning, such as **supervised learning**, **unsupervised learning**, **regression problem**, **classification problem**, **clustering**, and so on. You would understand the relations of different problems with certain algorithms in machine learning.

### Linear Regression
**Hypothesis**, **Cost Function** and **Gradient Descent** are introduced in this section. It starts with single variable linear regression and moves on to the more complex multi-variable linear regression.

##### For multivariate linear regression:

**Hypothesis:** $h_θ(x)=θ^T X$

**Cost Function (m training data):** $J(θ) = \frac{1}{2m}\sum_{i=1}^{m}(h_θ(x^{(i)})-y^{(i)})^2$

**Gradient Descent:** $θ_j := θ_j - \alpha \frac{\partial}{\partial θ_j}J(θ)$

### Linear Algebra Review
This section briefly reviews some of the basic concepts of linear algebra such as matrix multiplication, addition, subtraction, etc. People experienced with linear algebra would find this section super easy and might want to skip it.

### Octave Tutorial
The basic syntax of Octave programming language is introduced here. Since Octave is practically a carbon copy of Matlab, so people with good knowledge in Matlab could skip this section. However, those who are not familiar with scientific programming languages like Matlab would find this section useful because you will learn how to manipulate matrices in programming languages as well as vectorizing a problem.

### Logistic Regression
**Sigmoid function**, **One-vs-All**, **advanced optimization algorithms**, and the **Cost Function for Logistic Regression** are taught in this section. You will get a nice intuition about the sigmoid function and how it relates to probability theory. Furthermore, you will understand how sigmoid function is used to set the decision boundary of a classification problem. Some advanced optimization algorithms (Conjugate Gradient, BFGS, L-BFGS) are also mentioned in the course, but the instructor does not get into the details of them (since it will be too difficult). Lastly, the important One-vs-All concept is introduced in the course to tackle multiclass classification problems.

##### For Logistic Regression (m training data):

**Sigmoid Function:** $g(z)=\frac{1}{1+e^{-z}}$

**Hypothesis:** $h_θ=g(θ^T x)$

**Cost Function:** $J(θ)=-\frac{1}{m}\sum _{i=1}^{m}(y^{(i)} \log{h_θ(x^{(i)})}+(1-y^{(i)})\log{(1-h_θ(x^{(i)}))})$

### Regularization
This section discusses some common ways to address overfitting, that is, **Model Selection**, **Feature Selection**, and the most important **Regularization**. It shows that by penalizing the magnitude of the parameters, the curve would less likely to overfit the dataset.

##### Linear Regression with Regularization (m training data, n features):

**Cost Function:** $J(θ) = \frac{1}{2m}\sum _{i=1}^{m}((h_θ(x^{(i)})-y^{(i)})^2+\lambda \sum _{j=1}^{n} θ_j^2)$

**Gradient Descent:**

$θ_0 := θ_0 - \alpha\frac{1}{m}\sum _{i=1}^{m}((h_θ(x^{(i)})-y^{(i)})x_0^{(0)}$

$θ_j := θ_j - \alpha(\frac{1}{m}\sum _{i=1}^{m}((h_θ(x^{(i)})-y^{(i)})x_j^{(0)}-\frac{\lambda}{m}θ_j)$

##### Logistic Regression with Regularization (m training data, n features):

**Cost Function:** $J(θ)=-\frac{1}{m}\sum_{i=1}^{m}(y^{(i)}\log{h_θ(x^{(i)})}+(1-y^{(i)})\log{(1-h_θ(x^{(i)}))})+\frac{\lambda}{2m}\sum _{j=1}^{n} θ_j^2$

**Gradient Descent:**

$θ_0 := θ_0 - \alpha\frac{1}{m}\sum _{i=1}^{m}((h_θ(x^{(i)})-y^{(i)})x_0^{(0)}$

$θ_j := θ_j - \alpha(\frac{1}{m}\sum _{i=1}^{m}((h_θ(x^{(i)})-y^{(i)})x_j^{(0)}-\frac{\lambda}{m}θ_j)$

### Neural Networks
In recent years, the study of neural networks became increasingly popular due to the advance in computing power and the abundance of data collected. As a result, the instructor spent quite some time discussing the topics of neural networks. **Forward Propagation**, **Back Propagation**, and **One-Hot Encoding** are introduced, but the deeper mathematical derivations are skipped so the technical level is manageable for beginners.

##### Forward Propagation (m training data, n features, L layers, K classes):
**Feature:** $x = a^{(1)} = \begin{bmatrix}x_0 \\\ x_1 \\\ ... \\\ x_n \end{bmatrix}$

<br />

**Activation:** $a^{(i)} = g(Θ^{(i-1)} a^{(i-1)})$

**Cost Function:** $J(Θ) = -\frac{1}{m}\sum _{i=1}^{m} \sum _{k=1}^{K}(y_k^{(i)}\log(h_θ(x^{(i)}))_k+(1-y_k^{(i)})\log(1-(h_θ(x^{(i)})))) + \frac{\lambda}{2m}\sum _{l=1}^{L-1} \sum _{i=1}^{s_l} \sum _{j=1}^{s_l+1} (Θ _{ji}^{(l)})^2$

##### Back Propagation (L layers):

$\delta ^{(L)} = a^{(L)}-y$

$\delta ^{(l)} = (Θ^{(l)})^T \delta ^{(l+1)} a^{(l)} .* (1-a^{(l)})$

$\frac{\partial}{\partial Θ _{ij}^{(l)}} J(Θ) = a_j^{l} \delta _i^{(l+1)}$

($.*$ means element-wise multiplication.)

### Debugging: Variance vs. Bias
This section gives us some useful techniques in debugging a machine learning system, including **Cross Validation Set**, **Bias**, **Variance**, etc. It also introduces some common terms such as **Precision**, **Recall**, and **F1 Score**. After studying this section, you will have a better intuition on how to solve machine learning bugs by plotting the learning curves.

### Support Vector Machines
**Support Vector Machine (SVM)** is another solution to classification problems. The instructor does not go in depth into this subject, but still gives us a clear view on its mechanics and its intuition. The overall idea is to compute new feature depending on proximity to established *landmarks*.

### K-Means Clustering
Some unsupervised learning algorithms are introduced at the later part of the course. **K-Means Clustering** is one of them. It is used to group data into different clusters by procedurally moving centroids towards the gravity of the data points.

```
The Algorithm (m data, K clusters):

Randomly initialize K cluster centroids μ1, μ2, ..., μk
Repeat:
    for i = 1 to m:
        c(i) := index of cluster centroid closest to x(i)
    for k = 1 to K:
        μk := mean of points assigned to cluster k
```

### Principal Component Analysis
To visualize or compress data, we commonly need to shrink the number of dimensions of a set of data. **Principal Component Analysis** allows us to approximate and transform high-dimensional feature sets into lower dimensional ones.

### Anomaly detection
This is another useful unsupervised learning algorithm. It adopts **Density Estimation** to find out which  are anomalies in a large set of data points. Gaussian distribution and Multivariate Gaussian distribution would be mentioned and explained briefly in this section.

### Recommender System
Couple algorithms for building a movie recommender system are introduced in this section. **Feature Learning**, **Collaborative Filtering**, and **Content-Based Recommender System** are discussed in depth with details of their implementations.

### Large Scale Machine Learning
Some concerns about large scale machine learning systems are discussed in this section. For example, **Batch Gradient Descent** and **Stochastic Gradient Descent** are compared. Other techniques such as **Online Learning** and **Map-Reduce** are also introduced here.

### Example: Photo OCR
Lastly, an example of an application of machine learning is introduced. The instructor shows us the whole machine learning pipeline of how the system is designed and and it works.

# Post Scripts
Not until I finished taking this course did I notice the vastness of machine learning. It is really a mathematics-involved field with a steep learning curve. Seeing almost 90% of my fellow Computer Science classmates pursuing this career path makes me wonder how many of them can really make it. As for me, I'll probably just play with the "applied side" of machine learning instead of doing it for a living.
