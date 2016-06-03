cat > /etc/rc.local <<'_EOF'
#!/bin/sh -e
# Thinkpad E540 fixes
# fix touchpad
syndaemon -i 0.6 -K d
# keep brightness low after startup
echo 1057 > /sys/class/backlight/intel_backlight/brightness
_EOF
