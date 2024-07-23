FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y expect wget openssh-client telnet nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /zone
