FROM centos

MAINTAINER motaba@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.79/bin/apache-tomcat-9.0.79.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.79/* /opt/tomcat/.
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum -y install java-11-openjdk-devel
RUN yum clean all -y

WORKDIR /opt/tomcat/webapps
RUN curl -o speedtest.war -L https://github.com/motababravo/SpeedTest/raw/master/speedtest-1.1.war
EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
