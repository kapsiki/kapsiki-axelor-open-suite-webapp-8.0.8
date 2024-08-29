FROM tomcat:9-jdk11

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qy && \
    apt-get install -qy \
            git \
            tar \
            ca-certificates \
            curl && \
    useradd -r -m -s /bin/false tomcat && \
    git clone https://<token>@github.com/kapsiki/kapsiki-axelor-open-suite-webapp-8.0.8.git /usr/local/tomcat/webapps/ROOT/ && \
    chown -R tomcat:tomcat /usr/local/tomcat/webapps/ROOT && \
    apt-get autoremove -qy --purge git && \
    apt-get clean -qy && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
    
COPY axelor-config.properties /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/application.properties

COPY docker-pre-entrypoint.sh /docker-pre-entrypoint.sh
RUN chmod +x /docker-pre-entrypoint.sh

ENTRYPOINT [ "/docker-pre-entrypoint.sh" ]
