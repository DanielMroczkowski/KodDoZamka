# KodDoZamka / Code for the lock



This project contains 4 auxiliary files and one main file.


# **MAIN.VHD**  
contains: 

##clock_div.vhd
The Div Clock is designed to divide our clock frequency given from quartz to a certain value of up to 100 Hetrz

##mod4.vhd
Its task is to change the control at the output using the clock

##module1z4.vhd

Helps to control anodes with 7 segment displays

##mux32to8.vhd
Limits the amount of data from 4x8 to 1x8