#!/bin/bash

# Script name: bmm-import_slskd2place.sh
# Moves files from Soulseek complete downloads folder to current folder
# Converts audio if necessary and applies proper permissions.
# Must be run inside /path/to/music/artist/ so albums are copied
# to the correct location.

# Define colors
GREEN="\033[0;32m"
RED="\033[0;31m"
NORMAL="\033[0m"

# Check if Soulseek download directory exists
if [ ! -d ~/downloads/soulseek ]; then
  echo -e "${RED}Error: Soulseek download directory not found!${NORMAL}"
  exit 1
fi

# Move files from Soulseek downloads
echo -e "${GREEN}Moving files...${NORMAL}"
if mv ~/downloads/soulseek/* . 2>/dev/null; then
  echo -e "${GREEN}Files successfully moved from Soulseek downloads.${NORMAL}"
else
  echo -e "${RED}Error: Failed to move files from Soulseek downloads!${NORMAL}"
  exit 1
fi

# Convert audio files
if bmm-converter_mp3 -a; then
  echo -e "${GREEN}Audio conversion script finished.${NORMAL}"
else
  echo -e "${RED}Warning: Audio conversion script failed!${NORMAL}"
fi

# Apply permissions
if bmm-media_permissions -t ./ lidarr goodies; then
  echo -e "${GREEN}Permissions script finished.${NORMAL}"
else
  echo -e "${RED}Warning: Permissions script failed!${NORMAL}"
fi
