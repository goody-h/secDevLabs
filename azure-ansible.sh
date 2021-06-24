#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y python3-pip
sudo pip3 install --upgrade pip
pip3 install "ansible==2.9.17"
pip3 install ansible[azure]

mkdir -p ~/.azure
cat > ~/.azure/credentials << EOF
[default]
subscription_id=40fe838b-6ee9-466a-959b-c681d6a4f4c1
client_id=cacea591-59a4-4891-b253-fe669db6df0f
secret=y4Z-YPBlIjgyCcdX~D71t5x_A9Z3H~KApw
tenant=84c31ca0-ac3b-4eae-ad11-519d80233e6f
EOF
