#!/usr/bin/env bash
set -euo pipefail

CLUSTER_ID=$2

install() {
	sed "s/CLUSTERID/$CLUSTER_ID/g" /cnab/app/km.yaml.template > /cnab/app/km.yaml
	echo ${CLUSTER_ID}
}

upgrade() {
	echo "Upgrading to latest version"
	sed "s/CLUSTERID/{CLUSTER_ID}/g" /cnab/app/km.yaml.template > /cnab/app/km.yaml
	echo ${CLUSTER_ID}
}

uninstall() {
	sed "s/CLUSTERID/{CLUSTER_ID}/g" /cnab/app/km.yaml.template > /cnab/app/km.yaml
	echo Uninstalling CloudCasa.. Goodbye!!
}

# Call the requested function and pass the arguments as-is
"$@"
