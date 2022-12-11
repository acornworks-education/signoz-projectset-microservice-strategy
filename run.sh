#!/bin/bash

./gradlew build

export OTEL_METRICS_EXPORTER=none
export OTEL_LOGS_EXPORTER=otlp
export OTEL_EXPORTER_OTLP_ENDPOINT="http://localhost:4317"
export OTEL_RESOURCE_ATTRIBUTES=service.name=strategy 

java -javaagent:lib/opentelemetry-javaagent.jar -jar build/libs/projectset-0.0.1-SNAPSHOT.jar