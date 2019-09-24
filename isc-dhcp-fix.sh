#!/bin/bash

Card0(){
ifconfig eth0 | grep -Po '(?<=inet )[\d.]+' &> /dev/null
         if [ $? == 0 ];
            then
                sleep 1
                #Card1
            else
                 sudo dhclient eth0
        fi

}

#Card1(){
#ifconfig eth1/wlan0 | grep -Po '(?<=inet )[\d.]+' &> /dev/null
#         if [ $? == 0 ];
#            then
#                Cardn
#            else
#                sudo dhclient eth1/wlan0
#                Cardn
#fi
#}
#.........
#.........
#Cardn(){
#ifconfig cardn | grep -Po '(?<=inet )[\d.]+' &> /dev/null
#         if [ $? == 0 ];
#            then
#                Card0
#           else
#                sudo dhclient eth0
#fi
#}

while true
do
Card0
#Card1
#....
#Cardn
done
