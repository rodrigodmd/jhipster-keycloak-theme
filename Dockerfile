#############################################################
# Dockerfile for keycloak
# Based on jboss/keycloak:3.3.0.Final
#############################################################

FROM jboss/keycloak:3.3.0.Final

# Establece el autor (maintainer) del archivo (tu nombre - el autor del archivo)
MAINTAINER Rodrigo Moreno

COPY ./config/realm /opt/jboss/keycloak/realm-config
COPY ./themes/keycloak/ /opt/jboss/keycloak/themes/keycloak/
COPY ./themes/my-keycloak/ /opt/jboss/keycloak/themes/my-keycloak/

ENV KEYCLOAK_USER admin
ENV KEYCLOAK_PASSWORD admin

CMD ["-b", "0.0.0.0", "-Dkeycloak.migration.action=import", "-Dkeycloak.migration.provider=dir", "-Dkeycloak.migration.dir=/opt/jboss/keycloak/realm-config", "-Dkeycloak.migration.strategy=OVERWRITE_EXISTING", "-Djboss.socket.binding.port-offset=1000"]
