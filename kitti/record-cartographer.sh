#!/bin/bash

set -eu

# run recordmydesktop in the background
recordmydesktop --no-sound --no-cursor --display $DISPLAY &
RECORDMYDESKTOP_PID=$!

# execute command
$@ 

# terminate recordmydesktop
kill -s TERM $RECORDMYDESKTOP_PID || true
wait $RECORDMYDESKTOP_PID || true

