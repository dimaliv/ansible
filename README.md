# Ansible docker image

Ansible docker image based on official [Python docker image](https://hub.docker.com/_/python).

## Requirements

Software:

* [Docker](https://www.docker.com/)
* [GNU Make](https://www.gnu.org/software/make/)

## Build image

To build Ansible image run:

```sh
make
```

To build specific Ansible version image run:

```sh
ANSIBLE_VERSION=8 make
```

Also you can set Python version Docker base image:

```sh
PYHTON_BASE_IMAGE_VERSION=3.10 make
```

## Run working container

Run:

```sh
make docker-run
```

## Licence

MIT
