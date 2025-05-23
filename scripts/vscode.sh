#!/bin/bash

# Instalar o VS Code (se ainda não estiver instalado)
if ! command -v code &> /dev/null; then
    echo "VS Code não encontrado. Instalando..."
    # Adicionar o repositório do Microsoft para o VS Code
    sudo apt update
    sudo apt install -y wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/microsoft-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
    sudo apt update
    sudo apt install -y code
else
    echo "VS Code já está instalado."
fi


# Definir o diretório de configurações do VS Code para Ubuntu
VSCODE_USER_SETTINGS_DIR="${HOME}/.config/Code/User"

# Verificar se o diretório de configurações do VS Code existe
if [ -d "$VSCODE_USER_SETTINGS_DIR" ]; then
    # Criar links simbólicos para suas configurações personalizadas
    ln -sf "${HOME}/dotfiles/settings/VSCode-Settings.json" "${VSCODE_USER_SETTINGS_DIR}/settings.json"
    ln -sf "${HOME}/dotfiles/settings/VSCode-Keybindings.json" "${VSCODE_USER_SETTINGS_DIR}/keybindings.json"

    echo "Configurações e keybindings do VS Code foram atualizados."
else
    echo "Diretório de configurações do VS Code não encontrado. Verifique se o VS Code está instalado."
fi

# Abrir o VS Code para login nas extensões
code .
echo "Faça login nas extensões (Copilot, Grammarly, etc) dentro do VS Code."
echo "Pressione Enter para continuar..."
read
