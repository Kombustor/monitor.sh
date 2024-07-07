FROM debian:stable-slim

RUN set -x && \
    apt-get update && \
    apt-get install -y --no-install-recommends bash bc bluez bluez-hcidump ca-certificates curl git mosquitto-clients xxd && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/andrewjfreyer/monitor.git /monitor

VOLUME ["/monitor", "/config"]
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
WORKDIR /monitor

CMD ["/bin/bash" "monitor.sh" "-D" "/config"]
