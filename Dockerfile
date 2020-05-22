FROM oberbichler/carat:2020-05-22

ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER} \
 && echo 'source /opt/conda/bin/activate' >> ${HOME}/.bashrc
 && echo 'export PS1="> "' >> ${HOME}/.bashrc

ENV SHELL /bin/bash

COPY ./data ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}

RUN pip install caratpost

WORKDIR ${HOME}
USER ${USER}
