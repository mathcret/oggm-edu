FROM oggm/oggm:20181123

# install the notebook package
RUN pip install --no-cache notebook
RUN pip install jupyterhub==0.9.4

# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}
USER ${USER}
