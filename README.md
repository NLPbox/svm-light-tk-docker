svm-light-tk-docker
===================

[SVM-LIGHT-TK](http://disi.unitn.it/moschitti/Tree-Kernel.htm) is a library
providing implementations of tree kernels (SubSet Tree kernel and Subtree kernel)
for machine learning. This repository allows you to install the software in a
[docker](https://www.docker.com/) container with one simple command.

Installation
============

``docker build -t treekernel https://github.com/nlpdocker/svm-light-tk-docker.git``


Usage
=====

```bash
# run the container and make your /tmp directory available to it
docker run -v /tmp:/tmp -ti treekernel

# train a model on Moschitti's example data
$ ./svm_learn example-data/arg0.train 
Scanning examples...done
Reading examples into memory...100..OK. (113 examples read)

Number of examples: 113, linear space size: 21479

estimating ...
Setting default regularization parameter C=0.1330
Optimizing...................................................................done. (68 iterations)
Optimization finished (14 misclassified, maxdiff=0.00047).
Runtime in cpu-seconds: 0.00
Number of SV: 78 (including 35 at upper bound)
L1 loss: loss=26.64432
Norm of weight vector: |w|=1.83103
Norm of longest example vector: |x|=2.82843
Estimated VCdim of classifier: VCdim<=27.82150
Computing XiAlpha-estimates...done
Runtime for XiAlpha-estimates in cpu-seconds: 0.00
XiAlpha-estimate of the error: error<=32.74% (rho=1.00,depth=0)
XiAlpha-estimate of the recall: recall=>69.64% (rho=1.00,depth=0)
XiAlpha-estimate of the precision: precision=>66.10% (rho=1.00,depth=0)
Number of kernel evaluations: 5049
Writing model file...done


# test your model
$ ./svm_classify example-data/arg0.test svm_model output.txt       
Reading model...OK. (78 support vectors read)
Classifying test examples..100..done
Runtime (without IO) in cpu-seconds: 0.00
Accuracy on test set: 77.68% (87 correct, 25 incorrect, 112 total)
Precision/recall on test set: 78.18%/76.79%
```
