#!/usr/bin/env sh

# sim_enable=1
echo "Enable SIM card"
gpioset 2 25=1

# sim_sel=1 == SIM2
echo "Select SIM2"
gpioset 3 16=1
gpioset 1 4=0,5=1

# gsm power on
#echo "Power on the GSM modem"
#gpioset 1 15=1
#gpioset 3 18=1
#sleep 10 

# gsm_reset
echo "Resetting the GSM modem"
gpioset 3 17=1
sleep 1
gpioset 3 17=0

