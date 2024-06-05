#!/bin/bash

# Função para verificar o tipo de distribuição e instalar o ripgrep
install_ripgrep() {
    if [ -f /etc/os-release ]; then
        # Importar informações da distribuição
        . /etc/os-release
        DISTRO=$ID
    else
        echo "Não foi possível identificar a distribuição Linux."
        exit 1
    fi

    echo "Identificado: $DISTRO"

    case "$DISTRO" in
        ubuntu|debian)
            echo "Instalando ripgrep para $DISTRO..."
            sudo apt-get update
            sudo apt-get install -y ripgrep
            ;;
        fedora)
            echo "Instalando ripgrep para Fedora..."
            sudo dnf install -y ripgrep
            ;;
        centos|rhel)
            echo "Instalando ripgrep para CentOS/RHEL..."
            sudo yum install -y epel-release
            sudo yum install -y ripgrep
            ;;
        arch)
            echo "Instalando ripgrep para Arch Linux..."
            sudo pacman -Syu ripgrep
            ;;
        *)
            echo "Distribuição $DISTRO não suportada pelo script."
            exit 1
            ;;
    esac
}

# Executar a função de instalação
install_ripgrep

