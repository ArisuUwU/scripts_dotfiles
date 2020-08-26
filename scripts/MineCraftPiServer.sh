clear
while true; do
	echo "----- Pi Craft Main Menu -----"
	echo ""
	echo "(A) - Start a local Minecraft server"
	echo "(B) - SSH (Secure Shell) into a Minecraft server"
	echo "(C) - Display your local ip"
	echo "(D) - Cancel and go to Pi login"
	echo "(E) - To shutdown Pi Craft"
	echo "(F) - To edit local Minecraft server properties (Advanced)"
	echo ""
	read -p "Please select an option: " abcdef
	case $abcdef in
		[Aa]* ) java -jar /home/pi/Desktop/minecraft_server/minecraft_server.jar; read -p "Your server has stopped, press [Enter] to return to the Pi Craft menu..." *; clear;;
		[Bb]* ) echo "Enter IP adress:"; read ip; ssh "$ip"; read -p "Press [Enter] key to return to the Pi Craft menu..." *; clear;;
		[Cc]* ) ifconfig; read -p "Press [Enter] key to return to the Pi Craft menu..." *; clear;;
		[Dd]* ) clear && break;;
		[Ee]* ) shutdown -h now;;
		[Ff]* ) clear && while true; do
				echo "----- Pi Craft Edit Menu -----"
				echo ""
				echo "What file would you like to edit? (CTRL + X, Y + [Enter] to save the file)"
				echo ""
				echo "(A) - Server Properties"
				echo "(B) - Operators list"
				echo "(C) - Banned IPs list"
				echo "(D) - Banned Players list"
				echo "(E) - Whitelist"
				echo "(F) - Minecraft EULA"
				echo "(G) - How to use the text editor"
				echo "(H) - Back to Pi Craft menu"
				echo ""
				read -p "Please select an option: " abcdefgh
				case $abcdefgh in
					[Aa]* ) sudo vi /server.properties; clear;;
					[Bb]* ) sudo vi /ops.json; clear;;
					[Cc]* ) sudo vi /banned-ips.json; clear;;
					[Dd]* ) sudo vi /banned-players.json; clear;;
					[Ee]* ) sudo vi /whitelist.json; clear;;
					[Ff]* ) sudo vi /eula.txt; clear;;
					[Gg]* ) clear && echo "The vi text editor can be difficult to use. So here is a quick navigation guide."; echo""; echo "i = insert/edit the current line"; echo "After editing a line, press an arrow key to cancel insert mode"; echo "To move backwards, use [BACKSPACE]";echo "[Space] is used to make the cursor move to the right"; echo "To make a new line down press o"; echo "To go down one line, press j"; echo "To move up one line press k"; echo "To save your file, get out out of insert mode and type :w"; echo "To exit and return to the menu, type in :q!"; read -p "Press [Enter] key to return to the Pi Craft menu..." *; clear;;
					[Hh]* ) clear && break;;
					* ) read -p "Please select one of the options. Press [Enter] to return to the menu..." $*; clear;;
					esac
			done;;
		* ) read -p "Please select one of the options. Press [Enter] to return to the menu..."; clear;;
	esac
done
