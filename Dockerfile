FROM golang:1.9

# install dependencies
RUN go get github.com/Shopify/sarama
RUN go get github.com/wvanbergen/kafka/consumergroup

# env
ENV ZOOKEEPER_HOST dev.localhost
ENV ZOOKEEPER_PORT 2181
ENV TOPIC dbserver1.inventory.customers

# copy app
ADD . /app
WORKDIR /app

# build
RUN go build -o build/consumer src/*.go

ENTRYPOINT ["/app/docker-entrypoint.sh"]