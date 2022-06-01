#!/bin/bash

#--------------------------------------
# Author : Folkert van der Meulen
# Date   : 01/06/2022
#
# Licence :
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Idea :
# In the MagPi magazine 116 I read about someone that uses the raspberry pi as barcode scanner which is connected to a Mister-FPGA-board.
# With this you can pick an original game out of the cupboard, scan the code on the game package and then the Mister-FPGA-board will emulate the game you just scanned.
# The idea of this script is similar but it uses a separate barcode scanner and it loads the game on the Raspberry Pi instead.

# Use : 
# Basically, run software by scanning the barcode with a compatible barcode scanner.
# The barcode and runcommand are stored, as a CSV database, inside this script.
# The CSV lines are using hashtag as delimiter. (so the data can be added as a comment in the script and with a hashtag we are flexible using many other charachters)
# Data can simply be added inside this script.

# Needed devices :
# First of all you need a barcade scanner that can be used as a virtual keyboard.
# (BTW. if you don't have a barcode scanner you can just type the numbers of your barcode + enter)
# The bascode scanner I use is a Symbol CS4070 which is paired with bluetooth as a keyboard HID device.
# There are probably more obsolete barcode scanners around which can do this trick too.
#  Settings Symbol CS4070 (advise : get the manual) :
#  First you have to set some settings connecting the device with USB
#  When you connect the scanner with the USB it becomes an usb-drive where you can edit some configs
#   The important settings are in /media/pi/CS4070/Parameters/CONFIG.INI :
#   HIDSecurity=Low (connecting the device to a computer is easy now, no need to enter a pin code)
#   Suffix=1 (this will produce an enter after the barcode, so the procam will read the input)
#   Save these setting on your CS4070.
#  Now you can connect the device with bluetooth.
#  If the computer doesn't recognise the device then my experience was to scan the barcode "*Bluetooth HID Profile".
#  After doing that the device was detected by my computer in the X enviroment.
#  Connecting can also be done in the CLI with the command "bluetoothctl"

# Dependencies :
# When using a bluetooth device you have to install the nessecary bluetooth software for pairing.
# The script is meant for running games with emulators, installed by RetroPie.
# When using the script in the same way, install RetroPie first.
# (This script can work standalone, depending on the data that's added)

# How to run :
# Make the program executable and run it in the CLI
#--------------------------------------

# The actual script
#--------------------------------------
echo Scan your barcode.
while true;do read line;eval $(grep $line $0|cut -d "#" -f3);done
#--------------------------------------

#old barcodes can be found here : https://www.gamesmen.com.au (at least for atari lynx)
#example : https://www.gamesmen.com.au/lynx-shadow-of-the-beast (matched with my barcode)
#example : https://www.gamesmen.com.au/lynx-batman-returns (which I did not have anymore)

#Barcode UPC-A / can be generated with glabels or on "https://barcode.tec-it.com" (select EAN/UPC)

# The CSV database (#barcode#runcommand)
#--------------------------------------
#atari lynx
#077000021427#/opt/retropie/emulators/retroarch/bin/retroarch -L /opt/retropie/libretrocores/lr-handy/handy_libretro.so --config /opt/retropie/configs/atarilynx/retroarch.cfg "/home/pi/RetroPie/roms/atarilynx/Crystal Mines II (USA, Europe).lnx"
#077000020642#/opt/retropie/emulators/retroarch/bin/retroarch -L /opt/retropie/libretrocores/lr-handy/handy_libretro.so --config /opt/retropie/configs/atarilynx/retroarch.cfg "/home/pi/RetroPie/roms/atarilynx/Zarlor Mercenary (USA, Europe).lnx"
#077000021670#/opt/retropie/emulators/retroarch/bin/retroarch -L /opt/retropie/libretrocores/lr-handy/handy_libretro.so --config /opt/retropie/configs/atarilynx/retroarch.cfg "/home/pi/RetroPie/roms/atarilynx/Shadow of the Beast (USA, Europe).lnx"
#077000504043#/opt/retropie/emulators/retroarch/bin/retroarch -L /opt/retropie/libretrocores/lr-handy/handy_libretro.so --config /opt/retropie/configs/atarilynx/retroarch.cfg "/home/pi/RetroPie/roms/atarilynx/Bill & Ted's Excellent Adventure (USA, Europe).lnx"
#077000504869#/opt/retropie/emulators/retroarch/bin/retroarch -L /opt/retropie/libretrocores/lr-handy/handy_libretro.so --config /opt/retropie/configs/atarilynx/retroarch.cfg "/home/pi/RetroPie/roms/atarilynx/Gates of Zendocon, The (USA, Europe).lnx"
#022000021403#/opt/retropie/emulators/retroarch/bin/retroarch -L /opt/retropie/libretrocores/lr-handy/handy_libretro.so --config /opt/retropie/configs/atarilynx/retroarch.cfg "/home/pi/RetroPie/roms/atarilynx/Batman Returns (USA, Europe).lnx"

#gameboy
#045496730116#/opt/retropie/emulators/retroarch/bin/retroarch -L /opt/retropie/libretrocores/lr-gambatte/gambatte_libretro.so --config /opt/retropie/configs/gb/retroarch.cfg "/home/pi/RetroPie/roms/gb/F-1 Race (World).zip"
#--------------------------------------
