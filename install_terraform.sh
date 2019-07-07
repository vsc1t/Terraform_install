#!/usr/bin/env bash

# Install and configure terraform for Linux 64-bit

PLUGINS_CACHE_DIR='$HOME/.terraform.d/plugin-cache'
TERRAFORM_VERSION='terraform_0.12.3_linux_amd64.zip'
TERRAFORMRC="$HOME/.terraformrc"
TERRAFORM_LOCATION="$HOME/.local/bin"
EXPORT_LOCAL_PATH='export PATH=$PATH:'"$LOCAL_PATH"

sudo apt-get update && sudo apt-get install wget unzip -y && \
wget -Nq https://releases.hashicorp.com/terraform/0.12.3/"$TERRAFORM_VERSION" \
-O /tmp/"$TERRAFORM_VERSION" && unzip -o /tmp/"$TERRAFORM_VERSION" -d /tmp/terraform && \
mkdir -p "$TERRAFORM_LOCATION" && cp -f /tmp/terraform/terraform "$TERRAFORM_LOCATION" && \
mkdir -p "$(eval echo -n $PLUGINS_CACHE_DIR)" ; "$TERRAFORM_LOCATION"/terraform -install-autocomplete

if ! grep -oFxq "$PLUGINS_CACHE_DIR" "$TERRAFORMRC" ; then
  echo "plugin_cache_dir = \"$PLUGINS_CACHE_DIR\"" >> "$TERRAFORMRC"
fi
