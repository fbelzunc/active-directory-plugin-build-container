FROM docker:stable-dind
LABEL maintainer="fbelzunc@gmail.com"

RUN apk add --no-cache maven openjdk8 bash tini bind-tools

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk/

COPY daemon.json /etc/docker/daemon.json
COPY custom-dockerd-entrypoint.sh /usr/local/bin/custom-dockerd-entrypoint.sh

WORKDIR /project

ENTRYPOINT ["/sbin/tini","-g","--","bash","/usr/local/bin/custom-dockerd-entrypoint.sh"]

CMD ["clean","package"]
