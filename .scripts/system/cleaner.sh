#!/bin/sh

# Start message:
echo "cleaning start!"
sleep 1
# Cleaning aptitude:
echo "Aptitude: cache and unused packages cleaning..."
sudo apt autoclean
sudo apt clean
sudo apt autoremove
sleep 1
# Purge old app files:
echo "Purging old file resudu..."
sudo [[ $(dpkg -l | grep ^rc) ]] && sudo dpkg -P $(dpkg -l | awk '/^rc/{print $2}') || echo "Aucun résidu trouvé."
sleep 1
# Empty trash:
echo "Cleaning trashs..."
rm -rf ~/.local/share/Trash/**/*
sleep 1
# Local purge:
echo "Local purge"
sudo localepurge
sleep 1
# Deletion auto-save files:
echo "Deletion auto-save files..."
sudo find ~/ -name '*~' -print0 | xargs -0 rm
sleep 1
# journal files:
sudo journalctl --vacuum-size=200M
sleep 1

echo "Clean finished"
