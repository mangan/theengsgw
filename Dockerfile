FROM python:alpine

RUN apk add --no-cache alpine-sdk cmake ninja openssl-dev linux-headers
RUN pip3 install --extra-index-url https://alpine-wheels.github.io/index TheengsGateway

ENV MQTT_HOST=localhost

ENTRYPOINT python3 -m TheengsGateway -H $MQTT_HOST
