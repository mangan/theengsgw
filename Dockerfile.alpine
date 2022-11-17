FROM python:alpine AS builder

RUN apk add --no-cache alpine-sdk cmake ninja openssl-dev linux-headers
RUN adduser -D theengsgw

ENV VIRTUAL_ENV=/home/theengsgw/venv
RUN python -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install --extra-index-url https://alpine-wheels.github.io/index TheengsGateway

FROM python:alpine

RUN apk add --no-cache libstdc++
RUN adduser -D theengsgw

WORKDIR /home/theengsgw
ENV VIRTUAL_ENV=/home/theengsgw/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY --from=builder --chown=theengsgw /home/theengsgw/venv /home/theengsgw/venv

USER theengsgw

ENV MQTT_HOST=localhost
ENTRYPOINT python -m TheengsGateway -H $MQTT_HOST
