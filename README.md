# tozd/mongodb

<https://gitlab.com/tozd/docker/mongodb>

Available as:

- [`tozd/mongodb`](https://hub.docker.com/r/tozd/mongodb)
- [`registry.gitlab.com/tozd/docker/mongodb`](https://gitlab.com/tozd/docker/mongodb/container_registry)

## Image inheritance

[`tozd/base`](https://gitlab.com/tozd/docker/base) ← [`tozd/runit`](https://gitlab.com/tozd/docker/runit) ← `tozd/mongodb`

## Tags

- `2.4`: MongoDB 2.4
- `2.6`: MongoDB 2.6
- `3.2`: MongoDB 3.2
- `3.4`: MongoDB 3.4
- `3.6`: MongoDB 3.6
- `4.0`: MongoDB 4.0
- `4.2`: MongoDB 4.2
- `4.4`: MongoDB 4.4
- `5.0`: MongoDB 5.0
- `6.0`: MongoDB 6.0

## Volumes

- `/var/log/mongod`: Log files.
- `/var/lib/mongodb`: Persist this volume to not lose state.

## Ports

- `27017/tcp`: Port on which MongoDB listens.

## Description

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

## GitHub mirror

There is also a [read-only GitHub mirror available](https://github.com/tozd/docker-mongodb),
if you need to fork the project there.
