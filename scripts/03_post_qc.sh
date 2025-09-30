set -euo pipefail
IN="data/trimmed"
OUT="qc/post"
mkdir -p "${OUT}"

fastq_files=($(find "${IN}" -name "*.fastq.gz" | sort))
if [ ${#fastq_files[@]} -eq 0 ]; then
    echo "ERROR: No se encontraron archivos .fastq.gz en ${IN}"
    exit 1
fi

echo "Ejecutando FastQC"
fastqc -o "${OUT}" "${fastq_files[@]}"

echo "Generando MultiQC"
multiqc -o "${OUT}" "${OUT}"