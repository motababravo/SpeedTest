FROM alpine

MAINTAINER motaba@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN apk add openjdk11
RUN apk add curl
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.79/bin/apache-tomcat-9.0.79.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.79/* /opt/tomcat/.


WORKDIR /opt/tomcat/webapps
RUN curl -o speedtest.war -L https://github.com/motababravo/SpeedTest/raw/master/speedtest-1.1.war
RUN apk del curl

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
