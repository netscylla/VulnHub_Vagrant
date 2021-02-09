#!/bin/sh

if [ $# -eq 0 ]; then
    echo "Usage:"
    echo "-----"
    echo "$0 install - install haymarketers network"
    echo "$0 uninstall - uninstall haymarketers network"
    exit 1
fi

OSTYPE=$(uname -s)
VBOX=$(which VBoxManage)

if [[ "$VBOX" == '' ]]; then
  echo "Error: VBoxManage not found in PATH!\nExiting!"
  exit 1
fi

install() {
  if [[ "$OSTYPE" == 'Darwin' ]]; then
    echo "Darwin Setup"
    VBoxManage dhcpserver add --netname haymarketers --ip 10.13.37.1 --netmask 255.255.255.0 --lowerip 10.13.37.5 --upperip 10.13.37.254 --enable    
    echo "Added haymarketers network"
  elif [[ "$OSTYPE" == 'Linux' ]]; then
    echo "todo..."
  else
    echo "unknown platform"
  fi
}

uninstall() {
  if [[ "$OSTYPE" == 'Darwin' ]]; then
    echo "Darwin Setup detected..."
    VBoxManage dhcpserver remove --network haymarketers
    echo "Removed Haymarketers Network"
  elif [[ "$OSTYPE" == 'Linux' ]]; then
    echo "todo..."
  else
    echo "unknown platform"
  fi
}

"$@"
