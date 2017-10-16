FROM lukasheinrich/higgs-mc-studies-base
RUN pip install click pyyaml
COPY . /mcproduction
WORKDIR /mcproduction
RUN cd pythia_main && make