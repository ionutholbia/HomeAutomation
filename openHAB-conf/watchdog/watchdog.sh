#!/bin/bash

echo "CHECKING STATUS..."

if sudo su -c 'sshpass -p "habopen" ssh openhab@127.0.0.1 -p 8101 openhab:things show | grep "Status: OFFLINE"' pi ; then
   echo "STATUS OFFLINE -> RESTARTING OPENHAB."
   systemctl restart openhab.service
else
   if sudo su -c 'sshpass -p "habopen" ssh openhab@127.0.0.1 -p 8101 openhab:things show | grep "Status: UNKNOWN"' pi ; then
      echo "STATUS UNKNOWN -> RESTARTING OPENHAB."
      systemctl restart openhab.service
   else
      echo "ALL THINGS ARE ONLINE."
   fi
fi