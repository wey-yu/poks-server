# poks-server
Microservices discovery server

## Build

```shell
mvn package
```

## Dependencies

https://github.com/wey-yu/poks-core-libs

## Run

⚠️ You need to set some environment variables

- `SERVER_CREDENTIALS` a kind of token or password (services must send the same token)
- `PORT` this is the http port (**poks-server** is a web application)
- `REDIS_URL` (**poks-server** persist data with Redis, so you need a Redis server)

```shell
#!/bin/bash
export SERVER_CREDENTIALS=canarybay
export PORT=8080
export REDIS_URL=localhost

mvn exec:java
# or java -jar target/poks-server-0.0.1-SNAPSHOT-jar-with-dependencies.jar
```

## Write a microservice

> 🚧 WIP

- see https://github.com/wey-yu/poks-service

## Consuming a microservice

> 🚧 WIP

- see https://github.com/wey-yu/poks-consumer

```golo
  operations("calculator:42")
    : onSet(|operations| {
      let product = operations: find(|operation| -> operation: name(): equals("product"))

      product: run([7, 10])
        : onSet(|data|-> println(data: result())) # == 70

      let divide = operations: find(|operation| -> operation: name(): equals("divide"))

      divide: run([50, 10])
        : onSet(|data|-> println(data: result())) # == 5

      let addition = operations: find(|operation| -> operation: name(): equals("addition"))

      addition: run([40, 2])
        : onSet(|data|-> println(data: result())) # == 42

    })
    : onFail(|error| { # if failed
      println("😡: " + error: message())
    })
```
