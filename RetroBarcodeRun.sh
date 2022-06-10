# !/bin/bash

# --------------------------------------
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
# The CSV lines are using hashtag as delimiter. (so the data can be added as a comment in the script and whit a hashtag we are flexible using many other charachters)
# Data can simply be added inside this script.
# If you don't have a barcode scanner you can simply type the code.
# The script will react also on other parts found in the CSV lines.
# So when you want to run, for example Green Baret, you can also do this by typing : 3100438, Green or gbaret.
# If what you entered is not unigue then the first match will run.

# Needed devices :
# First of all you need a barcade scanner that can be used as a virtual keyboard.
# The bascode scanner I use is a Symbol CS4070 which is paired with bluetooth as a keyboard HID device.
# There are probably more obsolete barcode scanners around which can do this trick too.
## Settings Symbol CS4070 (advise : get the manual) :
## First you have to set some settings connecting the device with USB
## When you connect the scanner with the USB it becomes an usb-drive where you can edit some configs
### The important settings are in /media/pi/CS4070/Parameters/CONFIG.INI :
### HIDSecurity=Low (connecting the device to a computer is easy now, no need to enter a pin code)
### Suffix=1 (this will produce an enter after the barcode, so the procam will read the input)
### Save these setting on your CS4070.
## Now you can connect the device with bluetooth.
## If the computer doesn't recognise the device then my experience was to scan the barcode "*Bluetooth HID Profile".
## After doing that the device was detected by my computer in the X enviroment.
## Connecting can also be done in the CLI with the command "bluetoothctl"

# Dependencies :
# When using a bluetooth device you have to install the nessecary bluetooth software for pairing.
# The script is meant for running games with emulators, installed by RetroPie.
# When using the script in the same way, install RetroPie first.
# (This script can work standalone, depending on the data that's added)

# How to run :
# Make the program executable and run it in the CLI
# --------------------------------------

# The actual script
# --------------------------------------
while true
do 
 clear
 echo "Scan your barcode or type a search entry : (exit with \"ctrl+c\")"
 read line
 file=$(awk "/#[0-9]/&&/$line/" $0|cut -d "#" -f5)
 system=$(awk "/#[0-9]/&&/$line/" $0|cut -d "#" -f3)
 [[ -n "$file" ]]&&[[ "$file" == *\/* ]]&&eval "/opt/retropie/supplementary/runcommand/runcommand.sh 0  SYS  $system $file"
 sleep 0.5
done
# --------------------------------------

# old barcodes can be found here : https://www.gamesmen.com.au (at least for atari lynx)
# example : https://www.gamesmen.com.au/lynx-shadow-of-the-beast (matched with my barcode)
# example : https://www.gamesmen.com.au/lynx-batman-returns (which I did not have anymore)

# old barcodes can be found here : https://www.retroplace.com/en/games?item type=2&system short=msx (at least for msx)
# click in the search option on the joypad,then you can search for games
# you can even search on barcodes
# example : https://www.retroplace.com/en/games/18600--vampire-killer

# old barcodes can be found here : http://msxarchive.nl/pub/msx/photos/MSX Game Covers/ (at least for msx)

# Barcode UPC-A / can be generated with glabels or on "https://barcode.tec-it.com" (select EAN/UPC)

# The CSV database (#barcode#runcommand)

#077000021427#atarilynx#Crystal Mines II#"$HOME/RetroPie/roms/atarilynx/BarcodeOriginals/Crystal Mines II (USA, Europe).lnx"
#077000020642#atarilynx#Zarlor Mercenary#"$HOME/RetroPie/roms/atarilynx/BarcodeOriginals/Zarlor Mercenary (USA, Europe).lnx"
#077000021670#atarilynx#Shadow of the Beast#"$HOME/RetroPie/roms/atarilynx/BarcodeOriginals/Shadow of the Beast (USA, Europe).lnx"
#077000504043#atarilynx#Bill & Ted's Excellent Adventure#"$HOME/RetroPie/roms/atarilynx/BarcodeOriginals/Bill & Ted's Excellent Adventure (USA, Europe).lnx"
#077000504869#atarilynx#Gates of Zendocon#"$HOME/RetroPie/roms/atarilynx/BarcodeOriginals/Gates of Zendocon, The (USA, Europe).lnx"
#022000021403#atarilynx#Batman Returns#"$HOME/RetroPie/roms/atarilynx/BarcodeOriginals/Batman Returns (USA, Europe).lnx"

#045496730116#gameboy#F-1 Race#"$HOME/RetroPie/roms/gb/BarcodeOriginals/F-1 Race (World).zip"

#5015173100438#msx#Green Beret,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/gberet.zip
#4988602537079#msx#Parodius#$HOME/RetroPie/roms/msx/BarcodeOriginals/parodius.zip
#4988602511550#msx#Penguin Adventure#$HOME/RetroPie/roms/msx/BarcodeOriginals/pengadv.zip
#4988602532425#msx#Salamander#$HOME/RetroPie/roms/msx/BarcodeOriginals/salamand.zip
#4988602512472#msx#Vampire Killer#$HOME/RetroPie/roms/msx/BarcodeOriginals/vampkill.zip

#4988602532401#msx#Pennant Race 1,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/
#4988602510744#msx#Nemesis,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/
#4988602528701#msx#Nemesis 2 / Gradius,Konami/Nemesis 2,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/gradius.zip
#4988602546415#msx#Nemesis 3,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/nemesis3.zip
#4988602544763#msx#Contra,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/
#4988602528749#msx#F-1 Spirit The Way To Formula-1,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/f1spirit.zip
#4902704840066#msx#F-1 Spirit 3D Special -Konami Panasoft-#$HOME/RetroPie/roms/msx/BarcodeOriginals/
#4988602541267#msx#King's Valley II El Giza's Seal,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/kingval2.zip
#4988602542059#msx#Kings Valley 2,Konamimsx2#$HOME/RetroPie/roms/msx/BarcodeOriginals/
#4988602527230#msx#Metal Gear,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/mgear.zip
#4988602553932#msx#Metal Gear 2 Solid Snake,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/mgear2ss.zip
#4988602512755#msx#Qbert,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/qbert.zip
#4988602528787#msx#Usas,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/usas.zip
#4988602541311#msx#Uranai,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/
#4988602524604#msx#Ganbare Goemon,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/ggoemon.zip
#4988602505832#msx#Knightmare,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/knightmr.zip
#4988602510072#msx#Konami's Synthesizer,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/
#4988602549102#msx#Majutsushi,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/
#4988602526226#msx#Maze of Galious,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/knightm2.zip
#4988602541298#msx#Snatcher,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/
#4988602554120#msx#SD Snatcher,Konami#$HOME/RetroPie/roms/msx/BarcodeOriginals/

#4988602502633#msx#Game Master,Konami
#4988602532326#msx#Game Master 2,Konami

