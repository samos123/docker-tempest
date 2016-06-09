FROM ubuntu:xenial

MAINTAINER Sam Stoelinga <sammiestoel@gmail.com>
ENV version=12.0.0

RUN apt-get update && \
    apt-get install -y python python-pip git python-setuptools libffi6 libffi-dev libssl1.0.0 libssl-dev \
                       iputils-ping curl && \
    git clone https://github.com/openstack/tempest.git /tempest && \
    cd /tempest && \
    git checkout $version && \
    pip install --no-cache-dir . && \
    apt-get clean && \
    apt-get remove -y --auto-remove python-setuptools python-dev make gcc libffi-dev libssl-dev && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /tempest /root/.cache

RUN mkdir /tempest-home
WORKDIR /tempest-home
