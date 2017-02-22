#!/bin/bash
export SERVER_CREDENTIALS=canarybay
export PORT=8080
export REDIS_URL=localhost

mvn package
mvn exec:java
