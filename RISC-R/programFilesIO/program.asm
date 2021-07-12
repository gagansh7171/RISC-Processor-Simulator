# Put r1 = n for calculating n! and store it in r2 
movi r1 0x5 
movi r2 0x1 
cmpi r1 0x0 
jzi 0x9 
jumpi 0x7 
mul r2 r2 r1 
subi r1 r1 0x1 
cmpi r1 0x1 
jci 0x5
