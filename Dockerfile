FROM python:3.8-slim-buster
LABEL maintainer="uniframe-io"

# Never prompt the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

# NMS
ARG NAME_MATCHING_USER_HOME=/opt/name-matching-docs

# Define en_US.
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8

# source code migration
RUN useradd -m -d ${NAME_MATCHING_USER_HOME} runner
COPY . ${NAME_MATCHING_USER_HOME}
RUN pip install -r ${NAME_MATCHING_USER_HOME}/requirements.txt

COPY scripts/entrypoint.sh /entrypoint.sh

# Dir setup
RUN chown -R runner: ${NAME_MATCHING_USER_HOME}
RUN chown -R runner: /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN cat /etc/passwd
EXPOSE 8082

USER runner
WORKDIR ${NAME_MATCHING_USER_HOME}
ENTRYPOINT ["/entrypoint.sh"]
CMD ["serve-doc-public"]
