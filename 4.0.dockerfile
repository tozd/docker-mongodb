FROM registry.gitlab.com/tozd/docker/runit:ubuntu-bionic

EXPOSE 27017/tcp

VOLUME /var/lib/mongodb
VOLUME /var/log/mongod

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 && \
 echo "deb http://repo.mongodb.org/apt/ubuntu $(cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2)/mongodb-org/4.0 multiverse" > /etc/apt/sources.list.d/mongodb.list && \
 apt-get update -q -q && \
 apt-get install --yes --force-yes systemd mongodb-org && \
 apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

COPY ./etc /etc
