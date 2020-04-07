FROM gcr.io/kaniko-project/executor:debug-v0.19.0

RUN ["/busybox/sh", "-c", "mkdir -p /bin /root && ln -s /busybox/sh /bin/sh"]

ENTRYPOINT ["/bin/sh"]
