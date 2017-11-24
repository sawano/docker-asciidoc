####################################################################################
# Creates a container with asciidoctor, pandoc, etc.
####################################################################################

# Command reference:
# docker build -t sawano/asciidoc:0.0.1 -t sawano/asciidoc:latest .
# docker run -it sawano/asciidoc /bin/bash
# docker run -it -v $PWD:/opt/adoc sawano/asciidoc /bin/bash


FROM ubuntu:17.04
RUN apt-get update && apt-get install -y \
    ruby \
    curl \
    sudo && \
    rm -rf /var/lib/apt/lists

# Install ruby
RUN apt-get update && apt-get install -y \
    ruby=1:2.3.3 && \
    rm -rf /var/lib/apt/lists

# Install pandoc
RUN apt-get update && apt-get install -y \
    pandoc && \
    rm -rf /var/lib/apt/lists

# Install RVM
#RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
#RUN curl -sSL https://get.rvm.io | bash -s stable --ruby

#Install asciidoctor
RUN gem install asciidoctor -v 1.5.6.1

#Install asciidoctor-pdf
RUN gem install -n /usr/local/bin asciidoctor-pdf --pre -v 1.5.0.alpha.16; asciidoctor-pdf -v

#Add sectnumoffset extension
COPY create-pdf.sh /opt/bin/
ADD https://raw.githubusercontent.com/asciidoctor/asciidoctor-extensions-lab/master/lib/sectnumoffset-treeprocessor.rb /opt/bin

#Install extra fonts
RUN apt-get update && apt-get install -y -q \
    fonts-inconsolata \
    fonts-liberation \
    fonts-mplus \
    ttf-ubuntu-font-family && \
    rm -rf /var/lib/apt/lists

# Convert Inconsolata otf to ttf
RUN apt-get update && apt-get install -y \
    fontforge && \
    rm -rf /var/lib/apt/lists
RUN fontforge -lang=ff -c 'Open("/usr/share/fonts/truetype/inconsolata/Inconsolata.otf"); Generate("/usr/share/fonts/truetype/inconsolata/Inconsolata.ttf"); Close();'
RUN apt-get --purge autoremove -y fontforge

#Add fonts to asciidoctor
RUN fontsDir='/usr/share/fonts/truetype' && \
    asciiDoctorFontsDir='/var/lib/gems/2.3.0/gems/asciidoctor-pdf-1.5.0.alpha.16/data/fonts' && \
    ln -s $fontsDir/liberation/*.ttf $asciiDoctorFontsDir/ && \
    ln -s $fontsDir/ubuntu-font-family/*.ttf $asciiDoctorFontsDir/ && \
    ln -s $fontsDir/mplus/*.ttf $asciiDoctorFontsDir/ && \
    ln -s $fontsDir/inconsolata/*.ttf $asciiDoctorFontsDir/

WORKDIR /opt/adoc

#CMD /bin/bash
