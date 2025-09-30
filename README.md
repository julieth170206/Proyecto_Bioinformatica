# Proyecto_Bioinformatica

La estructura que se genera al correr los scripts es la siguiemte, tener en cuenta que se debe de estar parado en una directorio que contenga la directorio scripts (en nuestro caso la directorio se llama Proyecto):

Proyecto
* scripts (Contiene todos los scripts)
* data (Datos crudos y procesados)
    * raw (Datos recién descargados)
    * trimmed (Datos después del trimming)
* qc (Reportes de control de calidad)
    * pre
    * fastp
    * post
    * quast
    * qualimap
* ensamblaje (Resultados de ensamblaje)
    * spades
* mapeo (Archivos del proceso de mapeo)
    * check (Archivos .bam creados (indexado, ordenado, duplicados))
