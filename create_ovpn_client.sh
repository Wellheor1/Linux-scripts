#!/bin/bash
client_name=$1
#sudo /etc/openvpn/easy-rsa/easyrsa build-client-full $client_name
echo Ключи клиента $client_name созданы
sudo mkdir /etc/openvpn/clients/$client_name
echo Каталог клиента $client_name создан
sudo cp /etc/openvpn/easy-rsa/pki/ca.crt /etc/openvpn/clients/$client_name/
echo Сертификат удостоверяющего центра скопирован
sudo cp /etc/openvpn/easy-rsa/pki/ta.key /etc/openvpn/clients/$client_name/
echo HMAC ключ скопирован
sudo cp /etc/openvpn/easy-rsa/pki/issued/$client_name.crt /etc/openvpn/clients/$client_name/
echo Сертификат клиента $client_name скопирвоан
sudo cp /etc/openvpn/easy-rsa/pki/private/$client_name.key /etc/openvpn/clients/$client_name/
echo Ключ клиента $client_name скопирован
sudo cp /etc/openvpn/clients/client.conf /etc/openvpn/clients/$client_name/$client_name.conf
echo Конфиграция клиента $client_name скопирована
sudo sed -i "s/cert client.crt/cert ${client_name}.crt/" /etc/openvpn/clients/$client_name/$client_name.conf
sudo sed -i "s/key client.key/key ${client_name}.key/" /etc/openvpn/clients/$client_name/$client_name.conf
echo Конфигурация пользователя отредактирована
sudo mkdir /home/l2user/${client_name}_ovpn_config
sudo cp /etc/openvpn/clients/$client_name/* /home/l2user/${client_name}_ovpn_config/
sudo chown l2user:l2user /home/l2user/${client_name}_ovpn_config/*