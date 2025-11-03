#!/bin/bash

clear_log_file() {
  echo "" | tee "$HYDENSE_LOGFILE"
}

log() {
  echo "$@" | tee -a "$HYDENSE_LOGFILE"
}
