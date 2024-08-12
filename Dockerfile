FROM gradle:7.5.1-jdk11 

COPY . .

RUN ./gradlew  clean build -x test

FROM tomcat:9-jdk11

COPY build/libs/*.war /usr/local/tomcat/webapps/kapsiki.war





