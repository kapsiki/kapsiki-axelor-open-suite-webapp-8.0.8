
FROM tomcat:9-jdk11

COPY build/libs/*.war /usr/local/tomcat/webapps/ROOT.war





