FROM python:latest AS builder

RUN adduser --disabled-password --gecos "" theengsgw

ENV VIRTUAL_ENV=/home/theengsgw/venv
RUN python -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN apt update; yes|apt install cmake ninja-build
RUN pip install --extra-index-url=https://www.piwheels.org/simple TheengsGateway

FROM python:slim

RUN adduser --disabled-password --gecos "" theengsgw

WORKDIR /home/theengsgw
ENV VIRTUAL_ENV=/home/theengsgw/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY --from=builder --chown=theengsgw /home/theengsgw/venv /home/theengsgw/venv

USER theengsgw

ENV MQTT_HOST=localhost
ENTRYPOINT python -m TheengsGateway -H $MQTT_HOST
