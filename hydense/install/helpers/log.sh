#!/bin/bash

log() {
  echo "$@" | sudo tee -a "$HYDENSE_LOGFILE"
}
