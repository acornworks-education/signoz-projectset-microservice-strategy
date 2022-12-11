FROM amazoncorretto:11

COPY build/libs/projectset-*.jar boot.jar
COPY src/main/resources/application.yaml application.yaml
COPY lib/opentelemetry-javaagent.jar opentelemetry-javaagent.jar

ENV OTEL_METRICS_EXPORTER=none
ENV OTEL_LOGS_EXPORTER=otlp
ENV OTEL_RESOURCE_ATTRIBUTES=service.name=strategy 

ENTRYPOINT ["java", "-javaagent:opentelemetry-javaagent.jar", "-jar", "boot.jar"]