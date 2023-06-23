FROM ubuntu:latest

COPY install-tools.sh /tmp

RUN bash /tmp/install-tools.sh