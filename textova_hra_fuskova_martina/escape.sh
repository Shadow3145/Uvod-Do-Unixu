#!/bin/bash
do_help=no
savegame_name=""
ret_val=0
location=""

while [ -n "$1" ]; do
	case "$1" in
	--help)
		do_help=yes
		break
		;;
	-n) 
	    shift
	    if [ -n "$1" ] ; then
	    	savegame_name="$1".svg
		ret_val=4
	    else
	    	echo "You have to name your character" >&2
		ret_val=2
		break
	    fi
	    ;;

	 -l) 
	     shift
	     if [ -n "$1"  ] ; then
	    	savegame_name="$1"
		ret_val=3
	     else
		ret_val=2
		break
	     fi
	     ;;
	  *)
		ret_val=1
		break
		;;
	esac
	shift
	
done


#Unknown option
if [ $ret_val -le 1 ] ; then
	echo "Invalid option. Try escape.sh --help"
	exit
fi

#No name
if [ $ret_val -eq 2 ] ; then
	echo "You have to write name of your character. Try escape.sh --help"
	exit
fi

#Help
if [ $do_help = yes ] ; then
	echo "ESCAPE.SH
	- Launch script for a text adventure Escape.
	- options:
		-n	starts a new game. Must be followed by name.
		-l	loads a game. Must be followed by already existing name of a character."
	exit
fi

if [ $ret_val -eq 4 ] ; then
	cd savegames
	if [ -f "$savegame_name" ] ; then
		echo "This name already exists."
		exit
	else
		cp ./default.svg ./"$savegame_name"
		location=start.loc
	fi
	cd ..
fi

#Checking whether this name exists - load game
if [ $ret_val -eq 3  ] ; then
	cd savegames
	if [ -f "$savegame_name" ] ; then
		location=$(head  -n 1 "$savegame_name")
	else
		echo "Don't know character of this name."
		exit
	fi
	cd ..
fi

cd rooms
./"$location" "$savegame_name"

exit

		



	    	
		
