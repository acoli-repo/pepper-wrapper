# Dockerfile

FROM ubuntu:20.04
MAINTAINER Christian Chiarcos <christian.chiarcos@gmail.com>

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# dependencies
RUN apt-get install -y git make unzip wget

# clone pepper-wrapper
RUN git clone https://github.com/acoli-repo/pepper-wrapper && \
    wget -nc https://korpling.german.hu-berlin.de/saltnpepper/pepper/download/stable/Pepper_2021.03.01.zip -O pepper-wrapper/Pepper.zip && \
    cd pepper-wrapper && \
    unzip Pepper.zip
