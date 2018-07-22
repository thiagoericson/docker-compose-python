# docker-compose-python

A simple Compose for running scripts Python 3.6 on Docker. 

## Build Setup

### build
`docker build . -t thiagoericson/python`

### How to use the image created with docker-compose

```
version: '3'
services:
  python:
    image: thiagoericson/python:latest
    container_name: docker_compose_python
    working_dir: /var/app/docker_compose_python
    volumes:
      - .:/var/app/docker_compose_python
```

### run default script (main.py)
`docker-compose run python`

```
docker run -v `pwd`:/var/app --name=thiagopython --rm thiagoericson/python
```

### run custom script

```
docker run -v `pwd`:/var/app --name=thiagopython --rm thiagoericson/python python file
```

### run with docker-compose 
`docker-compose run python custom.py`

