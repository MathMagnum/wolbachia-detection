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

