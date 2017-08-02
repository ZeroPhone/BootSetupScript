#!/bin/sh

#Setting FET-controlling GPIO to low
echo 511 > /sys/class/gpio/export || echo "Script already ran, or the IO expander is not available!"
echo "low" > /sys/class/gpio/gpio511/direction
#Blinking green LED for half a second
echo 496 > /sys/class/gpio/export || true
echo "high" > /sys/class/gpio/gpio496/direction
echo 0 > /sys/class/gpio/gpio496/value
sleep 0.5
echo 1 > /sys/class/gpio/gpio496/value
#Done
exit 0
