
FROM ubuntu:14.04

MAINTAINER Arne Neumann <nlpdocker.programming@arne.cl>

RUN apt-get update && apt-get install -y gcc make wget unzip

WORKDIR /opt
RUN wget http://disi.unitn.it/moschitti/TK1.2-software/svm-light-TK-1.2.zip && \
    unzip svm-light-TK-1.2.zip && rm svm-light-TK-1.2.zip && \
    mv svm-light-TK-1.2/svm-light-TK-1.2.1 . && \
    rmdir svm-light-TK-1.2

WORKDIR /opt/svm-light-TK-1.2.1
RUN make

# add example data (containing PropBank Argument 0 as positive class
# and Argument 1 as negative class)
RUN mkdir example-data && \
    wget http://disi.unitn.it/moschitti/TK-data/TK1.2-ARG0vsARG1.tar.gz && \
    tar zxf TK1.2-ARG0vsARG1.tar.gz -C /opt/svm-light-TK-1.2.1/example-data && \
    rm TK1.2-ARG0vsARG1.tar.gz
