FROM tomcat:9.0.71-jre8-temurin-focal
LABEL maintainer="nguyen.dung@gmail.com"

ADD sample.war /usr/local/tomcat/webapps/

#EXPOSE 8088
#CMD ["catalina.sh", "run"]
