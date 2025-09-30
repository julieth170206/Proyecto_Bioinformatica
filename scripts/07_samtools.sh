#!/usr/bin/env bash
set -euo pipefail

IN="mapeo"
OUT="mapeo/check"
mkdir -p "${OUT}"

for muestra in evol1 evol2
do 
    echo "Procesando ${muestra}"

    # Ordenar por nombre
    samtools sort -n -o "${OUT}/${muestra}_name.bam" "${IN}/${muestra}_al.bam"

    # Fixmate
    samtools fixmate -m "${OUT}/${muestra}_name.bam" "${OUT}/${muestra}_fixmate.bam"

    # Ordenar por posición
    samtools sort -o "${OUT}/${muestra}_sort.bam" "${OUT}/${muestra}_fixmate.bam"

    # Eliminar duplicados
    samtools markdup -r "${OUT}/${muestra}_sort.bam" "${OUT}/${muestra}_sortrem.bam"

    # Extraer lecturas no mapeadas
    samtools view -b -f 4 "${OUT}/${muestra}_sortrem.bam" > "${OUT}/${muestra}_nomap.bam"

    # Ordenar por nombre las no mapeadas
    samtools sort -n -o "${OUT}/${muestra}_nomap_name.bam" "${OUT}/${muestra}_nomap.bam"

    # Convertir a FASTQ comprimido
    samtools fastq \
        -1 "${OUT}/${muestra}_R1.fastq.gz" \
        -2 "${OUT}/${muestra}_R2.fastq.gz" \
        -0 /dev/null -s /dev/null -n \
        "${OUT}/${muestra}_nomap_name.bam"

    # Indexar archivo final (para IGV)
    samtools index "${OUT}/${muestra}_sortrem.bam"

    # Estadísticas
    samtools flagstat "${OUT}/${muestra}_sortrem.bam" > "${OUT}/${muestra}_stats.txt"
    
    echo "Listo: ${muestra}"
done
