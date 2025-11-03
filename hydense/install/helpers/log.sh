#!/bin/bash

clear_log_file() {
  cat "$HYDENSE_LOGFILE"
}

log() {
  echo "$@" | sudo tee -a "$HYDENSE_LOGFILE"
}
