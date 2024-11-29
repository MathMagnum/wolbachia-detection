# Avaliação de qualidade das leituras com FastQC:
# Gera um relatório de qualidade das leituras no arquivo FASTQ usando o FastQC.
fastqc SRRXXXXXXX.fastq


# Limpeza e corte de sequências de baixa qualidade com Trim Galore:
# Remove sequências de baixa qualidade e adaptadores, realiza uma análise de qualidade pós-processamento com FastQC, 
# e define um corte de qualidade mínimo de 25, comprimento mínimo de 18 bases, além de impedir compressão no output.
trim_galore --fastqc -q 25 --trim-n --max_n 0 -j 1 --length 18 --dont_gzip SRRXXXXXXX.fastq

