#!/usr/bin/env bash
set -euo pipefail

PRE="ensamblaje/spades/pre/scaffolds.fasta"
POST="ensamblaje/spades/post/scaffolds.fasta"
OUT="qc/quast/pre_vs_post"
mkdir -p "${OUT}"

echo "Ejecutando Quast para comparar pre y post qc"
quast.py \
    "${PRE}" "${POST}" \
    -o "${OUT}" \
    --labels PRE,POST