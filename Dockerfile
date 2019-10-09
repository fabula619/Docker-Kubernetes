FROM openjdk:8-alpine
RUN apk --update add wget tar bash
ADD spark-2.4.2-bin-hadoop2.7 spark
COPY log4j.properties log4j.properties
COPY sparksu2bmit.conf sparksu2bmit.conf
COPY untitled619.5-assembly-0.1.jar untitled619.5-assembly-0.1.jar 
COPY untitled619-5_2.12-0.1.jar untitled619-5_2.12-0.1.jar 
COPY stocator-1.0.22-IBM-SDK.jar stocator-1.0.22-IBM-SDK.jar
COPY text text
COPY db2jcc-db2jcc4.jar db2jcc-db2jcc4.jar
ENV ServiceID ServiceId-01d12ca4-13c7-4504-bd9b-00f37f0db2e4
ENV SecretKey a3231168b48bd7329a79e9f0c78a1aeb6fdf7f96bf570146
ENV JDBC_IBM_DB2 jdbc:db2://dashdb-txn-sbox-yp-lon02-02.services.eu-gb.bluemix.net:50001/BLUDB:user=jgr92749;password=tw5vfbk^5vs6jqn9;sslConnection=true;
CMD /spark/bin/spark-submit --conf spark.filename=myfileincosxxxx --num-executors 1 --executor-cores 2 --class trans.Main --jars stocator-1.0.22-IBM-SDK.jar,db2jcc-db2jcc4.jar untitled619-5_2.12-0.1.jar 1000
