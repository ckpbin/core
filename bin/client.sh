#!/bin/sh

SERVICE=$1

swagger generate client \
  --spec=swagger/$SERVICE.yaml \
  --client-package=restclient/$SERVICE \
  --model-package=restclient/$SERVICE/definitions

cd restclient/$SERVICE
go mod init github.com/ckpbin/core/restclient/$SERVICE
go mod tidy
