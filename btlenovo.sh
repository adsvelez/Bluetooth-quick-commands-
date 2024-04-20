#!/bin/bash

# Dirección MAC del dispositivo Bluetooth
mac_address="AA:09:4E:D2:4A:2A"

# Comprobar si el dispositivo está conectado
connected=$(bluetoothctl info "$mac_address" | grep "Connected: yes")

if [ -n "$connected" ]; then
    # Desconectar el dispositivo Bluetooth
    bluetoothctl disconnect "$mac_address"
    echo "Dispositivo Bluetooth desconectado: $mac_address"
else
    echo "El dispositivo Bluetooth no está actualmente conectado: $mac_address"
    # Intentar conectar el dispositivo Bluetooth
    bluetoothctl connect "$mac_address"
    echo "Intentando conectar el dispositivo Bluetooth: $mac_address"
fi
