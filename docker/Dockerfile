FROM openjdk:8
LABEL author="khaja"
LABEL version="0.2"
LABEL project="QT"
RUN wget https://referenceappkhaja.s3-us-west-2.amazonaws.com/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java"]
CMD ["-jar",  "spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar"]

# build spring petclinic
#docker image build -t spc:0.1 .
