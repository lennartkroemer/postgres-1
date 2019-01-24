# Internetzugang notwendig!
#
FROM alpine:3.8
RUN set -ex \
  && apk add incron \
  && apk upgrade \
  && touch /etc/incron.d/storagetab \
  && echo "docker_storage IN_CREATE chown 510:510 \$@/\$#; chmod 0700 \$@/\$#" >> /etc/incron.d/storagetab \
  && echo "done"
VOLUME docker_storage
CMD ["incrond","--foreground"]
