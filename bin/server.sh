#!/bin/sh

SERVICE=$1

rm -rf restapi/$SERVICE
swagger generate server \
  --allow-template-override \
  --template-dir=swagger/templates \
  --spec=swagger/$SERVICE.yaml \
  --server-package=restapi/$SERVICE \
  --model-package=restapi/$SERVICE/definitions \
  --exclude-main \
  --config-file=swagger/config/go-swagger.yaml

cd restapi/$SERVICE
go mod init github.com/ckpbin/core/restapi/$SERVICE
go mod tidy
