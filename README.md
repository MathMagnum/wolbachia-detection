# Detecção de Wolbachia em Bibliotecas de Pequenos RNAs

## Introdução

Este projeto tem como objetivo desenvolver e implementar uma abordagem eficiente para detectar a presença de **Wolbachia**, uma bactéria endossimbionte amplamente encontrada em artrópodes e alguns nematoides, em bibliotecas de pequenos RNAs (sRNAs). A detecção precisa de **Wolbachia** em sRNAs é de grande importância, pois auxilia na compreensão de sua interação com os hospedeiros, sua influência na regulação gênica, e no potencial uso biotecnológico em estratégias de controle de doenças transmitidas por vetores, como a dengue e a malária.

## Fluxo de Trabalho

1. **Download das Sequências do SRA**
   
    Obtém os dados de sequências brutas diretamente do Sequence Read Archive (SRA) para análise.

2. **Limpeza e Qualidade das Sequências**
   
    Remove bases de baixa qualidade e adaptadores das leituras, garantindo que apenas sequências de alta qualidade sejam usadas no alinhamento.

3. **Alinhamento com a Referência de Wolbachia**
   
    Realiza o mapeamento das sequências limpas contra o genoma de referência de Wolbachia, identificando correspondências exatas e regiões de interesse.


### Passo 1: Download de dados do SRA

```bash
# download das bibliotecas de pequenos RNAs do SRA (Sequence Read Archive)
fasterq-dump SRRXXXXXXX
```

### Passo 2: Avaliação de Qualidade das Leituras e Limpeza de Sequências de Baixa Qualidade

```bash
# Avaliação de qualidade das leituras com FastQC:
# Gera um relatório de qualidade das leituras no arquivo FASTQ usando o FastQC.
fastqc SRRXXXXXXX.fastq


# Limpeza e corte de sequências de baixa qualidade com Trim Galore:
# Remove sequências de baixa qualidade e adaptadores, realiza uma análise de qualidade pós-processamento com FastQC, 
# e define um corte de qualidade mínimo de 25, comprimento mínimo de 18 bases, além de impedir compressão no output.
trim_galore --fastqc -q 25 --trim-n --max_n 0 -j 1 --length 18 --dont_gzip SRRXXXXXXX.fastq
```

### Passo 3: Construção do Índice de Alinhamento com Bowtie e Alinhamento das Sequências
```bash
# Construção do índice de alinhamento com Bowtie:
# Cria um índice de alinhamento a partir do arquivo FASTA de referência usando o Bowtie.
bowtie-build reference.fasta reference_index

# Alinhamento das sequências contra a referência de Wolbachia:
# Realiza o alinhamento das sequências do arquivo FASTA contra a referência de Wolbachia, 
# gerando um arquivo SAM de saída e registrando o log em um arquivo separado.
bowtie -f -S -a -v 0 -p 3 -t reference_index sample.fasta > sample.sam 2> sample_bowtie.log
```

