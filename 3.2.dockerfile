FROM registry.gitlab.com/tozd/docker/dinit:ubuntu-xenial

EXPOSE 27017/tcp

VOLUME /var/lib/mongodb
VOLUME /var/log/mongod

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 42F3E95A2C4F08279C4960ADD68FA50FEA312927 && \
  echo "deb http://repo.mongodb.org/apt/ubuntu $(cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2)/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update -q -q && \
  apt-get install --yes --force-yes mongodb-org && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

COPY ./etc/service/mongod /etc/service/mongod
COPY ./log-3.0 /etc/service/mongod/log
COPY ./etc/mongodb.conf /etc/mongodb.conf
