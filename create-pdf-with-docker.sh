#!/usr/bin/env bash

# Creates a PDF using asciidoctor-pdf

# This script is simply executing the "create-pdf-sh" script from within the docker container. This way, there is no
# need to install asciidoctor and asciidoctor-pdf on your local machine.

#################################################

pushd "${BASH_SOURCE%/*}/"

if [ -n "$1" ]
then
    pushd "$1"
fi

# Convert all .adoc files from current directory
docker run -it --rm -v $PWD:/opt/workdir sawano/asciidoc /bin/bash -c "cd /opt/workdir; /opt/bin/create-pdf.sh /opt/workdir"
