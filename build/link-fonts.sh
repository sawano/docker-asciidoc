#!/usr/bin/env bash

#This is run by Dockerfile to create symlinks to fonts so they are available to asciidoctor-pdf

# Directories in ubuntu image
FONT_DIR="${1}"
ASCIIDOCTOR_PDF_DIR="${2}"
ASCIIDOCTOR_FONT_DIR="${ASCIIDOCTOR_PDF_DIR}/data/fonts"

ln -s ${FONT_DIR}/liberation/LiberationSans-Regular.ttf ${ASCIIDOCTOR_FONT_DIR}/LiberationSans-Regular.ttf
ln -s ${FONT_DIR}/liberation/LiberationSans-Italic.ttf ${ASCIIDOCTOR_FONT_DIR}/LiberationSans-Italic.ttf
ln -s ${FONT_DIR}/liberation/LiberationSans-Bold.ttf ${ASCIIDOCTOR_FONT_DIR}/LiberationSans-Bold.ttf
ln -s ${FONT_DIR}/liberation/LiberationSans-BoldItalic.ttf ${ASCIIDOCTOR_FONT_DIR}/LiberationSans-BoldItalic.ttf

ln -s ${FONT_DIR}/liberation/LiberationSerif-Regular.ttf ${ASCIIDOCTOR_FONT_DIR}/LiberationSerif-Regular.ttf
ln -s ${FONT_DIR}/liberation/LiberationSerif-Italic.ttf ${ASCIIDOCTOR_FONT_DIR}/LiberationSerif-Italic.ttf
ln -s ${FONT_DIR}/liberation/LiberationSerif-Bold.ttf ${ASCIIDOCTOR_FONT_DIR}/LiberationSerif-Bold.ttf
ln -s ${FONT_DIR}/liberation/LiberationSerif-BoldItalic.ttf ${ASCIIDOCTOR_FONT_DIR}/LiberationSerif-BoldItalic.ttf


