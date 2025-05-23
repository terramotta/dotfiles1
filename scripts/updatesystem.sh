#!/bin/bash

# Função para verificar a conectividade com a internet
function check_internet {
    echo "Verificando conectividade com a internet..."
    if ! ping -c 1 google.com &> /dev/null
    then
        echo "Conexão com a internet não disponível. Verifique sua conexão e tente novamente."
        exit 1
    fi
}

# Função para atualizar o sistema
function update_system {
    check_internet

    echo "Iniciando a atualização do sistema..."
    
    echo "Atualizando a lista de pacotes disponíveis..."
    sudo apt update -y
    
    echo "Atualizando pacotes instalados..."
    sudo apt upgrade -y
    
    echo "Atualizando pacotes e gerenciando dependências..."
    sudo apt dist-upgrade -y
    
    echo "Atualizando drivers do sistema..."
    sudo ubuntu-drivers autoinstall

    echo "Removendo pacotes desnecessários..."
    sudo apt autoremove -y

    echo "Limpando pacotes antigos e cache..."
    sudo apt autoclean -y
    sudo apt clean -y
    
    echo "Atualização concluída com sucesso."
}