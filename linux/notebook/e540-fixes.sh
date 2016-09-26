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

cat > /etc/rc.local <<'_EOF'
#!/bin/sh -e

# Fix touchpad
syndaemon -i 0.6 -K d

# Fix LED after wakup
cat > /etc/pm/sleep.d/11_led_fix <<'_EOF'
#!/bin/sh

if [ "$1" = "resume" ]
then
    echo '0 on' > /proc/acpi/ibm/led
fi
_EOF
