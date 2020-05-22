FROM oberbichler/carat:2020-05-22-2

ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER} \
 && echo 'export PS1="> "' >> ${HOME}/.bashrc

ENV SHELL /bin/bash

COPY ./data ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}

RUN pip3 install caratpost==0.4

WORKDIR ${HOME}
USER ${USER}
