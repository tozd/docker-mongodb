FROM registry.gitlab.com/tozd/docker/dinit:ubuntu-bionic

EXPOSE 27017/tcp

VOLUME /var/lib/mongodb
VOLUME /var/log/mongod

RUN apt-get update -q -q && \
  apt-get install --yes --force-yes mongodb && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

COPY ./etc/service/mongod /etc/service/mongod
COPY ./log-3.0 /etc/service/mongod/log
COPY ./etc/mongodb.conf /etc/mongodb.conf
