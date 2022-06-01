# Idea :

In the MagPi magazine 116 I read about someone that uses the raspberry pi as barcode scanner which is connected to a Mister-FPGA-board.

With that project you can pick an original game out of the cupboard, scan the code on the game package and then the Mister-FPGA-board will emulate the game you just scanned.

The idea of this script is similar but it uses a separate barcode scanner and it loads the game on the Raspberry Pi instead.


# Use : 

Basically, run software by scanning the barcode with a compatible barcode scanner.

The barcode and runcommand are stored, as a CSV database, inside this script.

The CSV lines are using hashtag as delimiter. (so the data can be added as a comment in the script and with a hashtag we are flexible using many other charachters)

Data can simply be added inside this script.


# Needed devices :

First of all you need a barcade scanner that can be used as a virtual keyboard.

(BTW. if you don't have a barcode scanner you can just type the numbers of your barcode + enter)

The bascode scanner I use is a Symbol CS4070 which is paired with bluetooth as a keyboard HID device.

There are probably more obsolete barcode scanners around which can do this trick too.

  Settings Symbol CS4070 (advise : get the manual) :

  First you have to set some settings connecting the device with USB

  When you connect the scanner with the USB it becomes an usb-drive where you can edit some configs

  The important settings are in /media/pi/CS4070/Parameters/CONFIG.INI :

  HIDSecurity=Low (connecting the device to a computer is easy now, no need to enter a pin code)

  Suffix=1 (this will produce an enter after the barcode, so the procam will read the input)

  Save these setting on your CS4070.

 Now you can connect the device with bluetooth.

 If the computer doesn't recognise the device then my experience was to scan the barcode "*Bluetooth HID Profile".

 After doing that the device was detected by my computer in the X enviroment.

 Connecting can also be done in the CLI with the command "bluetoothctl"


# Dependencies :

When using a bluetooth device you have to install the nessecary bluetooth software for pairing.

The script is meant for running games with emulators, installed by RetroPie.

When using the script in the same way, install RetroPie first.

(This script can work standalone, depending on the data that's added)


# How to run :

Make the program executable and run it in the CLI
