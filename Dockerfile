FROM alpine:3.4

MAINTAINER Sam Stoelinga <sammiestoel@gmail.com>
ENV version=12.1.0

RUN apk add --update --no-cache python py-pip git python-dev libffi libffi-dev openssl openssl-dev \
                  build-base iputils bash curl linux-headers && \
    git clone https://github.com/openstack/tempest.git /tempest && \
    cd /tempest && \
    git checkout $version && \
    pip install --no-cache-dir . && \
    apk del build-base linux-headers python-dev libffi-dev openssl-dev && \
    rm -rf /var/cache

RUN mkdir /tempest-home
WORKDIR /tempest-home
