FROM gcr.io/kaniko-project/executor:debug

RUN ["/busybox/sh", "-c", "mkdir /bin && ln -s /busybox/sh /bin/sh"]

ENTRYPOINT ["/bin/sh"]
