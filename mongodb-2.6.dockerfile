FROM tozd/runit:ubuntu-trusty

EXPOSE 27017/tcp

VOLUME /var/lib/mongodb
VOLUME /var/log/mongod

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
 echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
 apt-get update -q -q && \
 apt-get install --yes --force-yes mongodb-org

COPY ./etc /etc
