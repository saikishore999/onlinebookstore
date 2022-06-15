FROM ubuntu:latest
RUN apt-get update
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
COPY target/onlinebookstore-0.0.1-SNAPSHOT*.war /opt/tomcat/webapps/onlinebookstore-0.0.1-SNAPSHOT.war
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.64.tar.gz
RUN cd /opt/tomcat/apache-tomcat-9.0.64.tar.gz 
EXPOSE 8080
CMD [ "/opt/tomcat/bin/catalina.sh", "run"]
