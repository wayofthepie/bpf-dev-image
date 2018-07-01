FROM ubuntu:xenial

RUN apt-get update -y && apt-get install apt-transport-https -y &&\
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D4284CDD &&\
  echo "deb https://repo.iovisor.org/apt/xenial xenial main" | tee /etc/apt/sources.list.d/iovisor.list &&\
  apt-get update -y && apt-get install bcc-tools libbcc-examples linux-headers-$(uname -r) -y
