FROM alpine:3.6

RUN apk add --update --no-cache bash

ADD jdk-8u51-linux-x64.tar.gz /opt/jdk

ENV JAVA_HOME /opt/jdk/jdk1.8.0_51
ENV PATH /opt/jdk/jdk1.8.0_51/bin:${PATH}

CMD ["bin/bash"]

