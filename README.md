# Tempest Docker Image (Ubuntu Xenial and Alpine versions)

[![Build Status](https://travis-ci.org/samos123/docker-tempest.svg?branch=master)](https://travis-ci.org/samos123/docker-tempest)  
Latest tempest master and releases available via Docker Cloud 
tempest easily in both offline and online environments. 
The following versions/tags are available:

| Tempest Version  |  Docker Hub Tag  |
| ---------------- |  --------------- |
| master(Ubuntu 16.04) |  [latest](https://hub.docker.com/r/samos123/tempest/tags/) |
| 12.0.0(Ubuntu 16.04) |  [12.0.0](https://hub.docker.com/r/samos123/tempest/tags/) |
| master(Alpine 3.4) |  [latest](https://hub.docker.com/r/samos123/tempest/tags/) |
| 12.0.0(Alpine 3.4) |  [12.0.0](https://hub.docker.com/r/samos123/tempest/tags/) |

Available on Docker Hub registry: [samos123/tempest](https://hub.docker.com/r/samos123/tempest/)  
Source Code on Github: [samos123/docker-tempest](https://github.com/samos123/docker-tempest)

## Running tempest

Create a tempest home directory which will be mounted by the container:

    mkdir tempest-home

Run the tempest container by mounting the created tempest home directory
and executing bash inside the container:

    docker run -v tempest-home:/tempest-home -it samos123/tempest bash

Inside the tempst home initialize a new tempest configuration

    tempest init

You will now have etc/tempest.conf and etc/tempest.conf.sample inside
your tempest home. You should configure etc/tempest.conf to match your needs.
After you've done so can run tempest tests with:

    ostestr --regex '(?!.*\[.*\bslow\b.*\])(^tempest\.(api|scenario))'

For configuration please visit: [Tempest Configuration Documentation](http://docs.openstack.org/developer/tempest/configuration.html).

Extra bonus command: Run tempest and generate HTML reports

    ostestr --regex '(?!.*\[.*\bslow\b.*\])(^tempest\.(api|scenario))' --subunit --no-pretty >> tempest-results.log
    subunit2html tempest-results.log tempest-results.html

## Creating a raw docker image for offline usage

Create a tar archive of the latest docker tempest image:

    docker pull samos123/tempest:latest
    docker save samos123/tempest:latest > docker-tempest.tar

## Importing from raw tar archive
Note: This is only required if you're using the Raw Image.
The following steps can be used to import the downloaded Raw Image .tar image file:

    docker load -i docker-tempest.tar
    imgid=$(docker images | grep "<none>" | awk '{ print $3 }')
    docker tag $imgid samos123/tempest:latest
