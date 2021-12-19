#!/bin/sh

SERVICE=$1

rm -rf $SERVICE
swagger generate server \
  --allow-template-override \
  --template-dir=swagger/templates \
  --spec=swagger/$SERVICE.yaml \
  --server-package=$SERVICE \
  --model-package=$SERVICE/definitions \
  --exclude-main \
  --config-file=swagger/config/go-swagger.yaml

cd $SERVICE
go mod init github.com/ckpbin/core/$SERVICE
go mod tidy
