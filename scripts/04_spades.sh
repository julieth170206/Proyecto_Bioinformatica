#!/usr/bin/env bash
set -euo pipefail 

INA="data/raw"
OUTA="ensamblaje/spades/pre"
mkdir -p "${OUTA}"

echo "Ejecutando Spades para pre qc"
spades.py \
    -1 "${INA}/anc_R1.fastq.gz" \
    -2 "${INA}/anc_R2.fastq.gz" \
    -o "${OUTA}"

IN="data/trimmed"
OUT="ensamblaje/spades/post"
mkdir -p "${OUT}"

echo "Ejecutando Spades para post qc"
spades.py \
    -1 "${IN}/anc_R1.trimmed.fastq.gz" \
    -2 "${IN}/anc_R2.trimmed.fastq.gz" \
    -o "${OUT}"
