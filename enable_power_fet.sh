#!/bin/sh

#Ugly but working so far - wait until the GPIO chip file appears
counter=0
while [ ! -e /sys/class/gpio/gpiochip496 ]
do
  sleep 1
  counter=`expr $counter + 1`
  if [ $counter -gt 20 ]; then exit 1; fi
done

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
