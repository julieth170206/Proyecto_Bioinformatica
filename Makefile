SHELL := /usr/bin/env bash

.PHONY: all data pre_qc trim post_qc spades quast map samtools qualimap

all: data pre_qc trim post_qc spades quast map samtools qualimap

data:
	scripts/00_data.sh

pre_qc:
	scripts/01_pre_qc.sh

trim:
	scripts/02_trim.sh

post_qc:
	scripts/03_post_qc.sh

spades:
	scripts/04_spades.sh

quast:
	scripts/05_quast.sh

map:
	scripts/06_map.sh

samtools:
	scripts/07_samtools.sh

qualimap:
	scripts/08_qualimap.sh
