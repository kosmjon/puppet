#!/bin/sh
for i in /usr/java/jdk1.7.0_25/bin/* ; do \
  f=$(basename $i); echo $f; \
  sudo alternatives --install /usr/bin/$f $f $i 20000 ; \
  sudo update-alternatives --config $f ; \
done

cd /etc/alternatives
sudo ln -sfn /usr/java/jdk1.7.0_25 java_sdk
cd /usr/lib/jvm
sudo ln -sfn /usr/java/jdk1.7.0_25/jre jre


