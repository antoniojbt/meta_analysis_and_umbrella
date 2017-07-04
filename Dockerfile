#######################################################
# Dockerfile for project_name
# https://github.com/author_name/project_name
#######################################################


############
# Base image
############

# FROM python:3-onbuild 
# FROM ubuntu:17.04

FROM jfloff/alpine-python
# https://github.com/jfloff/alpine-python
# This is a minimal Python 3 image that can start from python or bash

# Or simply run:
# docker run --rm -ti jfloff/alpine-python bash
# docker run --rm -ti jfloff/alpine-python python hello.py

#########
# Contact
#########
MAINTAINER author_name <author_email>


#########################
# Update/install packages
#########################

# Install system dependencies
# For Alpine see:
# https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management
RUN apk update && apk upgrade \
    && apk add \
    tree \
    sudo
#    vim \

#    wget \
#    bzip2 \
#    unzip \
#    git \ # Already in Alpine Python


#########################
# Install Python packages
#########################

RUN pip install --upgrade pip setuptools future \
    && pip install --upgrade ruffus \
    && pip list


############
# CGAT tools
############

# Use experimental minimal version for now:
RUN git clone https://github.com/AntonioJBT/CGATPipeline_core.git 


#########################
# Install package to test 
#########################

RUN cd home \
    && git clone https://github.com/user_name/project_name.git \
    && cd project_name \
    && python setup.py install \
    && cd ..


###############################
# Install external dependencies
###############################

# e.g.:
# install PLINK:

#ENV PLINK_VERSION       1.9
#ENV PLINK_NO		  plink170113
#ENV PLINK_HOME          /usr/local/plink

#RUN wget https://www.cog-genomics.org/static/bin/$PLINK_NO/plink_linux_x86_64.zip && \
#    unzip plink_linux_x86_64.zip -d /usr/local/ && \
#    rm plink_linux_x86_64.zip && \
#    cd /usr/local/bin && \
#    ln -s $PLINK_HOME plink

#############################
# Install R (currently 3.3.2)
#############################
# Install miniconda better?

# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
# add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
# RUN apt-get update && apt-get install -y r-base r-cran-littler 

# Create install script for packages that uses biocLite:

# RUN 	echo '#!/usr/bin/env r' > /usr/local/bin/install.r && \
#	echo 'library(utils)' >> /usr/local/bin/install.r && \	
#  	echo 'source("https://bioconductor.org/biocLite.R")' >> /usr/local/bin/install.r && \
#	echo 'lib.loc <- "/usr/local/lib/R/site-library"' >> /usr/local/bin/install.r && \ 
#	echo 'biocLite(commandArgs(TRUE), lib.loc)' >> /usr/local/bin/install.r && \
#	chmod 755 /usr/local/bin/install.r

# install required R packages:

#RUN Rscript /usr/local/bin/install.r \
#	ggplot2 \
#	data.table


############################
# Default action to start in
############################
# Only one CMD is read (if several only the last one is executed)
#ENTRYPOINT ['/xxx']
#CMD echo "Hello world"
#CMD project_quickstart.py
CMD ["/bin/sh"]

# Create a shared folder between docker container and host
#VOLUME ["/shared/data"]


