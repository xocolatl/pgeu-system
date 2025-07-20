# Docker runtime for development

This directory contanis scripts and files to set up a Docker
environment for development. It creates a docker runtime container
named `postgresqleu/runtime:latest` which aims to be as close as
possible to the systems that the PostgreSQL infrastructure team runs
in production.

It specifically does *not* create a complete container for running the
system. Instaed, it is set up to mount the git checkout to `/pgeu` at
runtime, so that during development the container can be left running
while files are being edited instead of having to be rebuilt.

## Getting started

Build the container by running:

```
./build.sh
```

You also need to create a `local_settings.py` file that has all
parameters you wish to override.

## Running the server

To run the server, just run:

```
./run.sh
```

If you wish to change the port from the default `8002`, set the
variable `HTTP_PORT` before running, like:

```
HTTP_PORT=9000 ./run.sh
```

## Running migrations and other management commands

To run management comments such as migrations, just append it to the
run command, like:

```
./run.sh python manage.py migrate
```
