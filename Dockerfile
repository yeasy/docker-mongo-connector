#This will prepare a elasticsearch node with mongo-connector enabled

FROM python:3.4.3
MAINTAINER yeasy@github

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Shanghai

# Installing Mongo Connector which will connect MongoDB and Elasticsearch
RUN pip install mongo-connector==2.0

COPY startup.sh /tmp/

# Sample usage when no commands is given outside
CMD ["/bin/bash", "/tmp/startup.sh"]

