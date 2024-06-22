#!/bin/bash

# 証明書ディレクトリの作成
mkdir -p ~/.aspnet/https/
chmod 700 ~/.aspnet/https/

# dotnet dev-certs コマンドを使用して証明書を生成
dotnet dev-certs https -ep ~/.aspnet/https/aspnetapp.pfx -p certs_password

# エクスポートされた証明書をPEM形式に変換
openssl pkcs12 -in ~/.aspnet/https/aspnetapp.pfx -out ~/.aspnet/https/aspnetapp.crt -nokeys -passin pass:your_password

# 証明書をシステムの信頼された証明書ディレクトリにコピー
sudo cp ~/.aspnet/https/aspnetapp.crt /usr/local/share/ca-certificates/aspnetapp.crt

# システムの信頼された証明書を更新
sudo update-ca-certificates
