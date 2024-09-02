FROM openjdk:17-jdk-slim
MAINTAINER qcm.com
EXPOSE 8888
COPY target/qcmservice-0.0.1-SNAPSHOT.jar qcmservice-0.0.1-SNAPSHOT.jar
ENTRYPOINT [ "java" ,"-jar" , "qcmservice-0.0.1-SNAPSHOT.jar" ]