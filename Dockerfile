FROM python:3.11-slim
LABEL maintainer="yeasy@github"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
ENV MONGO_CONNECTOR_VERSION=3.1.1

RUN pip install --no-cache-dir \
      "mongo-connector==${MONGO_CONNECTOR_VERSION}" \
      "elastic2-doc-manager>=0.4.0,<0.5.0" \
      "pymongo<4"

COPY startup.sh /tmp/startup.sh
RUN chmod +x /tmp/startup.sh

VOLUME ["/data"]

CMD ["/bin/bash", "/tmp/startup.sh"]

