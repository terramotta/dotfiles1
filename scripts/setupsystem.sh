#!/bin/bash

# Pode ser incrementado com outras funcionalidades de sistema, como firewall (ufw), configurações de rede, configurações do gnome (gsettings), etc

# Função para configuração básica do sistema
function basic_system_setup {
    echo "Configurando opções básicas do sistema..."

    # Configurar o fuso horário
    echo "Configurando o fuso horário para America/Sao_Paulo..."
    sudo timedatectl set-timezone America/Sao_Paulo

    # Alterar o Tema do Sistema
    echo "Configurando o Tema do Sistema..."
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

    # Desativa a aceleração do mouse
    echo "Desativando aceleração do mouse."
    xset m 0 0

    echo "Configuração para minimizar programas ao clicar no ícone"
    gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

    echo "Configuração básica do sistema concluída."
}
