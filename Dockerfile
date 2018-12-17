FROM ubuntu:14.04

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_SESSION_TOKEN

ENV DEBIAN_FRONTEND noninteractive


RUN apt-get -qq update && \
    apt-get -qq -y upgrade
RUN apt-get -qq -y install python3                                                                                         
RUN apt-get -qq -y install python3-pip                                                                                     
RUN apt-get -qq -y install python3-setuptools                                                                              
                                                                                                                           
RUN pip3 install awscli --upgrade                                                                                          

RUN mkdir -p /opt/jdk && \                                                                                              
    aws s3 cp s3://build-products/java/jdk-8u51-linux-x64.tar.gz /opt/jdk | tar -xJC /opt/jdk

ENV JAVA_HOME /opt/jdk/jdk1.8.0_51

RUN cd /opt/jdk && \    
    update-alternatives --install /usr/bin/java  java  /opt/jdk/jdk1.8.0_51/bin/java 100 && \    
    update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_51/bin/javac 100 && \    
    update-alternatives --install /usr/bin/jar   jar   /opt/jdk/jdk1.8.0_51/bin/jar 100 

CMD ["bin/bash"]

