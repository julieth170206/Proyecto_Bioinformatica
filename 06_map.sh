#!/usr/bin/env bash
set -euo pipefail

REF="ensamblaje/spades/post/scaffolds.fasta"
IN="data/trimmed"
OUT="mapeo"
mkdir -p "${OUT}"


#Igual esto yo no lo puedo visualizar
echo "Indexando"
bwa index "${REF}"

echo "Alineando"
bwa mem -R "@RG\tID:evol1\tSM:evol1" \
    "${REF}" \
    "${IN}/evol1_R1.trimmed.fastq.gz" "${IN}/evol1_R2.trimmed.fastq.gz" \
    | samtools view -bS -o "${OUT}/evol1_al.bam"

bwa mem -R "@RG\tID:evol2\tSM:evol2" \
    "${REF}" \
    "${IN}/evol2_R1.trimmed.fastq.gz" "${IN}/evol2_R2.trimmed.fastq.gz" \
    | samtools view -bS -o "${OUT}/evol2_al.bam"