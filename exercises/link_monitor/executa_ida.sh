#!/bin/bash

for i in {1..30}
do
    echo "Executando send.py pela $iª vez..."
    python3 send.py
    if [ $? -eq 0 ]; then
        echo "Execução $i concluída com sucesso!"
        if [ -f dados.csv ]; then
            mv dados.csv dados/ida/ida_$i.csv
            echo "Renomeado dados.csv para dados_$i.csv"
        else
            echo "dados.csv não encontrado!"
        fi
    else
        echo "Execução $i falhou com o código de retorno $?."
        exit 1
    fi
done
