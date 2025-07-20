FROM debian:bullseye-slim

ADD requirements.txt /

RUN apt-get update \
 && apt-get -y dist-upgrade \
 && apt-get -y install python3 python3-psycopg2 python3-yaml python3-virtualenv python3-tidylib python3-dateutil python3-markdown python3-pycurl python3-pylibmc python3-tz uwsgi python3-pyinotify uwsgi-plugin-python3 python3-libsass python3-requests python3-pycryptodome python3-sqlparse python3-qrencode python3-asgiref python3-pil python3-magic python3-requests-oauthlib python3-jinja2 python3-reportlab python3-cairosvg python3-jwt fonts-dejavu \
 && pip3 install -r /requirements.txt

# for debugging (the update is to populate command-not-found)
RUN apt-get -y install command-not-found git postgresql-client vim \
 && apt-get update

WORKDIR /pgeu

EXPOSE 8002

CMD [ "uwsgi", "/pgeu/tools/devsetup/docker/uwsgi.ini" ]
