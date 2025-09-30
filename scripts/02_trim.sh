#!/usr/bin/env bash
set -euo pipefail
IN="data/raw"
OUTD="data/trimmed"
QCD="qc/fastp"
mkdir -p "${OUTD}" "${QCD}"

fastp \
    -i "${IN}/anc_R1.fastq.gz" -I "${IN}/anc_R2.fastq.gz" \
    -o "${OUTD}/anc_R1.trimmed.fastq.gz" \
    -O "${OUTD}/anc_R2.trimmed.fastq.gz" \
    --qualified_quality_phred 28 \
    --length_required 50 \
    --cut_front --cut_tail --cut_mean_quality 28 \
    --thread 4 \
    --html "${QCD}/fastp_anc.html" \
    --json "${QCD}/fastp_anc.json"

fastp \
    -i "${IN}/evol1_R1.fastq.gz" -I "${IN}/evol1_R2.fastq.gz" \
    -o "${OUTD}/evol1_R1.trimmed.fastq.gz" \
    -O "${OUTD}/evol1_R2.trimmed.fastq.gz" \
    --qualified_quality_phred 28 \
    --length_required 50 \
    --cut_front --cut_tail --cut_mean_quality 28 \
    --thread 4 \
    --html "${QCD}/fastp_evol1.html" \
    --json "${QCD}/fastp_evol1.json"

fastp \
    -i "${IN}/evol2_R1.fastq.gz" -I "${IN}/evol2_R2.fastq.gz" \
    -o "${OUTD}/evol2_R1.trimmed.fastq.gz" \
    -O "${OUTD}/evol2_R2.trimmed.fastq.gz" \
    --qualified_quality_phred 28 \
    --length_required 50 \
    --cut_front --cut_tail --cut_mean_quality 28 \
    --thread 4 \
    --html "${QCD}/fastp_evol2.html" \
    --json "${QCD}/fastp_evol2.json"

echo "[OK] fastp completado. Salidas en ${OUTD}, reportes en ${QCD}"