FROM jc21/rpmbuild-centos8:latest

MAINTAINER Jamie Curnow <jc@jc21.com>
LABEL maintainer="Jamie Curnow <jc@jc21.com>"

USER root

# Golang
RUN wget https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz -O /tmp/golang.tgz \
  && cd /tmp \
  && tar -xzf golang.tgz \
  && mv go /usr/local/ \
  && rm -rf go* \
  && mkdir -p /home/rpmbuilder/go/bin \
  && chown -R rpmbuilder:rpmbuilder /home/rpmbuilder/go

USER rpmbuilder
ENV PATH="/usr/local/go/bin:/home/rpmbuilder/go/bin:${PATH}"
