FROM tomcat:8

COPY ca.crt /root/
COPY apm-server.crt /root/
RUN keytool -import -trustcacerts -noprompt -alias ca-root-cert -file /root/ca.crt -keystore /opt/java/openjdk/lib/security/cacerts -storepass changeit
RUN keytool -import -trustcacerts -noprompt -alias apm-server-cert -file /root/apm-server.crt -keystore /opt/java/openjdk/lib/security/cacerts -storepass changeit

RUN rm -rf /usr/local/tomcat/webapps && mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps

COPY jpetstore.war /usr/local/tomcat/webapps/
COPY elastic-apm-agent-1.39.0.jar /usr/local/tomcat/lib/
COPY setenv.sh /usr/local/tomcat/bin/

EXPOSE 8080
