ARG BASEIMAGE=lukasheinrich/genericmg5pydelphes-base
FROM ${BASEIMAGE}
RUN pip install click pyyaml
COPY . /mcproduction
WORKDIR /mcproduction
RUN cd pythia_main && make
