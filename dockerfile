FROM ubuntu:latest
RUN apt-get update
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat/webapps/
WORKDIR /usr/local/tomcat/webapps/
COPY target/onlinebookstore-0.0.1-SNAPSHOT*.war /usr/local/tomcat/webapps/onlinebookstore-0.0.1-SNAPSHOT.war
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.64.tar.gz
RUN mv apache-tomcat-9.0.64/* /usr/local/tomcat/webapps/
EXPOSE 8080
CMD [ "/usr/local/tomcat/bin/catalina.sh", "run"]
