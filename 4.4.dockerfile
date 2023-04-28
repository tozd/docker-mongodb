FROM registry.gitlab.com/tozd/docker/runit:ubuntu-focal

EXPOSE 27017/tcp

VOLUME /var/lib/mongodb
VOLUME /var/log/mongod

# We use a workaround for /usr/bin/systemctl which seems this package requires during install.
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 20691EEC35216C63CAF66CE1656408E390CFB1F5 && \
  echo "deb http://repo.mongodb.org/apt/ubuntu $(cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2)/mongodb-org/4.4 multiverse" > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update -q -q && \
  ln -s /bin/true /usr/bin/systemctl && \
  apt-get install --yes --force-yes mongodb-org && \
  rm /usr/bin/systemctl && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

COPY ./etc/service/mongod /etc/service/mongod
COPY ./etc/mongodb.conf /etc/mongodb.conf
