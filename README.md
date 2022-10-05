# docker-cdo
A docker image that contains CDO, the Climate Data Operators application

Based on work done by https://github.com/alexgleith/docker-cdo

# A brief howto

You can run this with `docker run daniel/cdo`. For example, find out the version and format support with `docker run daniel/cdo cdo --version`.

You can also run it with a local folder mounted, so that you can process a dataset:

```
docker run --rm -v /tmp:/tmp daniel/cdo cdo sinfov /tmp/example.grb

```

Or start up an interactive prompt like:

```
docker run --rm -v /tmp:/tmp daniel/cdo bash

```

# Building etc.

This repo contains a Dockerfile and a Makefile. You can build the dockerfile with `docker build .` or by running `make build`.

You can run a shell with any directory mounted inside the `/data` folder on the container by using `make shell datadir=<my folder>`.
