FROM ubuntu:xenial

MAINTAINER Sam Stoelinga <sammiestoel@gmail.com>

RUN apt-get update
RUN apt-get install -y python-pip git python-setuptools libffi-dev libssl-dev

RUN git clone https://github.com/openstack/tempest.git /tempest

WORKDIR /tempest

RUN pip install .

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /tempest /root/.cache

RUN mkdir $HOME/thome
WORKDIR $HOME/thome
