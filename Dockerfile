FROM python:alpine

RUN apk add --no-cache alpine-sdk cmake ninja openssl-dev linux-headers

ENV MQTT_HOST=localhost

ENTRYPOINT python3 -m TheengsGateway -H $MQTT_HOST
