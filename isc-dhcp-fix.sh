#!/bin/bash

Card0()
{
ifconfig eth0 | grep -Po '(?<=inet )[\d.]+' &> /dev/null
         if [ $? == 0 ];
            then
                sleep 1
            else
                 sudo dhclient eth0
        fi

}

#Card1()
#{
#ifconfig eth1/wlan0 | grep -Po '(?<=inet )[\d.]+' &> /dev/null
#         if [ $? == 0 ];
#            then
#                sleep 1
#            else
#                sudo dhclient eth1/wlan0
#               
#fi
#}



while true
do
Card0
#Card1
#AddMoreCards
done
