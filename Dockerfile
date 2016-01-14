FROM nginx

MAINTAINER vadim@yummly.com

ENV NODE_VERSION v0.10.41

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
    apt-get -q -y install dnsmasq supervisor daemontools logrotate curl make g++ git && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    sed -i -e 's/# *user.*$/user=root\n/' /etc/dnsmasq.conf && \
    curl -s -S -L http://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz | tar -xzf - -C /opt && \
    NODE_PACKAGE="node-$NODE_VERSION-linux-x64" && \
    ln -fs "/opt/$NODE_PACKAGE/bin/node" /usr/bin/node && \
    ln -fs "/opt/$NODE_PACKAGE/bin/npm" /usr/bin/npm
