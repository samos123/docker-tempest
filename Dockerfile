FROM ubuntu:xenial

MAINTAINER Sam Stoelinga <sammiestoel@gmail.com>
ENV version=master

RUN apt-get update
RUN apt-get install -y python-pip git python-setuptools libffi-dev libssl-dev \
                       iputils-ping vim curl

RUN git clone https://github.com/openstack/tempest.git /tempest

WORKDIR /tempest

RUN git checkout $version
RUN pip install .


RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /tempest /root/.cache

RUN mkdir $HOME/tempest-home
WORKDIR $HOME/tempest-home
