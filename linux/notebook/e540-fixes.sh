cat > /etc/rc.local <<'_EOF'
#!/bin/sh -e
# Thinkpad E540 fixes
# fix touchpad
syndaemon -i 0.6 -K d
# keep brightness low after startup
echo 1057 > /sys/class/backlight/intel_backlight/brightness
_EOF


cat > /etc/pm/sleep.d/11_led_fix <<'_EOF'
#!/bin/sh

if [ "$1" = "resume" ]
then
    echo '0 on' > /proc/acpi/ibm/led
fi
_EOF
