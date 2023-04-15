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
      It will convert files for optimal streaming format and
      can also back them up.

      Includes a tool for sharing media with friends without
      having to deal with multiple commands and names with spaces.

## Included Tools:
- [Launcher](bmm-launcher): Dialog GUI for all scripts;
- [MP3 Converter](bmm-converter_mp3): Converts any audio file to mp3 for streaming;
- [MP4 Converter](bmm-converter_mp4): Converts any video file to mp4 for streaming;
- [Media Backup](bmm-media_backup): Backup media files;
- [Media Permissions](bmm-media_permissions): Fix permissions on media files;
- [Media Share](bmm-media_share): Easily copy specific media to another device;
- [Setup Enviroment](bmm-setup_enviroment): Sets up media folders and owners. (run me 1st)

## Dependencies:
      Bash Media Manager relies on 'ffmpeg' and/or 'handbrake-cli' to perform 
      conversions and 'rsync' for file procedures and cannot work without 
      those.
      
      Optional dependencies include 'dialog' for GUIs and 'toilet'
      for CLI banners.

      Dependencies will be checked and installed at will during
      runtime or you can pre-install them.
      
      This software was built while also using the deb-multimedia source.
      People have mixed feelings about it. I've been using it for over a
      decade without problems and I can't forsee any errors using this
      software without it. It should work normally tho, just saying.

## Installation (quick setup just run 1 and 2):
-1- Install deb-multimedia source packages (change dist_name for yours. ex bullseye):
- add 'deb https://www.deb-multimedia.org dist_name main non-free' to /etc/apt/source.list
- apt-get update -oAcquire::AllowInsecureRepositories=true
- apt-get install deb-multimedia-keyring
- apt update && apt upgrade -y

0- Pre-install dependencies (optional):
- apt install ffmpeg libmp3lame0 rsync handbrake-cli dialog toilet -y

1- Clone this folder into /home/user/bmm/: 
- git clone https://github.com/surtarso/bash-media-manager.git ~/bmm

2- Run 'bmm-setup_enviroment' to generate an .env file from template.
- cd ~/bmm && ./bmm-setup_enviroment

2a- Add B.M.M. to $PATH (optional):
- ./bmm-setup_enviroment --path

## Usage:
      Folders MUST be set-up prior to using any script.
      See 'bmm-setup_enviroment' or edit '~/bmm/.env'.

      For GUI usage, just use the scripts without any arguements. 
      You can use 'bmm-launcher' to navigate between the tools.
      
      If you dont want to see a GUI (dialog), use the scripts with --help
      arguement and follow the help text.

### Detailed view (--help):
-     Converter MP3
      Converts multiple formats to MP3 for streaming.
      Folders: Audio ROOT and JUNK are set up in .evn file.
      Usage: bmm-mp3_converter [-arg] [--arg]
      or run without args for GUI mode.

      -n [--no-gui]  -> No GUI interactive mode
      -a [--auto]    -> Use defaults. (asks no questions)
      -h [--help]    -> This message screen.

-     Converter MP4
      Converts VIDEO files to "H.264 AAC-2.0 Web-Optimized .mp4" for streaming.

      Usage: bmm-converter_mp4 [-arg] [--arg] [args]

      -hp [--handbrake-presets]     -> List optimal handbrake presets for streaming
      -hb [--handbrake]             -> Convert 'format' files from 'target folder' using "preset".
                                    (Ex: bmm-converter_mp4 --handbrake "/mnt/videos/" "avi" "Very Fast 720p30")
      -h [--help]                   -> Shows this screen.

-     Media Backup
      Backup manager for server media.
      Folders: Source and Destination are set up in .evn file.
      Usage: bmm-media_backup [-arg] [--arg]

      -s [--series]    -> Backup series library.
      -m [--movies]    -> Backup movies library.
      -c [--concerts]  -> Backup concerts library.
      -a [--audio]     -> Backup audio library.
      -u [--stand-up]  -> Backup stand-up library
      -f [--full]      -> Backup all libraries.
      -n [--no-gui]    -> Interactive-mode without a GUI.

      -h [--help]      -> Shows this screen.

-     Media Permissions
      Fix file/folder permissons for media software.
      Use with no arguements to enter the GUI.
      Folders: Folders, owners and group are set up in .evn file.
      USAGE: bmm-media_permissions [-arg] [--arg]

      -a [--audio]            -> Fix all audio permissions
      -s [--series]           -> Fix all series permissions
      -m [--movies]           -> Fix all movies permissions
      -c [--concerts]         -> Fix all concerts permissions
      -u [--stand-up]         -> Fix all stand-up permissions
      -s [--target]           -> Manually enter desired settings.
      Usage: bmm-media_permissions [-t] [--target] /dir/path user group
      -h [--help]             -> Shows this screen.

-     Media Share
      Easily share server media to other devices.
      Use with no arguements to enter the GUI.
      USAGE: bmm-media_share [-arg] [--arg]

      -a [--audio]                   -> Choose AUDIO to share
      -s [--series]                  -> Choose SERIES to share
      -m [--movies]                  -> Choose MOVIES to share
      -c [--concerts]                -> Choose CONCERTS to share
      -u [--stand-up]                -> Choose STAND-UP to share
      -h [--help]                    -> Shows this screen.

-     Setup Enviroment
      Create new .env file or update enviroment variables in .env file
      Usage: bmm-setup_enviroment [-arg] [--arg]

      -p [--path]      -> Adds software root to PATH
      -t [--template]  -> Creates new env file from template.
      -h [--help]      -> Shows this screen.
