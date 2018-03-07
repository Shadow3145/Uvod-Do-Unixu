#!/bin/sh
fpc program.pas
./program | grep -v "[^0-9 ]" | head -n 5
rm program
rm program.o

