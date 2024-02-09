#!/bin/sh
zenity --list \
	--title="Choose what you want to do" \
	--column="Option" --column="Description" \
	Merge "Merges split XCI files together" \
	Exit "Exits the program"
if [ "$( echo "Merge" )" ]; then zenity --info \
--text="Choose a file in the file selector"
FILE=`zenity --file-selection --title="Select a File"`

case $? in
         0)
                echo "\"$FILE\" selected.";;
         1)
                echo "No file selected.";;
        -1)
                echo "An unexpected error has occurred.";;
esac
xcifile="$FILE"
cd $( dirname "$FILE")
if zenity --entry \
--title="Choose name for XCI output" \
--text="Enter name for XCI output" \
--entry-text "" > "OUTPUT"
  then echo $?
  else echo="No name entered"
fi
cat *.xc* > "$(cat OUTPUT).xci"
fi
rm -rf OUTPUT;
if [ "$( echo "Exit" )" ]; then exit
