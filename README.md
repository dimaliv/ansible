# Ansible docker image

Production ready Ansible with Molecule docker image based on official [Alpine Python docker image](https://hub.docker.com/_/python).

## Build requirements

Software:

* [Docker](https://www.docker.com/)
* [GNU Make](https://www.gnu.org/software/make/) - optioanly

## How to build image

To build Ansible Docker image run:

```sh
make
```

or:

```sh
docker compose build
```

As result you get latest version of Ansible Docker image.

## Build specific versions

To build specific Ansible version image run:

```sh
ANSIBLE_VERSION=8 make
```

To build specific Molecule version image run:

```sh
MOLECULE_VERSION=6 make
```

To build specific Python version Docker base image:

```sh
PYHTON_BASE_IMAGE_VERSION=3.10 make
```

## Run work container

Run work container with Ansible inside:

```sh
make docker-run
```

## How to use Ansible

Bind your Ansible project root directory to "/ansible" container directory. Here is a docker compose example:

```yaml
version: "3.8"

services:
  ansible:
    image: dimaliv/ansible:8
    volumes:
      - ./ansible:/ansible
```

## How to use Molecule

Bind your Molecule project root directory to "/[molecule_role_name]" container directory. Here is a docker compose example:

```yaml
version: "3.8"

services:
  molecule:
    image: dimaliv/ansible:8
    working_dir: /molecule_role
    command: molecule test
    volumes:
      - ./:/molecule_role
```

## Licence

MIT
