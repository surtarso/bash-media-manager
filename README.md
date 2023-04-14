            ┌─────────────────────────────────────────────────┐
            │▛▀▖      ▌   ▙▗▌     ▌▗     ▙▗▌                  │
            │▙▄▘▝▀▖▞▀▘▛▀▖ ▌▘▌▞▀▖▞▀▌▄ ▝▀▖ ▌▘▌▝▀▖▛▀▖▝▀▖▞▀▌▞▀▖▙▀▖│
            │▌ ▌▞▀▌▝▀▖▌ ▌ ▌ ▌▛▀ ▌ ▌▐ ▞▀▌ ▌ ▌▞▀▌▌ ▌▞▀▌▚▄▌▛▀ ▌  │
            │▀▀ ▝▀▘▀▀ ▘ ▘ ▘ ▘▝▀▘▝▀▘▀▘▝▀▘ ▘ ▘▝▀▘▘ ▘▝▀▘▗▄▘▝▀▘▘  │
            └─────────────────────────────────────────────────┘
      A companion 'Media Manager' in CLI inspired by the Dietpi Project.

## What is this for?
      Bash Media Manager is intended for ordinary people who
      own a server and serves media files. It was built around
      the Arr Family Suite (Lidarr, Sonarr etc) installed with
      Dietpi. (Should work on other enviroments, untested.)

      A companion app that eases many of the tasks needed when
      dealing with massive libraries intended for streaming and file 
      permissions when dealing with multiple software.
      It will convert files for best compatible streaming format and
      can also back them up.

      Including a tool for sharing media with friends without
      having to deal with multiple commands and names with spaces.

## Included Tools:
- [Launcher](): Dialog GUI for all scripts;
- [MP3 Converter](): Converts any audio file to mp3 for streaming;
- [MP4 Converter](): Converts any video file to mp4 for streaming;
- [Media Backup](): Backup media files;
- [Media Permissions](): Fix permissions on media files;
- [Media Share](): Easily copy specific media to another device;
- [Setup Enviroment](): Sets up media folders and owners;

## Dependencies:
      Bash Media Manager relies on 'ffmpeg' and/or 'handbrake' to perform 
      conversions and 'rsync' for file procedures and cannot work without 
      those.
      Optional dependencies include 'dialog' for GUIs and 'toilet'
      for CLI banners.

      Dependencies will be checked and installed at will during
      runtime or you can pre-install them with:

      apt install ffmpeg libmp3lame0 rsync handbrake-cli dialog toilet -y

## Installation:
0- Pre-install dependencies (optional):
- apt install ffmpeg libmp3lame0 rsync handbrake-cli dialog toilet -y

1- Clone this folder into /home/user/bmm/: 
- git clone https://github.com/surtarso/bash-media-manager.git ~/bmm

2- Run 'bmm-setup_enviroment' to generate a .env from template.
- cd ~/bmm && bmm-setup_enviroment

## Usage:
      Folders MUST be set-up prior to using any script (see 'bmm-setup_enviroment')

      If you dont want to see a GUI (dialog), use the scripts with --help
      arguement and follow the help text.

      For GUI usage, just use the scripts without any arguements or use 
      'bmm-launcher' to navigate between the tools.
