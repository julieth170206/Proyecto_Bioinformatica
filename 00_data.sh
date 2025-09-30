#!/usr/bin/env bash
set -euo pipefail

mkdir -p data
cd data
wget -O data.tar.gz https://osf.io/2jc4a/download
#Descomprimir
tar -xvzf data.tar.gz
mv data raw
rm -rf data.tar.gz