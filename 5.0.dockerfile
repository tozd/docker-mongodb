FROM registry.gitlab.com/tozd/docker/dinit:ubuntu-focal

EXPOSE 27017/tcp

VOLUME /var/lib/mongodb
VOLUME /var/log/mongod

# We use a workaround for /usr/bin/systemctl which seems this package requires during install.
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv F5679A222C647C87527C2F8CB00A0BD1E2C63C11 && \
  echo "deb http://repo.mongodb.org/apt/ubuntu $(cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2)/mongodb-org/5.0 multiverse" > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update -q -q && \
  ln -s /bin/true /usr/bin/systemctl && \
  apt-get install --yes --force-yes mongodb-org && \
  rm /usr/bin/systemctl && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

COPY ./etc/service/mongod /etc/service/mongod
COPY ./log /etc/service/mongod/log
COPY ./etc/mongodb.conf /etc/mongodb.conf
