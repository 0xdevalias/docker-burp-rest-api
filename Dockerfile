FROM openjdk:8-jdk-alpine
LABEL maintainer="Glenn 'devalias' Grant (@_devalias, devalias.net)"

RUN apk add --no-cache openssl ca-certificates ttf-dejavu

RUN adduser -D burp burp
USER burp
WORKDIR /home/burp

ENV BURPAPI_VERSION="1.0.2"
COPY burp-rest-api-${BURPAPI_VERSION}.jar /home/burp/burp-rest-api.jar

ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-jar", "burp-rest-api.jar"]

EXPOSE 8080 8090
