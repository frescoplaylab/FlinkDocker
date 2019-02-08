FROM ubuntu:16.04
RUN mkdir /opt/mdp
RUN apt update && apt install curl -y \
    && apt install default-jdk -y \
    && curl -s "https://archive.apache.org/dist/flink/flink-1.7.0/flink-1.7.0-bin-hadoop27-scala_2.11.tgz" | tar xzvf -  -C /opt/mdp 




ENV PATH=${PATH}:/opt/mdp/flink-1.7.0/bin
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/

COPY ./start.sh .
RUN chmod +x ./start.sh
ENTRYPOINT ["/bin/bash" ,"./start.sh" ]


