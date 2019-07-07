#!/usr/bin/env bash

# Install GO for Ubuntu 18.04
# First argument spcify GOPATH varibale
# By default GOPATH=~/go

if [ "$1" ] ; then
  GO_DIR=$1
else
  GO_DIR='$HOME/go'
fi

PROFILE="$HOME/.profile"

EXPORT_GOPATH="export GOPATH=$GO_DIR"
PROFILE_GOPATH="if [ -d $GO_DIR ] ; then
  $EXPORT_GOPATH
fi"

EXPORT_GOBIN='export PATH=$PATH:'"$GOPATH/bin"
PROFILE_GOBIN="
if [ -d $GO_DIR/bin ] ; then
  $EXPORT_GOBIN
fi"

sudo apt-get update && \
sudo apt-get install snapd -y && \
sudo snap install --classic go && \
mkdir -p "$(eval echo $GO_DIR)"

if ! grep -oFq "$EXPORT_GOPATH" "$PROFILE" ; then
  echo "$PROFILE_GOPATH" >> "$PROFILE"
fi
if ! grep -oFq "$EXPORT_GOBIN" "$PROFILE" ; then
  echo "$PROFILE_GOBIN" >> "$PROFILE"
fi
