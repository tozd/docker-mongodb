FROM registry.gitlab.com/tozd/docker/runit:ubuntu-bionic

EXPOSE 27017/tcp

VOLUME /var/lib/mongodb
VOLUME /var/log/mongod

RUN apt-get update -q -q && \
  apt-get install --yes --force-yes mongodb && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

COPY ./etc/service/mongod /etc/service/mongod
COPY ./etc/mongodb.conf /etc/mongodb.conf
