# Construção do índice de alinhamento com Bowtie:
# Cria um índice de alinhamento a partir do arquivo FASTA de referência usando o Bowtie.
bowtie-build reference.fasta reference_index

# Alinhamento das sequências contra a referência de Wolbachia:
# Realiza o alinhamento das sequências do arquivo FASTA contra a referência de Wolbachia, 
# gerando um arquivo SAM de saída e registrando o log em um arquivo separado.
bowtie -f -S -a -v 0 -p 3 -t reference_index sample.fasta > sample.sam 2> sample_bowtie.log
