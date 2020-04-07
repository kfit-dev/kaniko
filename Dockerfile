FROM gcr.io/kaniko-project/executor:latest
FROM alpine:latest
RUN apk add bash --no-cache
COPY --from=0 /kaniko/executor /usr/local/bin/executor
ENTRYPOINT ["executor"]
