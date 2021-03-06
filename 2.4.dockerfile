FROM registry.gitlab.com/tozd/docker/runit:ubuntu-trusty

EXPOSE 27017/tcp

VOLUME /var/lib/mongodb
VOLUME /var/log/mongod

RUN apt-get update -q -q && \
 apt-get install --yes --force-yes mongodb && \
 apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

COPY ./etc /etc
COPY ./etc-2.4 /etc
