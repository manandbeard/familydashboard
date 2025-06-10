#!/bin/bash

# Family Dashboard Kiosk Mode Startup Script
# Wait for network and X server
sleep 10

# Start Family Dashboard in kiosk mode
DISPLAY=:0 chromium-browser \
    --kiosk \
    --disable-infobars \
    --disable-session-crashed-bubble \
    --disable-restore-session-state \
    --disable-pinch \
    --overscroll-history-navigation=0 \
    --disable-features=TranslateUI \
    --disable-ipc-flooding-protection \
    --aggressive-cache-discard \
    --memory-pressure-off \
    --max_old_space_size=100 \
    http://localhost:5000 &