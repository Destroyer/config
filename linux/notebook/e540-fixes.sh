# Thinkpad E540 fixes
# Fix VLC tearing
cat > /etc/X11/xorg.conf.d/20-intel.conf <<'_EOF'
Section "Device"

Identifier "Intel Graphics"
Driver "intel"
Option "AccelMethod" "sna"
Option "TearFree" "true"

EndSection
_EOF

# Fix touchpad
syndaemon -i 0.6 -K d
xinput --set-prop --type=float  $(xinput list --id-only  "SynPS/2 Synaptics TouchPad") "Synaptics Coasting Speed" 0 0


# Fix LED after wakup
cat > /etc/pm/sleep.d/11_led_fix <<'_EOF'
#!/bin/sh

if [ "$1" = "resume" ]
then
    echo '0 on' > /proc/acpi/ibm/led
fi
_EOF
