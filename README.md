# tozd/mongodb

https://gitlab.com/tozd/docker/mongodb

Image providing [MongoDB](https://www.mongodb.org/) as a service.

Different Docker tags provide different MongoDB versions.

You should make sure you mount data volume (`/var/lib/mongodb`) so that you do not
lose database data when you are recreating a container. If a volume is empty, image
will initialize it at the first startup.

`/var/lib/mongodb/mongodb.conf` is used for configuration and you can modify it as needed.
Because it is inside the data volume it is initialized the first time to defaults if the
volume is empty.

If you are extending this image, you can add a script `/etc/service/mongod/run.initialization`
which will be run at a container startup, after the container is initialized, but before the
MongoDB daemon is run.
