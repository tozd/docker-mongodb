FROM registry.gitlab.com/tozd/docker/dinit:ubuntu-bionic

EXPOSE 27017/tcp

VOLUME /var/lib/mongodb
VOLUME /var/log/mongod

# We use a workaround for /usr/bin/systemctl which seems this package requires during install.
# It also sets trusted=yes because the key has expired.
RUN mkdir ~/.gnupg && echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf && \
  apt-key adv --homedir ~/.gnupg --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 && \
  echo "deb [trusted=yes] http://repo.mongodb.org/apt/ubuntu $(cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2)/mongodb-org/4.0 multiverse" > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update -q -q && \
  ln -s /bin/true /usr/bin/systemctl && \
  apt-get install --yes --force-yes mongodb-org && \
  rm /usr/bin/systemctl && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm ~/.gnupg

COPY ./etc/service/mongod /etc/service/mongod
COPY ./log-3.0 /etc/service/mongod/log
COPY ./etc-2.6/mongodb.conf /etc/mongodb.conf
