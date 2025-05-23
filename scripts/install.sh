#!/usr/bin/env bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in $HOME/dotfiles
# And also installs and configures essential software
############################

# dotfiles directory
dotfiledir="${HOME}/dotfiles"
# scripts directory
scriptsdir="${dotfiledir}/scripts"

# list of files/folders to symlink in ${homedir}
files=(bashrc bash_profile bash_prompt aliases private)

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd "${dotfiledir}" || exit

# create symlinks (will overwrite old dotfiles)
for file in "${files[@]}"; do
    echo "Creating symlink to $file in home directory."
    ln -sf "${dotfiledir}/.${file}" "${HOME}/.${file}"
done

# Atualizar o sistema e instalar pacotes essenciais
echo "Atualizando o sistema e instalando pacotes essenciais..."
source "${scriptsdir}/updatesystem.sh"
source "${scriptsdir}/setupsystem.sh"
update_system
basic_system_setup


# Instalar aplicativos e ferramentas
echo "Installing applications and tools..."
source "${scriptsdir}/apt.sh"
install_apps

# Configurar VS Code
echo "Configuring VS Code..."
# Verificar e garantir permissões de execução
if [ ! -x "${scriptsdir}/vscode.sh" ]; then
    chmod +x "${scriptsdir}/vscode.sh"
fi
"${scriptsdir}/vscode.sh"


echo "Installation Complete!"
