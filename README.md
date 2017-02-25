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
# get the services list from server
services()
  : onSet(|servicesList| {
    servicesList: each(|service| { println(service) })
  })
  : onFail(|error| { # if failed
    println("😡: " + error: message())
  })

# use operations of the "calculator:42" service
operations("calculator:42")
  : onSet(|operations| {

    operations: product(7, 10): onSet(|data|-> println(data: result())) # == 70

    operations: divide(50, 10): onSet(|data|-> println(data: result())) # == 5

    operations: addition(40, 2): onSet(|data|-> println(data: result())) # == 42

    operations: concat(DynamicObject(): a("Hello"): b(" world!!!"))
      : onSet(|data|-> println(data: result())) # Hello world!!!

  })
  : onFail(|error| { # if failed
    println("😡: " + error: message())
  })
```
