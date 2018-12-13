FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

ADD jdk-8u51-linux-x64.tar.gz /opt/jdk

ENV JAVA_HOME /opt/jdk/jdk1.8.0_51

RUN cd /opt/jdk && \    
    update-alternatives --install /usr/bin/java  java  /opt/jdk/jdk1.8.0_51/bin/java 100 && \    
    update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_51/bin/javac 100 && \    
    update-alternatives --install /usr/bin/jar   jar   /opt/jdk/jdk1.8.0_51/bin/jar 100 

CMD ["bin/bash"]

