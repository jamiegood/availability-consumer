
## Description
We want capture changes to a source mysql DB, put them onto Kafka topic and consume the changes using a Go consumer. Then we want to save those changes to a NoSQL DB.

## Setup Kafka, Debezium, Mysql
Follow the Debezium tutorial https://debezium.io/docs/tutorial/ to get zookeeper, kafka, mysql and mysql connector running.

Next Build the Co consumer docker container:
docker build --tag jamie/consumer:1.0 .

## Run 
Run all the docker containers as per the above Debezium tutorial

Next run the go consumer container:

docker run -it --name consumer --rm --link zookeeper:zookeeper --link kafka:kafka jamie/consumer:1.0 


## Todo

The go consumer reads the messages from the kafka topic.

Next we want to 'transform' data and save to a nosql DB

## References:

https://medium.com/rahasak/kafka-consumer-with-golang-a93db6131ac2

https://debezium.io/docs/tutorial/ 