#!/bin/sh

SERVICE=$1

rm -rf restapi/$SERVICE
swagger generate server \
  --allow-template-override \
  --template-dir=docs/templates \
  --spec=docs/$SERVICE.yaml \
  --server-package=restapi/$SERVICE \
  --model-package=restapi/$SERVICE/definitions \
  --exclude-main \
  --config-file=docs/config/go-swagger.yaml

cd restapi/$SERVICE
go mod init github.com/ckpbin/swagger/restapi/$SERVICE
go mod tidy
