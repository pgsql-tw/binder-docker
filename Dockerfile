FROM postgres:11
# install the notebook package
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip postgresql-server-dev-11
RUN pip3 install --no-cache --upgrade pip && \
    pip3 install --no-cache notebook ipython-sql psycopg2

# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}
ENV POSTGRES_PASSWORD 123456

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}
USER ${USER}
