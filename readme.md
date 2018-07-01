# BPF Development Environment
A docker image for working with BPF, specifically BCC 
(BPF Compiler Chain, see https://github.com/iovisor/bcc/)

# Building and Running
To build simply run `./build.sh` passing an image tag as the only param:

```
$ ./build.sh bccdev
```

To allow programs inside the container to trace you will need to manually mount in `/sys` as `rw` 
and the container will need to be run privileged -
there may be more fine grained permissions that can be applied but I'm not sure what yet:

```
$ docker run --privileged -ti \
  --net host \
  -v /sys:/sys:rw \
  -e DISPLAY=$DISPLAY \
  -v "$HOME/.Xauthority:/root/.Xauthority:rw" \
  bccdev \
  bash

root@27309f7560e7:/# /usr/share/bcc/tools/opensnoop
PID    COMM               FD ERR PATH
18454  opensnoop          -1   2 /etc/localtime
1489   pool               11   0 /etc/services
...
```

By default, if you do not specify `bash` as the command to run, VSCode will launch.
