FROM ubuntu:trusty

MAINTAINER vadim@yummly.com

ENV NODE_VERSION 0.10.36

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
    apt-get -q -y install dnsmasq nginx supervisor openssh-server daemontools logrotate curl make g++ && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    sed -i -e 's/# *user.*$/user=root\n/' /etc/dnsmasq.conf && \
    curl -s -S -L http://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz | tar -xzf - -C /opt && \
    ln -fs "/opt/$NODE_PACKAGE/bin/node" /usr/bin/node && \
    ln -fs "/opt/$NODE_PACKAGE/bin/npm" /usr/bin/npm
