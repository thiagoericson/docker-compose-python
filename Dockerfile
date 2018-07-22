FROM python:3.6-onbuild

MAINTAINER thiagoericson <ericson.thiago@gmail.com>

# fix osx permissions
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

# Installs, clean, and update
RUN apt-get update \
    && apt-get clean \
    && apt-get update -qqq \
    && apt-get install -y -q g++ \
    && pip install --upgrade pip \
    && apt-get install -y openssl

COPY ./requirements.txt .

RUN pip install -r requirements.txt

WORKDIR /var/app

COPY ./main.py /var/app

CMD ["python", "/var/app/main.py"]