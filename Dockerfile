FROM maven:latest

RUN apt-get update && apt-get install -y \
    curl \
    unzip && \

    # download grib2json from github
    wget https://github.com/cambecc/grib2json/archive/master.zip && \
    
    unzip master.zip && \
    
    cd grib2json-master && \
    
    mvn package && \
    
    cd target && \
    
    tar -xvf grib2json-0.8.0-SNAPSHOT.tar.gz && \
    
    cp grib2json-*/bin/* /usr/bin && \
    cp grib2json-*/lib/* /usr/lib

ADD . /grib2json-output
WORKDIR /grib2json-output

CMD grib2json $ARGS
