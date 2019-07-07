#!/usr/bin/env bash

# Automatic install vscale provider for terraform
# GOPATH should be configured before launch

source ~/.profile
sudo apt-get update && sudo apt-get install git -y && \
mkdir -p "$GOPATH"/src/github.com/terraform-providers/terraform-provider-vscale && \
git clone https://github.com/burkostya/terraform-provider-vscale.git \
"$GOPATH"/src/github.com/terraform-providers/terraform-provider-vscale && \
cd "$GOPATH"/src/github.com/terraform-providers/terraform-provider-vscale && \
go get ./... && go build && mkdir -p ~/.terraform.d/plugins && \
mv -f "$GOPATH"/bin/terraform-provider-vscale ~/.terraform.d/plugins/
