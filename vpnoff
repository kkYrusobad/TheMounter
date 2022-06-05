#!/bin/sh

echo " _____ _        __  __              _           "
echo "|_   _| |_  ___|  \/  |___ _  _ _ _| |_ ___ _ _ "
echo "  | | | ' \/ -_) |\/| / _ \ || | ' \  _/ -_) '_|"
echo "  |_| |_||_\___|_|  |_\___/\_,_|_||_\__\___|_|  "

ismounted=$(grep kkytest /etc/mtab)

theip=$(/home/kky/.local/bin/custom/ipc)

if [[ "$theip" == "$OCIP" ]]; then
	echo -e "\nChecking mount...\n"

	if [[ -z $ismounted ]]; then
		echo "======================================"
		echo "Not mounted, Stopping VPNoc..."
		echo "======================================"
		wg-quick down love
	else
		echo "======================================"
		echo "Server's Disk mounted, Unmounting..."
		echo "======================================"
		fusermount -u /home/kky/garbage/notlove
		echo "DONE (fusermount)"
		sleep 2s
		echo -n "Checking again..."
		sleep 1s
		stillmounted=$(grep kkytest /etc/mtab)
		if [[ -z $stillmounted ]]; then
			echo -e " not mounted, good\n"
			echo "=============="
			echo "VPNout..."
			echo "=============="
			wg-quick down love
			sleep 1s
			echo -e "\n=============="
			echo "Mounting..."
			echo "=============="
			sshfs kkytest@notlove:/home/plexmedia/ /home/kky/garbage/notlove
			sleep 1s
			if [[ -z $(grep kkytest /etc/mtab) ]]; then
				echo "Some problem Occured, manual check requested."
			else
				echo -e "Mounted Succesfully, Directory reads\n"
			fi
			ls -la /home/kky/garbage/notlove
		else
			echo -e "Unmount problem, manual check requested"
		fi
	fi
else
	echo -e "\nNot connected to the server!"
fi
