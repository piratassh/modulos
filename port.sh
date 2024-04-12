#!/bin/bash

# Função para adicionar porta TCP ao firewall
add_tcp_port() {
    local port="8191"
    sudo firewall-cmd --zone=public --permanent --add-port="$port"/tcp
}

# Função para recarregar configurações do firewall
reload_firewall() {
    sudo firewall-cmd --reload
}

# Função para listar portas abertas
list_open_ports() {
    sudo firewall-cmd --zone=public --list-ports
}

# Adicionar porta 8191
add_tcp_port

# Verificar se o comando anterior foi executado com sucesso
if [ $? -eq 0 ]; then
    echo "Porta 8191 TCP adicionada ao firewall com sucesso."
else
    echo "Falha ao adicionar porta 8191 TCP ao firewall."
    exit 1
fi

# Recarregar configurações do firewall
reload_firewall

# Verificar se o comando anterior foi executado com sucesso
if [ $? -eq 0 ]; then
    echo "Configurações do firewall recarregadas com sucesso."
else
    echo "Falha ao recarregar configurações do firewall."
    exit 1
fi

# Listar portas abertas
list_open_ports
