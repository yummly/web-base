FROM node:0.10

MAINTAINER vadim@yummly.com

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
    apt-get -q -y install dnsmasq nginx supervisor daemontools logrotate && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    sed -i -e 's/# *user.*$/user=root\n/' /etc/dnsmasq.conf
