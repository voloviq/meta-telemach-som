#!/bin/sh

i=2

while [ $i -gt 0 ]

do

echo none > /sys/class/leds/LED_BLU/trigger
echo none > /sys/class/leds/LED_GRN/trigger
echo none > /sys/class/leds/LED_RED/trigger
echo none > /sys/class/leds/LED_YEL/trigger
echo timer > /sys/class/leds/LED_BLU/trigger
echo timer > /sys/class/leds/LED_GRN/trigger
echo timer > /sys/class/leds/LED_RED/trigger
echo timer > /sys/class/leds/LED_YEL/trigger

((i--))

done
