# docker-asciidoc

Docker image containing asciidoc, pandoc, asciidoctor, asciidoctor-pdf etc.

This image can be used to easily create PDFs from asciidoc documentation (.adoc files).
It can also be used as a base image for creating custom images with added style sheets, fonts etc.

## Example usage

You can create a PDF from all .adoc files in the current directory by invoking:

`docker run -it --rm -v $PWD:/opt/workdir sawano/asciidoc /bin/bash -c "ls; cd /opt/workdir; /opt/bin/create-pdf.sh /opt/workdir"`

Or you can use a shell script to automate the process (see the `create-pdf-with-docker.sh` in the source repo or the example below).

### To create PDFs from files in the current directory

`:> ./create-pdf-with-docker.sh`

### To create PDFs from files in specific directory

`:> ./create-pdf-with-docker.sh dir-with-adoc-files`


### Example shell script

````bash
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
````
