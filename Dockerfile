FROM alpine

RUN mkdir /opt/tomcat/
RUN apk update
RUN apk add --no-cache openjdk11
RUN apk add --no-cache curl

WORKDIR /opt/tomcat
RUN curl -s -o apache-tomcat.tar.gz https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.79/bin/apache-tomcat-9.0.79.tar.gz
RUN tar xvfz apache-tomcat.tar.gz
RUN mv apache-tomcat-*/* /opt/tomcat/.
RUN rm -rf apache-tomcat*

WORKDIR /opt/tomcat/webapps
RUN curl -s -o speedtest.war -L https://github.com/motababravo/SpeedTest/raw/master/speedtest-1.1.war

RUN apk del curl apk-tools
RUN rm -rf /var/cache/apk/*

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
