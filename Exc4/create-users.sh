#!/bin/bash

# Создание каталога для сертификатов пользователей
mkdir -p certs

# Генерация сертификатов для пользователя user1 (config-manager)
openssl genrsa -out certs/user1.key 2048
openssl req -new -key certs/user1.key -out certs/user1.csr -subj "/CN=user1/O=editors"
openssl x509 -req -in certs/user1.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out certs/user1.crt -days 365

# Генерация сертификатов для пользователя user2 (viewer)
openssl genrsa -out certs/user2.key 2048
openssl req -new -key certs/user2.key -out certs/user2.csr -subj "/CN=user2/O=viewers"
openssl x509 -req -in certs/user2.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out certs/user2.crt -days 365

# Генерация сертификатов для пользователя admin (privileged-admin)
openssl genrsa -out certs/admin.key 2048
openssl req -new -key certs/admin.key -out certs/admin.csr -subj "/CN=admin/O=admins"
openssl x509 -req -in certs/admin.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out certs/admin.crt -days 365

echo "Сертификаты для пользователей созданы в каталоге certs/"
