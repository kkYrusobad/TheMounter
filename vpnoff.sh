#!/bin/sh

GREEN="\e[32m"
RED="\e[31m"
MAGENTA="\e[35m"
CYAN="\e[36m"
BOLDMAG="\e[1;35m"
ENDCOLOR="\e[0m"

echo -e "${BOLDMAG} _____ _        __  __              _           ${ENDCOLOR}"
echo -e "${BOLDMAG}|_   _| |_  ___|  \/  |___ _  _ _ _| |_ ___ _ _ ${ENDCOLOR}"
echo -e "${BOLDMAG}  | | | ' \/ -_) |\/| / _ \ || | ' \  _/ -_) '_|${ENDCOLOR}"
echo -e "${BOLDMAG}  |_| |_||_\___|_|  |_\___/\_,_|_||_\__\___|_|  ${ENDCOLOR}"

ismounted=$(grep kkytest /etc/mtab)
theip=$(/home/kky/.local/bin/custom/ipc)

if [[ "$theip" == "$OCIP" ]]; then
	echo -e "\n${CYAN}Checking mount...${ENDCOLOR}\n"

	if [[ -z $ismounted ]]; then
		echo -e "${GREEN}======================================${ENDCOLOR}"
		echo -e "${GREEN}Not mounted, Stopping VPNoc...${ENDCOLOR}"
		echo -e "${GREEN}======================================${ENDCOLOR}"
		wg-quick down love
	else
		echo -e "${GREEN}======================================${ENDCOLOR}"
		echo -e "${GREEN}Server's Disk mounted, Unmounting...${ENDCOLOR}"
		echo -e "${GREEN}======================================${ENDCOLOR}"
		fusermount -u /home/kky/garbage/notlove
		echo "DONE (fusermount)"
		sleep 2s
		echo -n "Checking again..."
		sleep 1s
		stillmounted=$(grep kkytest /etc/mtab)
		if [[ -z $stillmounted ]]; then
			echo -e " not mounted, good\n"
			echo -e "${GREEN}==============${ENDCOLOR}"
			echo -e "${GREEN}VPNout...${ENDCOLOR}"
			echo -e "${GREEN}==============${ENDCOLOR}"
			wg-quick down love
			sleep 1s
			echo -e "\n${GREEN}==============${ENDCOLOR}"
			echo -e "${GREEN}Mounting...${ENDCOLOR}"
			echo -e "${GREEN}==============${ENDCOLOR}"
			sshfs kkytest@notlove:/home/plexmedia/ /home/kky/garbage/notlove
			sleep 1s
			if [[ -z $(grep kkytest /etc/mtab) ]]; then
				echo -e "${RED}Some problem Occured, manual check requested.${ENDCOLOR}"
			else
				echo -e "Mounted Succesfully, Directory reads\n"
			fi
			ls -la /home/kky/garbage/notlove
		else
			echo -e "${RED}Unmount problem, manual check requested${ENDCOLOR}"
		fi
	fi
else
	echo -e "\n${RED}Not connected to the server!${ENDCOLOR}"
fi
