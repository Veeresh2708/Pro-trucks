FROM ubuntu:latest

MAINTAINER veeresh@vanga.com

RUN apt-get update && apt-get -y install default-jdk && \
      apt-get -y install curl

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.5.39
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

COPY /Pro-trucks/Maven Build/target/*.war $CATALINA_HOME/webapps/

EXPOSE 8888
CMD ["catalina.sh", "run"]
