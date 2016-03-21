Mongo Connector
===
Docker images for the mongo-connector.


# Supported tags and respective Dockerfile links

* [`latest` (latest/Dockerfile)](https://github.com/yeasy/docker-mongo-connector/blob/master/Dockerfile)

For more information about this image and its history, please see the relevant manifest file in the [`yeasy/docker-mongo-connector` GitHub repo](https://github.com/yeasy/docker-mongo-connector).

# What is docker-mongo-connector?
Docker image with mongo-connector installed. The image is built based on [Python 3.4.3](https://hub.docker.com/_/python/).

# How to use this image?
The docker image is auto built at [https://registry.hub.docker.com/u/yeasy/mongo-connector/](https://registry.hub.docker.com/u/yeasy/mongo-connector/).


## In Dockerfile
```sh
FROM yeasy/mongo-connector:latest
```

## Local Run
By default, it will connect mongo node (`$MONGO` or the mongo host, on port `$MONGOPORT` or 27017) and elasticsearch node (`$ELASTICSEARCH` or the elasticsearch host, on port $ELASTICPORT or 9200).

Boot two containers with name mongo (config to cluster) and elasticsearch.
```sh
$ docker run -d --link=mongo:mongo --link=elasticsearch:elasticsearch yeasy/mongo-connector
```

It will connect the two containers together to sync data between each other.

# Which image is based on?
The image is based on official `python:3.4.3`.

# What has been changed?

## Config TZ
Config timezone to Asia/Shanghai.


# Install mongo-connector
Install the mongo-connector:2.1.

This image is officially supported on Docker version 1.7.1.

Support for older versions (down to 1.0) is provided on a best-effort basis.

# User Feedback
## Documentation
Be sure to familiarize yourself with the [repository's `README.md`](https://github.com/yeasy/docker-mongo-connector/blob/master/README.md) file before attempting a pull request.

## Issues
If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/yeasy/docker-mongo-connector/issues).

You can also reach many of the official image maintainers via the email.

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/yeasy/docker-mongo-connector/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.
