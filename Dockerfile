FROM vintec/basejava:v8

MAINTAINER Isidoro Trevino "isidoro.trevino@vintec.mx"

#COPY files/install.sh /tmp/install.sh

COPY files/docker-entrypoint.sh /home/developer/ 

ENV GRAILS_VERSION 3.1.7
# Setup Grails path.
ENV GRAILS_HOME /opt/grails
ENV PATH $GRAILS_HOME/bin:$PATH

USER root

RUN locale-gen en_US.UTF-8  && \
	mkdir -p /app && \
	mkdir -p /opt && \
	cd /opt && \	
	wget https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails && \
	chown developer:developer -R /app && \
	chown developer:developer -R /opt/grails && \
	chmod 755 /home/developer/docker-entrypoint.sh 

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

VOLUME ["/app","/home/developer/.grails","/home/developer/.m2","/home/developer/.gradle"]

WORKDIR /app

USER developer

ENTRYPOINT ["/home/developer/docker-entrypoint.sh"]
