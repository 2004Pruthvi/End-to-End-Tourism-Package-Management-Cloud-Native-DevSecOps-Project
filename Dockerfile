FROM tomcat:10.0-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/* \
    && groupadd --system tomcat \
    && useradd --system --gid tomcat --home-dir /usr/local/tomcat tomcat \
    && chown -R tomcat:tomcat /usr/local/tomcat/logs \
                              /usr/local/tomcat/temp \
                              /usr/local/tomcat/work \
                              /usr/local/tomcat/webapps

COPY application/target/Wild_Tour.war /usr/local/tomcat/webapps/Wild_Tour.war

RUN chown tomcat:tomcat /usr/local/tomcat/webapps/Wild_Tour.war

USER tomcat

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -fsS http://localhost:8080/Wild_Tour/ -o /dev/null || exit 1

CMD ["catalina.sh", "run"]
