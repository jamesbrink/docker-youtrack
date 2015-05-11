# JetBrains YouTrack 6
#
# VERSION     1.0

FROM ubuntu:vivid
MAINTAINER James Brink, brink.james@gmail.com

RUN apt-get update && apt-get install -y wget openjdk-7-jre && rm -rf /var/lib/apt/lists/*

RUN groupadd youtrack
RUN useradd -g youtrack -G users -s /bin/bash -d /app -m youtrack

USER youtrack
ENV HOME /app
RUN cd /app && wget http://download-cf.jetbrains.com/charisma/youtrack-6.0.12634.jar

EXPOSE 8080
CMD ["/usr/bin/java", "-Xmx1g", "-jar", "/app/youtrack-6.0.12634.jar",  "0.0.0.0:8080"]


