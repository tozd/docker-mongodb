FROM tozd/runit

EXPOSE 27017/tcp

RUN apt-get update -q -q && \
 apt-get install --yes --force-yes mongodb

COPY ./etc /etc

