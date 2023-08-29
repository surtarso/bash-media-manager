            ┌─────────────────────────────────────────────────┐
            │▛▀▖      ▌   ▙▗▌     ▌▗     ▙▗▌                  │
            │▙▄▘▝▀▖▞▀▘▛▀▖ ▌▘▌▞▀▖▞▀▌▄ ▝▀▖ ▌▘▌▝▀▖▛▀▖▝▀▖▞▀▌▞▀▖▙▀▖│
            │▌ ▌▞▀▌▝▀▖▌ ▌ ▌ ▌▛▀ ▌ ▌▐ ▞▀▌ ▌ ▌▞▀▌▌ ▌▞▀▌▚▄▌▛▀ ▌  │
            │▀▀ ▝▀▘▀▀ ▘ ▘ ▘ ▘▝▀▘▝▀▘▀▘▝▀▘ ▘ ▘▝▀▘▘ ▘▝▀▘▗▄▘▝▀▘▘  │
            └─────────────────────────────────────────────────┘
      A companion 'Media Manager' in CLI inspired by the Dietpi Project.

## Short description
BMM is a collection of bash scripts designed to manage your 
media files effortlessly. It offers various tools to convert, 
backup, fix permissions, share, and set up the environment 
for your media server.

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

Included are tools for sharing media with friends without
having to deal with multiple names with spaces commands
and directory cleaner for use after massive library renaming.

## Included Tools
This project comes with a set of useful tools to enhance your media management experience:

- **Launcher** ([bmm-launcher](bmm-launcher)): Dialog GUI for all scripts.
- **MP3 Converter** ([bmm-converter_mp3](bmm-converter_mp3)): Converts any audio file to MP3 for streaming.
- **MP4 Converter** ([bmm-converter_mp4](bmm-converter_mp4)): Converts any video file to MP4 for streaming.
- **Dir Cleaner** ([bmm-dir_cleaner](bmm-dir_cleaner)): Removes empty audio folders.
- **Media Backup** ([bmm-media_backup](bmm-media_backup)): Backup media files.
- **Media Permissions** ([bmm-media_permissions](bmm-media_permissions)): Fix permissions on media files.
- **Media Share** ([bmm-media_share](bmm-media_share)): Easily copy specific media to another device.
- **Setup Environment** ([bmm-setup_enviroment](bmm-setup_enviroment)): Sets up media folders and owners. (Run this first)

## Dependencies
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

## Installation

Follow these steps to quickly set up the application. Run steps 1 and 2 for a basic setup.

**Step -1: Install deb-multimedia source packages**

Add the `deb-multimedia` source packages to your repository list (replace `dist_name` with your distribution name, e.g., bullseye):

```bash
echo 'deb https://www.deb-multimedia.org dist_name main non-free' | tee -a /etc/apt/sources.list
apt-get update -oAcquire::AllowInsecureRepositories=true
apt-get install deb-multimedia-keyring
apt update && apt upgrade -y
```

**Step 0: Pre-install Dependencies (Optional)**

Install the following dependencies if needed:

```bash
apt install ffmpeg libmp3lame0 rsync handbrake-cli dialog toilet -y
```

**Step 1: Clone the Repository**

Clone the repository into the `/home/user/bmm/` directory:

```bash
git clone https://github.com/surtarso/bash-media-manager.git ~/bmm
```

**Step 2: Generate .env File**

Run the following command to generate an `.env` file from the template:

```bash
cd ~/bmm && ./bmm-setup_enviroment
```

**Step 2a: Add B.M.M. to $PATH (Optional)**

To add B.M.M. to your `$PATH`, you can use the following command:

```bash
./bmm-setup_enviroment --path
```

With these steps completed, you should have the application set up and ready for use. Make sure to review and modify the `.env` file according to your preferences before using the application.

## Usage

Before using any script, ensure that the necessary folders are set up. You can refer to the `bmm-setup_enviroment` script or edit the `~/bmm/.env` file for configuration details.

### GUI Usage

For GUI-based usage, simply execute the scripts without any arguments. To navigate between different tools, you can use the `bmm-launcher` script.

### Command-Line Usage

If you prefer to use the command line and don't want to use the GUI (dialog), you can use the scripts with the `--help` argument. This will display the help text and guide you through the available options and usage instructions.

## Detailed view (--help)

- **MP3 Converter**
  Converts multiple formats to MP3 for streaming.
  - Use with no arguments to enter the GUI.
  - Usage: `bmm-mp3_converter [-arg] [--arg]`
  - Options:
    - `-n [--no-gui]`: No GUI interactive mode.
    - `-a [--auto]`: Use defaults. (asks no questions)
    - `-h [--help]`: This message screen.

- **MP4 Converter**
  Converts VIDEO files to "H.264 AAC-2.0 Web-Optimized .mp4" for streaming.
  - Use with no arguments to enter the GUI.
  - Usage: `bmm-converter_mp4 [-arg] [--arg] [args]`
  - Options:
    - `-hp [--handbrake-presets]`: List optimal HandBrake presets for streaming.
    - `-hb [--handbrake]`: Convert 'format' files from 'target folder' using "preset".
    - `-h [--help]`: Shows this screen.

- **Media Backup**
  Backup manager for server media.
  - Use with no arguments to enter the GUI.
  - Usage: `bmm-media_backup [-arg] [--arg]`
  - Options:
    - `-s [--series]`: Backup series library.
    - `-m [--movies]`: Backup movies library.
    - `-c [--concerts]`: Backup concerts library.
    - `-a [--audio]`: Backup audio library.
    - `-u [--stand-up]`: Backup stand-up library.
    - `-f [--full]`: Backup all libraries.
    - `-n [--no-gui]`: Interactive-mode without a GUI.
    - `-h [--help]`: Shows this screen.

- **Media Permissions**
  Fix file/folder permissions for media software.
  - Use with no arguments to enter the GUI.
  - WARNING: This is very slow on big libraries! Consider --target.
  - Usage: `bmm-media_permissions [-arg] [--arg]`
  - Options:
    - `-a [--audio]`: Fix all audio permissions.
    - `-s [--series]`: Fix all series permissions.
    - `-m [--movies]`: Fix all movies permissions.
    - `-c [--concerts]`: Fix all concerts permissions.
    - `-u [--stand-up]`: Fix all stand-up permissions.
    - `-t [--target]`: Manually enter desired settings. (recursive)
    - `-f [--full]`: Fix all media permissions. USE WITH CAUTION.
    - `-h [--help]`: Shows this screen.

- **Media Share**
  Easily share server media to other devices.
  - Use with no arguments to enter the GUI.
  - Usage: `bmm-media_share [-arg] [--arg]`
  - Options:
    - `-a [--audio]`: Choose AUDIO to share.
    - `-s [--series]`: Choose SERIES to share.
    - `-m [--movies]`: Choose MOVIES to share.
    - `-c [--concerts]`: Choose CONCERTS to share.
    - `-u [--stand-up]`: Choose STAND-UP to share.
    - `-h [--help]`: Shows this screen.

- **Setup Environment**
  Create new or update environment variables in .env file.
  - Use with no arguments to enter the GUI or edit ~/bmm/.env to configure your folders.
  - Usage: `bmm-setup_environment [-arg] [--arg]`
  - Options:
    - `-p [--path]`: Adds software root to PATH.
    - `-t [--template]`: Creates a new env file from the template.
    - `-h [--help]`: Shows this screen.

      -p [--path]      -> Adds software root to PATH.
      -t [--template]  -> Creates new env file from template.
      -h [--help]      -> Shows this screen.
