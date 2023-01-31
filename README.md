# docker-cdo
A docker image that contains CDO, the Climate Data Operators application

Based on work done by https://github.com/alexgleith/docker-cdo

# A brief howto

You can run this with `docker --rm run daniel/cdo`. This will print the version information of the `cdo` executable (i.e `cdo -- version`).

To run any other `cdo`command, just place it after the docker run command, which will be trated as arguments to the executable.

You can also run it with a local folder mounted, so that you can process a dataset:

```
docker run --rm -v /tmp:/tmp daniel/cdo sinfov /tmp/example.grb
```

Or start up an interactive prompt like:

```
docker run --entrypoint /bin/bash --rm -v /tmp:/tmp daniel/cdo
```

For an interactive prompt, a makefile is set. So just issue `make shell` and go on with it. Read bellow for more info.

# Building etc.

This repo contains a Dockerfile and a Makefile. You can build the dockerfile with `docker build .` or by running `make build`.

You can run a shell with any directory mounted inside the `/data` folder on the container by using `make shell datadir=<my folder>`.
