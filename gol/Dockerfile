FROM tomcat:8
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install wget
RUN wget  https://referenceappkhaja.s3-us-west-2.amazonaws.com/gameoflife.war -O /usr/local/tomcat/webapps/gameoflife.war
EXPOSE 8080
