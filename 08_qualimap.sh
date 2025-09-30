#!/usr/bin/env bash
set -euo pipefail

IN="mapeo_intento/check"
OUT="qc/qualimap"
mkdir -p "${OUT}"

for muestra in evol1 evol2
do
    echo "Procesando con Qualimap: ${muestra}"

    qualimap bamqc \
        -bam "${IN}/${muestra}_sortrem.bam" \
        -outdir "${OUT}/${muestra}" \
        -outfile "${muestra}_report.html" \
        -outformat html

    echo "Listo: ${muestra}"
done

echo "Generando reporte integrado con MultiQC"
multiqc "${IN}" -o "${OUT}"
echo "Reporte listo: ${OUT}/multiqc_report.html"