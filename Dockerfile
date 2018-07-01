FROM ubuntu:xenial

RUN apt-get update -y && apt-get install apt-transport-https curl -y && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D4284CDD && \
  echo "deb https://repo.iovisor.org/apt/xenial xenial main" | tee /etc/apt/sources.list.d/iovisor.list && \
  apt-get update -y && apt-get install bcc-tools libbcc-examples linux-headers-$(uname -r) -y

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
  mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
  sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' && \
  apt-get update -y && apt-get install code libxss1 libgtk2.0-0 libasound2 git -y

CMD ["code", "--user-data-dir", "/opt", "--verbose"]
