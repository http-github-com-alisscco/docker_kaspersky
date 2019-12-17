#!/bin/bash
function start_service() {
  echo -n "Starting Service... "
  /etc/init.d/kesl-supervisor start && echo "Done!" || echo "Failed!"
}

case "${1}" in
  shell )
    echo "stage: ${1}"
    start_service
    echo "Usage:"
    echo "kesl-control --scan-file <path>"
    /bin/bash
    ;;
  version )
    echo "stage: ${1}"
    start_service
    kesl-control -S --app-info
    ;;
  scan )
    echo "stage: ${1}"
    start_service
    echo "Starting Scan of /data:"
    kesl-control --scan-file /data
    echo "Found Threats"
    kesl-control -B --query
    ;;
  debug )
    echo "stage: ${1}"
    /bin/bash
    ;;
esac
