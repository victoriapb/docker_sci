
FROM docker://jupyterhub/singleuser:latest

ENV DEBIAN_FORNTEND=noninteractive 
ENV TZ=Europe/Berlin 

USER root

RUN apt update && apt upgrade -y && apt install -y vim wget git tmux

USER jovyan

COPY reqs.yml /home/jovyan/reqs.yml

RUN mamba env create -n Bayesian -f reqs.yml


