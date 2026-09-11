FROM tomcat:10.0-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY application/target/Wild_Tour.war /usr/local/tomcat/webapps/Wild_Tour.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
