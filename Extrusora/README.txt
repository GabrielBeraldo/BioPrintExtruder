                   .:                     :,                                          
,:::::::: ::`      :::                   :::                                          
,:::::::: ::`      :::                   :::                                          
.,,:::,,, ::`.:,   ... .. .:,     .:. ..`... ..`   ..   .:,    .. ::  .::,     .:,`   
   ,::    :::::::  ::, :::::::  `:::::::.,:: :::  ::: .::::::  ::::: ::::::  .::::::  
   ,::    :::::::: ::, :::::::: ::::::::.,:: :::  ::: :::,:::, ::::: ::::::, :::::::: 
   ,::    :::  ::: ::, :::  :::`::.  :::.,::  ::,`::`:::   ::: :::  `::,`   :::   ::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  :::::: ::::::::: ::`   :::::: ::::::::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  .::::: ::::::::: ::`    ::::::::::::::: 
   ,::    ::.  ::: ::, ::`  ::: ::: `:::.,::   ::::  :::`  ,,, ::`  .::  :::.::.  ,,, 
   ,::    ::.  ::: ::, ::`  ::: ::::::::.,::   ::::   :::::::` ::`   ::::::: :::::::. 
   ,::    ::.  ::: ::, ::`  :::  :::::::`,::    ::.    :::::`  ::`   ::::::   :::::.  
                                ::,  ,::                               ``             
                                ::::::::                                              
                                 ::::::                                               
                                  `,,`


http://www.thingiverse.com/thing:197184
X3uder - OS 12VDC RepRap Filament extruder by mirox3m is licensed under the Creative Commons - Attribution - Share Alike license.
http://creativecommons.org/licenses/by-sa/3.0/

# Summary

**Update 17.01.2014** - 10mm higher guide and FAN stand  

X3uder is a RepRap inspired 12VDC Filament extruder. It is designed so that most parts are printable and readily available in hardware stores. The X3uder is powered by a RepRap controller and 12 VDC power supply that every user has with his 3D printer. It uses 2 x 40 watt 12 volt heating cartridges. The motor consumes between 0.5 and 3 amps, so the typical 15 amp power supply is good enough.  

Design is based on different ideas from Lyman's, Filastruder and Filabot extruders.  

The idea with this Filament Extruder is that when a user needs to produce some filament, he replaces the cables of his 3D printer heater output and thermistor input, connects 12vdc via a switch to the fan and motor. In this way there is no need for additional PID controllers and power supplies.  

**Filament production results**  
Production rate - 18 to 34 cm per minute of 3mm filament (depending on the plastics you are using and the extruding temperature). My tests show that 1 kg of filament is produced for about 10-12 hours.  
Filament diameter tolerance - +/- 0.05 is achievable, but usually it is 0.07.  
I haven't tested with 1.75 mm filament production.  
   
**List of editable TinkerCAD models** (ungroup if necessary):  
1. Guide/FAN stand: https://tinkercad.com/things/8mEPBDgOWQd-guidefan-stand  
2. Hopper for 20 mm OD barrel: https://tinkercad.com/things/jkFueJEPnRY-hopper-for-20mm-barrel  
3. Motor plate: https://tinkercad.com/things/2YYIrt0b9gF-motor-plate  
4. Bearing plate: https://tinkercad.com/things/dBZ4dtmkxcm-bearing-plate  
5. Filament guide: https://tinkercad.com/things/fX7BdZS2nqC-filament-guide  

I am using it with a Melzi board. RAMPS MOSFETs seems to be OK too, but make sure to check that their extruder output is capable of supplying the necessary power!  

Here is a video demo of my X3uder: http://youtu.be/fFSQqvtYaDw  

**If you appreciate my work you can PayPal Donate to https://www.paypal.me/mirox3m**  

**Natural ABS plastic pellets**  
The natural ABS plastic pellets that I use are produced by LG Chem and sold in packages of 25 kg that cost 82.70 Euro (20% VAT included) - 3.3 Euro per kg (4.7 US$) !!!   
The pellets are LG HF380 with MFR 43 g/10 min (220C/10kg) datasheet: http://catalog.ides.com/Datasheet.aspx?I=26793&E=15166  
You can buy them from http://www.resinex.com/ if there is an office nearby - they have offices in 31 European countries.

# Instructions

Print the bearing plate with at least 4 perimeters. 50% infil is sufficient. The motor plate can be printed with 35% and at least 3 perimeters.  

Threaded rods are 8mm diameter and 160mm long. Bolts that hold the plates strong and used for motor mounting are 5mm.  

Barrel in my case is 20mmOD/16mmID st. steel pipe, but you can use a 1/2" nipel (21.3mm OD) and a Filastruder hopper. In case you are going to machine everything, as in my case, it is better to make metric threads instead - 20 mm, which will better fit the 20mm OD pipe.  The barrel is 220 mm long and the opening for the hopper starts 35 mm from it's back end. It has 15 mm 1/2 (20 mm if you make it metric) thread from both sides  
The nozzle is 27 mm long with 1/2 (20 mm if you make it metric) ext. thread on 14 mm  
The heating barrel is 40 mm dia, 30 mm long, 1/2 (20 mm if you make it metric) int. thread, 2 x 6 mm by 20 mm drills for heating cartridges.  
The aluminum flange is 65 mm dia, 8 mm long, 1/2 (20 mm if you make it metric) int. thread.  

The effective length of the auger (without its tail) is 210 mm. It has to be cut paralel to its spiral angle.   

Flange is a machined one, but you can use plumbing one if you edit the holes of the "bearing plate" accordingly in TinkerCAD.  

Motor is 2.5 RPM on load, torque => 100 kg/cm.  

FAN is 60 by 60 mm, 15 mm high.  

Use a thermistor which is the same as the one in your printer extruder so that you can easily switch from printer to filament extruder. PIDtune it as described here: http://reprap.org/wiki/PID_Tuning