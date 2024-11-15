#!/bin/sh

# Write output for SX1302 reset PJ9 on the connect bridge
gpioset gpiochip9 9=1
sleep 0.1
gpioset gpiochip9 9=0

exit 0
