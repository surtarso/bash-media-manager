# Bash Media Manager Documentation

**Welcome to the Bash Media Manager Documentation**

Bash Media Manager (BMM) is a collection of Bash scripts designed to simplify and streamline various media management tasks. Whether you're a content creator, a media enthusiast, or just someone who wants to keep their media files organized, BMM has you covered.

In the dynamic world of digital media, efficient management, and seamless sharing of audio, video, and other content are essential. Enter the Bash Media Manager, a versatile and user-friendly solution for Linux-based systems. This comprehensive documentation is your gateway to understanding and harnessing the full potential of the Bash Media Manager. Whether you're a media enthusiast, a system administrator, or simply someone looking to optimize their media management workflow, this guide will walk you through every aspect of the tool, from setting up your media directories to effortlessly sharing your favorite content. Join us on this journey as we explore the power and flexibility of the Bash Media Manager and simplify your media-related tasks on Linux.

## Table of Contents

- [How to Use BMM](#how-to-use-the-bash-media-manager)
  - [Launcher (bmm-launcher)](#launcher-bmm-launcher)
  - [MP3 Converter (bmm-converter_mp3)](#mp3-converter-script-bmm-converter_mp3)
  - [MP4 Converter (bmm-converter_mp4)](#mp4-converter-script-bmm-converter_mp4)
  - [Dir Cleaner (bmm-dir_cleaner)](#dir-cleaner-script-bmm-dir_cleaner)
  - [Media Backup (bmm-media_backup)](#media-backup-script-bmm-media_backup)
  - [Media Permissions (bmm-media_permissions)](#media-permissions-script-bmm-media_permissions)
  - [Media Share (bmm-media_share)](#media-share-script-bmm-media_share)
  - [Setup Environment (bmm-setup_enviroment)](#setup-enviroment-script-bmm-setup_enviroment)
  - [Environment File Template Explanation](#environment-file-template-explanation)
- [Conclusion](#conclusion)

# How to Use the Bash Media Manager

The Bash Media Manager (BMM) offers a range of functionalities to streamline your media management tasks on Linux-based systems. Whether you want to organize, backup, or share your media content, BMM has got you covered. In this section, we'll walk you through the key steps to effectively use BMM.

### 1. Setting Up Environment Variables

Before diving into BMM's features, it's crucial to configure your environment variables. These variables define the paths to your media directories, specify ownership details, and determine where backups are stored. To set up environment variables, use the `bmm-setup_environment` script. You can either manually edit the `.env` file located in the `~/bmm/` directory or use the script with the following command:

```bash
bmm-setup_environment
```

This script will guide you through the configuration process, ensuring your media directories are correctly defined.

### 2. Checking and Creating Media Directories

It's essential to confirm that the media directories specified in your environment variables exist. Use the `bmm-setup_environment` script with the `-c` or `--check` option to verify and create missing directories:

```bash
bmm-setup_environment -c
```

This command will prompt you to create any directories that are not found, ensuring that BMM can access and manage your media files.

### 3. Fixing Media Permissions

BMM simplifies the process of managing file and folder permissions for your media content. To adjust permissions for a specific media type, you can use the `bmm-media_permissions` script, followed by the appropriate argument. For example, to fix audio permissions:

```bash
bmm-media_permissions -a
```

This command will set the permissions for your audio content based on the environment variables you defined.

### 4. Sharing Media Content

BMM allows you to easily share your media with friends or create backups. To initiate media sharing, use the `bmm-media_share` script followed by the appropriate argument. For instance, to share your movie collection:

```bash
bmm-media_share -m
```

This command will guide you through the process of selecting the movies you want to share and specifying the destination.

### 5. Customizing Permissions and Sharing

For more advanced users, BMM provides options to customize permissions and sharing settings. Use the `-t` or `--target` option followed by the desired path, user, and group to manually configure permissions for specific directories:

```bash
bmm-media_permissions -t /path/to/directory your_user your_group
```

This approach gives you fine-grained control over permissions.

### 6. Accessing Help and Information

For detailed information on available commands and options, refer to the `bmm-media_permissions` and `bmm-media_share` scripts with the `-h` or `--help` option:

```bash
bmm-media_permissions -h
bmm-media_share -h
```

These commands will provide you with a helpful overview of each script's functionality.

Certainly! Here's a conclusion based on the "How to Use" section:

### Summary

The Bash Media Manager (BMM) is a powerful tool designed to simplify and enhance your media management tasks on Linux-based systems. With its user-friendly scripts and automation capabilities, BMM streamlines the process of organizing, sharing, and safeguarding your valuable media content.

By following the steps outlined in the "How to Use" section, you can effectively harness BMM's capabilities to:

- **Configure Environment Variables**: Set up your environment variables to define media directory paths, ownership details, and backup locations. The `bmm-setup_environment` script ensures that your settings are accurately defined.

- **Check and Create Media Directories**: Use the `bmm-setup_environment -c` command to confirm the existence of your media directories. BMM simplifies the creation of missing directories, ensuring seamless access to your media files.

- **Fix Media Permissions**: Customize file and folder permissions effortlessly with the `bmm-media_permissions` script. This tool allows you to fine-tune permissions for specific media types, ensuring optimal control.

- **Share Media Content**: Share your media collections with friends or create backups effortlessly using the `bmm-media_share` script. BMM guides you through the process of selecting content and specifying destinations.

- **Customize Permissions and Sharing**: For advanced users, BMM provides the flexibility to manually configure permissions and sharing settings. The `-t` or `--target` option empowers you to tailor permissions to your specific requirements.

- **Access Help and Information**: Detailed information on available commands and options is readily available. The `-h` or `--help` option in the `bmm-media_permissions` and `bmm-media_share` scripts provides comprehensive guidance whenever you need it.

The Bash Media Manager puts you in control of your digital media world. Whether you're managing an extensive music collection, curating a series library, or safeguarding your favorite movies, BMM simplifies the process, so you can focus on enjoying your media without the hassle of manual management. Embrace the power of BMM and elevate your media management experience on Linux. Whether you're an audiophile, cinephile, or just someone who loves organized media libraries, BMM empowers you to take control of your digital media world.

[Back to top](#table-of-contents)

# Launcher (bmm-launcher)

The **Launcher** is the main menu script for the Bash Media Manager (BMM). It serves as the central point for accessing and executing various BMM scripts that manage media center files. This script provides a user-friendly dialog-based menu interface for easy navigation and execution of different BMM functionalities.

## Script Overview

```bash
#!/bin/bash

# This is a launcher (main menu) for all scripts
# that manage the media center files.
# Tarso Galvao 05/04/23 Debian 11
```

- The script starts with a Bash shebang (`#!/bin/bash`) to indicate that it is a Bash script.
- The comments provide a brief description of the script's purpose and the author's name and the date of creation.

## Environment Variables

```bash
## load environment variables
if [ -f $HOME/bmm/.env ]; then
    . $HOME/bmm/.env
else
	echo 'BASH MEDIA MANAGER'
	echo 'No environment found! Entering setup...' && sleep 2;
    clear && eval $HOME/bmm/bmm-setup_enviroment;
    exit 0;
fi
```

- This section checks if an environment file (`.env`) exists in the `~/bmm` directory and sources it if it does.
- If the environment file doesn't exist, it displays a message indicating that the environment is missing and initiates the setup process by running `bmm-setup_enviroment`.

## Main Menu

```bash
## Main Menu
menu_opt=$(dialog --colors --no-cancel --no-lines\
    --title 'Script-Launcher Menu' \
    --backtitle "\Z7Bash Media Manager" \
    --stdout \
    --menu '								Up and down arrows change selection.\n											Use the Enter key to confirm.' \
    0 0 0 \
    'converter_mp3' 'Converts Audio files to MP3' \
    'converter_mp4' 'Converts Video files to MP4' \
    'dir_cleaner' 'Removes Empty Audio Folders' \
    'media_backup' 'Media Backup Manager' \
    'media_permissions' 'Fix Media Permissions' \
    'media_share' 'Easily Share Media' \
    'setup_enviroment' 'Setup Environment Variables' \
    'quit' 'Quit to shell');
```

- This section defines the main menu using the `dialog` utility. It presents a list of available BMM functionalities as menu options.
- Each menu option is defined with a label and a description.
- The `dialog` command is used to create an interactive menu interface.
  - `--colors`: Enables color support.
  - `--no-cancel`: Disables the cancel option.
  - `--no-lines`: Disables line wrapping.
  - `--title`: Sets the title for the menu.
  - `--backtitle`: Sets the backtitle (displayed at the top).
  - `--stdout`: Redirects the output to the variable `menu_opt`.
  - `0 0 0`: Determines the size of the dialog window.

## Menu Selection Handling

```bash
# Exit on Quit or Cancel || Execute chosen script.
if [ $menu_opt = 'quit' ] || [ $? -ne 1 ]; then
    clear && exit 0
else
    clear && eval bmm-$menu_opt
    exit 0;
fi
```

- This section handles the user's menu selection.
- If the user selects "Quit" or cancels the menu, the script exits cleanly.
- If the user selects a specific script option, it evaluates and runs the corresponding BMM script using the `eval` command.

## Technologies Used

- **Bash Scripting**: The script is written in Bash, a popular shell scripting language.
- **Dialog**: The `dialog` utility is used to create the interactive menu interface.
- **Debian 11**: The script mentions it was created on Debian 11, indicating the target environment.

## Best Practices

- **Shebang**: The script starts with a shebang (`#!/bin/bash`) to specify the interpreter.
- **Comments**: Clear comments are provided throughout the script to explain its purpose and usage.
- **Modularity**: The script is designed to be modular, allowing for easy addition of new functionality.
- **Error Handling**: The script handles errors gracefully and provides feedback to the user.
- **Environment Setup**: It checks for the existence of an environment file and initiates setup if missing, ensuring a smooth user experience.

[Back to top](#table-of-contents)

# MP3 Converter Script (bmm-converter_mp3)

The **MP3 Converter** script is part of the Bash Media Manager (BMM) project and is designed to convert various audio file formats to MP3. This script provides flexibility in choosing the input formats, MP3 quality, and whether or not to remove the original files after conversion.

## Script Overview

```bash
#!/bin/bash

## ffmpeg script to remove flac/wav/ogg/m4a/wma from music library.
## Converts to mp3 and removes original files if wanted.
## Point to the audio library root folder as shown below!
## AUDIOROOT='/your/library/music/' in .env file or use
## the interactive mode to enter custom settings
## Tarso Galvao 28/03/23 on Debian 11.

##TODO: -log stuff
```

- The script starts with a Bash shebang (`#!/bin/bash`) to indicate that it is a Bash script.
- The comments provide an overview of the script's purpose, its use of FFmpeg to convert audio files, and a reminder to set the audio library root folder in the `.env` file or through interactive mode.

## Environment Variables

```bash
## load environment variables
if [ -f $HOME/bmm/.env ]; then
    . $HOME/bmm/.env
else
    echo -e "FATAL ERROR: .env not found.$\n
    Use bmm-setup_enviroment to create one.\nAborting...";
    exit 1;
fi
```

- This section checks if an environment file (`.env`) exists in the `~/bmm` directory and sources it if it does. If the environment file doesn't exist, it displays an error message and exits.

## Default Settings

```bash
## AUTOMODE DEFAULT FLAGS (--auto)
REMOVE=1 # remove original files (0=no 1=yes)
FORMAT_ARRAY=("flac" "wav" "ogg" "m4a" "wma" "ape") # input format(s)
BITRATE='320k' # output mp3 bitrate in k
```

- These variables define the default settings for the MP3 conversion process:
  - `REMOVE`: A flag indicating whether original files should be removed after conversion (1 for yes, 0 for no).
  - `FORMAT_ARRAY`: An array of input audio formats to convert.
  - `BITRATE`: The default output MP3 bitrate in kbps.

## Folder and Path Handling

The script includes functions to handle folder and path operations, such as setting the audio library root folder and confirming its correctness.

## Audio Format Selection

```bash
## AUDIO FORMAT
## set input file format
set_input_format (){
    # ...
}
```

- This function allows the user to select the input audio formats to be converted.

## Output Format Selection

```bash
## set output mp3 file quality
set_output_format (){
    # ...
}
```

- This function enables the user to choose the quality of the output MP3 files.

## File Removal Settings

```bash
## FILES
## set removal flag
set_removal_flag (){
    # ...
}
```

- This function lets the user decide whether to remove the original files after conversion or move them to a designated "junk" folder.

## Conversion Process

```bash
## JOBS
## ffmpeg conversion
execute_tasks (){
    # ...
}
```

- The `execute_tasks` function is responsible for executing the MP3 conversion tasks using FFmpeg.
- It iterates through the selected input formats, converts the files, and optionally removes or moves the original files.

## Main Menu

```bash
main_menu () {
    # ...
}
```

- The `main_menu` function presents an interactive menu for users to configure their conversion preferences.
- Users can choose the audio library root folder, removal options, input formats, and MP3 quality.

## Script Execution

The script allows for multiple ways of execution, including auto-mode, no-GUI mode, and help mode, as indicated by command-line arguments.

## Technologies Used

- **Bash Scripting**: The script is written in Bash, a popular shell scripting language.
- **FFmpeg**: FFmpeg is used to handle audio format conversion.
- **Dialog**: The `dialog` utility is used to create interactive menus in the script.
- **Debian 11**: The script mentions it was created on Debian 11, indicating the target environment.

## Best Practices

- **Shebang**: The script starts with a shebang (`#!/bin/bash`) to specify the interpreter.
- **Comments**: Clear comments are provided throughout the script to explain its purpose and usage.
- **Modularity**: The script is designed in a modular fashion with functions for different tasks.
- **Error Handling**: The script handles errors gracefully and provides informative error messages.
- **User-Friendly**: The script offers an interactive menu for user configuration, making it user-friendly.

Please note that this script is part of the Bash Media Manager project and can be executed in various modes, depending on user preferences and requirements.

[Back to top](#table-of-contents)

# MP4 Converter Script (bmm-converter_mp4)

The **MP4 Converter** script is part of the Bash Media Manager (BMM) project and is designed to convert video files to the H.264 AAC-2.0 Web-Optimized .mp4 format for streaming. This script provides options for converting video files using either FFmpeg or Handbrake, and it can list optimal Handbrake presets for streaming.

## Script Overview

```bash
#!/bin/bash

## load environment variables
if [ -f $HOME/bmm/.env ]; then
    . $HOME/bmm/.env
else
    echo -e "FATAL ERROR: .env not found.$\n
    Use bmm-setup_enviroment to create one.\nAborting...";
    exit 1;
fi
```

- The script starts with a Bash shebang (`#!/bin/bash`) to indicate that it is a Bash script.
- The comments provide an overview of the script's purpose and mention the importance of the `.env` file for environment variables.

## Default Settings

```bash
HB_PRESETS=("Very Fast 1080p30" "Very Fast 720p30" "Very Fast 480p30")
FF_OPTIONS=()
FORMATS=("mp4" "avi" "mkv" "rm")
```

- These variables define default Handbrake presets, FFmpeg options (currently empty), and supported video formats.

## FFmpeg Conversion Function

```bash
convert_ffmpeg (){
    dep_check ffmpeg;
}
```

- The `convert_ffmpeg` function checks for the presence of FFmpeg. This function will likely be used for FFmpeg-based video conversion, although the actual conversion logic is a TODO item.

## Handbrake Conversion Function

```bash
convert_handbrake () {
    dep_check handbrake-cli;

    # ...
}
```

- The `convert_handbrake` function is responsible for converting video files using Handbrake.
- It iterates through video files in the specified media root folder, moves the original files to a designated "junk" folder, and converts them using the specified Handbrake preset.

## Argument Handling

The script allows for various command-line arguments to control its behavior:

- `-hb` or `--handbrake`: Initiates Handbrake-based video conversion with specified parameters.
- `-hp` or `--handbrake-presets`: Lists the available Handbrake presets for streaming.
- `-h` or `--help`: Displays help information.

## Help Information

```bash
elif [ "$1" == '-h' ] || [ "$1" == '--help' ]; then
    # ...
}
```

- This section displays help information explaining the usage of the script, available options, and examples.

## Technologies Used

- **Bash Scripting**: The script is written in Bash, a popular shell scripting language.
- **Handbrake-CLI**: Handbrake Command-Line Interface is used for video conversion.
- **FFmpeg**: The script mentions FFmpeg, indicating potential usage for video conversion (currently a TODO item).
- **Debian 11**: The script mentions it was created on Debian 11, indicating the target environment.

## Best Practices

- **Shebang**: The script starts with a shebang (`#!/bin/bash`) to specify the interpreter.
- **Comments**: Clear comments are provided throughout the script to explain its purpose and usage.
- **Modularity**: The script is designed in a modular fashion with functions for different tasks.
- **Error Handling**: The script handles errors gracefully and provides informative error messages.
- **User-Friendly**: The script offers a variety of options for users to control video conversion, making it versatile and user-friendly.

Please note that this script provides functionality for converting video files to the specified format, but the actual conversion logic may require further implementation for FFmpeg-based conversion, as mentioned in the script.

[Back to top](#table-of-contents)

# Dir Cleaner Script (bmm-dir_cleaner)

The **Dir Cleaner** script is a part of the Bash Media Manager (BMM) project and is designed to clean directories that do not contain any .mp3 files. It assumes a directory hierarchy that represents artists and their albums.

## Script Overview

```bash
#!/bin/bash

## TODO:
##       -add GUI/no-gui
##       -dynamic format to keep (currently only mp3)

## Load environment variables
if [ -f $HOME/bmm/.env ]; then
    . $HOME/bmm/.env
else
    echo -e "FATAL ERROR: .env not found.$\n
    Use bmm-setup_enviroment to create one.\nAborting...";
    exit 1;
fi
```

- The script starts with a Bash shebang (`#!/bin/bash`) to indicate that it is a Bash script.
- It includes comments specifying tasks that need to be done, such as adding GUI/no-GUI functionality and making the format to keep dynamic.

## User Interaction Function

```bash
cli_menu() {
    while true; do
        # ...
    done
}
```

- The `cli_menu` function provides a user-friendly menu for the script's operation.
- It allows the user to start the cleaning process, run the MP3 conversion script (`bmm-converter_mp3`) and then clean, or abort the script.

## Directory Cleaning Function

```bash
remove_dirs () {
    # ...
}
```

- The `remove_dirs` function is responsible for cleaning directories that do not contain .mp3 files.
- It iterates through the directories in the specified media root folder and deletes directories that do not contain .mp3 files.

## Argument Handling

The script accepts various command-line arguments to control its behavior:

- `-c` or `--convert`: Converts audio to MP3 using the `bmm-converter_mp3` script before cleaning.
- `-a` or `--auto`: Initiates the cleaning process directly without converting audio.
- `-h` or `--help`: Displays help information.

## Help Information

```bash
elif [ "$1" == '-h' ] || [ "$1" == '--help' ]; then
    # ...
}
```

- This section displays help information explaining the usage of the script, available options, and examples.

## Technologies Used

- **Bash Scripting**: The script is written in Bash, a popular shell scripting language.
- **bmm-converter_mp3**: The script uses the `bmm-converter_mp3` script to convert audio to MP3 before cleaning (if selected).
- **Debian 11**: The script mentions it was created on Debian 11, indicating the target environment.

## Best Practices

- **Shebang**: The script starts with a shebang (`#!/bin/bash`) to specify the interpreter.
- **Comments**: Clear comments are provided throughout the script to explain its purpose and usage.
- **User-Friendly**: The script offers a user-friendly menu to interact with the user.
- **Error Handling**: The script handles errors gracefully and provides informative error messages.
- **Modularity**: The script is designed in a modular fashion with functions for different tasks.

This script provides a convenient way to clean directories that do not contain .mp3 files and can also initiate audio conversion using the `bmm-converter_mp3` script if needed.

[Back to top](#table-of-contents)

# Media Backup Script (bmm-media_backup)

The **Media Backup** script is designed to backup media files from specified source directories to destination directories using `rsync`. This script is a part of the Bash Media Manager (BMM) project.

## Script Overview

```bash
#!/bin/bash

## rsync script to backup all 'goodies'
## requires source and destination folders
## set up in .env file. --help for more info.
## Tarso Galvao 03/04/23 Debian 11

# load environment variables
# ...
```

- The script starts with a Bash shebang (`#!/bin/bash`) to indicate that it is a Bash script.
- It includes comments explaining its purpose, requirements, and the creation date.

## Loading Environment Variables

```bash
# load environment variables
if [ -f $HOME/bmm/.env ]; then
    . $HOME/bmm/.env
else
    echo -e "FATAL ERROR: .env not found.$\n
    Use bmm-setup_enviroment to create one.\nAborting...";
    exit 1;
fi
```

- This section loads environment variables from a `.env` file located in the BMM project directory.
- If the `.env` file is not found, it displays an error message and exits.

## Backup Task Function

```bash
# backup task ($1-source $2-dest $3-echo name)
execute_backup (){
    local source_dir="$1"
    local dest_dir="$2"
    local backup_name="$3"
    # ...
}
```

- The `execute_backup` function is responsible for performing the actual backup task using `rsync`.
- It takes source and destination directories as arguments and an optional backup name for display purposes.

## No-GUI Interactive Menu

```bash
# --no-gui interactive mode menu 
nogui_menu (){
    echo -e 'Choose media to backup: (1-7)'
    select bkp in Series Movies Concerts Audio Stand-up ALL Quit
    do
        case $bkp in
            # ...
        esac
    done
}
```

- The `nogui_menu` function provides an interactive menu for selecting media categories to backup.
- It uses the `select` statement to present a list of options for backup.

## Dialog Interactive Menu

```bash
# dialog interactive mode menu (checklist)
main_menu () {
    # ...
}
```

- The `main_menu` function provides a menu using `dialog` with checkboxes to select media categories for backup.
- It allows users to select multiple categories for backup.

## Argument Handling

```bash
# check command arguments
case "$1" in
    # ...
esac
```

- The script accepts various command-line arguments to control its behavior.
- Arguments like `-s`, `-m`, `-c`, `-a`, `-u`, and `-f` are used to specify individual media categories for backup.
- The `-n` argument initiates an interactive mode without the GUI.
- The `-h` argument displays help information.

## Help Information

```bash
# Display help information
print_help() {
    # ...
}
```

- This section displays help information explaining the usage of the script, available options, and examples.

## Best Practices

- **Shebang**: The script starts with a shebang (`#!/bin/bash`) to specify the interpreter.
- **Comments**: Clear comments are provided throughout the script to explain its purpose and usage.
- **Environment Variable Handling**: The script loads environment variables from a `.env` file.
- **User-Friendly**: The script offers both no-GUI and dialog-based interactive menus for user interaction.
- **Error Handling**: The script checks for dependencies and folder existence and provides informative error messages.
- **Modularity**: The script is designed in a modular fashion with functions for different tasks.

This script provides a convenient way to back up media files from specified source directories to destination directories using `rsync`. Users can select individual media categories or back up all of them.

[Back to top](#table-of-contents)

# Media Permissions Script (bmm-media_permissions)

The **Media Permissions** script is designed to fix or modify permissions of media files and folders for compatibility with ARR (Automated Radio Recorder) software or through custom user-defined entries. This script is a part of the Bash Media Manager (BMM) project.

## Script Overview

```bash
#!/bin/bash

## Fix/modify permissions of media files to work
## with arr* software or use manual custom entries.
## Uses 2775 for folders and 664 for files as standard.
## Tarso Galvao 08/04/23 Debian 11 (Based on Snortt's script)

## load environment variables
# ...
```

- The script starts with a Bash shebang (`#!/bin/bash`) to indicate that it is a Bash script.
- It includes comments explaining its purpose, requirements, and the creation date.

## Loading Environment Variables

```bash
# load environment variables
if [ -f $HOME/bmm/.env ]; then
    . $HOME/bmm/.env
else
    echo -e "FATAL ERROR: .env not found.$\n
    Use bmm-setup_enviroment to create one.\nAborting...";
    exit 1;
fi
```

- This section loads environment variables from a `.env` file located in the BMM project directory.
- If the `.env` file is not found, it displays an error message and exits.

## Fix Permissions Function

```bash
## DO STUFF ($1-path $2-user $3-group)
fix_permissions () {
	if ! command -v $BANNER >> /dev/null; then echo -e "${WARN}BASH MEDIA MANAGER${NC}"; else eval "$BANNER"; fi
	echo -e "${HEAD}Media Permissions${NC}"
	for _dir in $1
	do
		echo '----------------------------------------------------------'
		echo -e "Processing path: $1..."
		sudo chown -R $2:$3 ${_dir} && echo -e "${WARN}Ownership: ${HEAD}$2:$3 ${OK}OK${NC}"
		echo 'Processing folders...'
		sudo find ${_dir} -type d -exec chmod 2775 {} \; && echo -e "${WARN}Folders: ${OK}OK${NC}"
		echo 'Processing files...'
		sudo find ${_dir} -type f -exec chmod 664 {} \; && echo -e "${WARN}Files: ${OK}OK${NC}"
	done
}
```

- The `fix_permissions` function is responsible for fixing or modifying permissions of media files and folders.
- It takes the following arguments:
  - `$1`: Path to the directory or directories to process.
  - `$2`: User name or ID for setting ownership.
  - `$3`: Group name or ID for setting group ownership.
- It uses `sudo` to change ownership and permissions of files and folders recursively.
- It provides feedback on the ownership, folder, and file permissions changes.

## Custom User Entry

```bash
## user input entries (Custom)
custom_entry () {
	## get path
	# ...
	## get user
	# ...
	## get group
	# ...
	## execute with user input args
	fix_permissions "$path" "$user" "$group"
}
```

- The `custom_entry` function allows users to manually enter the path, user, and group for fixing permissions.
- It uses `dialog` to prompt users for input and then calls the `fix_permissions` function with the provided arguments.

## Dialog-Based Interactive Menu

```bash
# main_menu () {
	# ...
# }
```

- The `main_menu` function provides an interactive menu using `dialog` with checkboxes for selecting media categories and running permission fixes.
- It also includes an option for custom user-defined entries.
- After permission fixes are complete, it provides a message and waits for user input to continue or exit.

## Argument Handling

```bash
# STATUP OPTIONS
# ...
```

- The script accepts various command-line arguments to control its behavior.
- Arguments like `-a`, `-s`, `-m`, `-c`, `-u`, and `-f` are used to fix permissions for specific media categories.
- The `-t` argument allows users to manually enter the desired settings.
- The `-h` argument displays help information.

## Help Information

```bash
# Display help information
print_help() {
    # ...
}
```

- This section displays help information explaining the usage of the script, available options, and examples.

## Best Practices

- **Shebang**: The script starts with a shebang (`#!/bin/bash`) to specify the interpreter.
- **Comments**: Clear comments are provided throughout the script to explain its purpose and usage.
- **Environment Variable Handling**: The script loads environment variables from a `.env` file.
- **User-Friendly**: The script offers both interactive menus and command-line options for fixing permissions.
- **Error Handling**: The script checks for dependencies and folder existence and provides informative error messages.
- **Modularity**: The script is designed in a modular fashion with functions for different tasks.

This script provides a convenient way to fix or modify permissions of media files and folders for compatibility with ARR software or custom user-defined settings. Users can select specific media categories for permission fixes or enter custom paths and ownership information.

[Back to top](#table-of-contents)

# Media Share Script (bmm-media_share)

The **Media Share** script is designed to provide an interactive way to select media folders for sharing or backup purposes. Users can create a checklist of folders to copy to another location, such as a remote server or external drive. This script is a part of the Bash Media Manager (BMM) project.

## Script Overview

```bash
#!/bin/bash

## A better way to choose media to share with friends or backup
## checklist select of folders to copy to another set location
## Tarso Galvao 06/04/23 Debian 11
```

- The script starts with a Bash shebang (`#!/bin/bash`) to indicate that it is a Bash script.
- It includes comments explaining its purpose, requirements, and the creation date.

## Loading Environment Variables

```bash
# load environment variables
if [ -f $HOME/bmm/.env ]; then
    . $HOME/bmm/.env
else
    echo -e "FATAL ERROR: .env not found.$\n
    Use bmm-setup_enviroment to create one.\nAborting...";
    exit 1;
fi
```

- This section loads environment variables from a `.env` file located in the BMM project directory.
- If the `.env` file is not found, it displays an error message and exits.

## Copy Media Function

```bash
copy_media (){
	if ! command -v $BANNER >> /dev/null; then echo -e "${WARN}BASH MEDIA MANAGER${NC}"; else eval $BANNER; fi
	echo -e "${HEAD}Media Share${NC}"
	echo '----------------------------------------------------------'
	dep_check rsync; ## TODO: check for rsync (dest should have rsync too... how to confirm?)
	echo -e "${WARN}Now running: ${OK}rsync -avzP ${WARN}$source ${OK}$dest${NC}"
	echo '----------------------------------------------------------'
	echo -e "\n${ERROR}Press ${WARN}'Control + C'${ERROR} to abort.${NC}"
	for (( i=3; i>0; i--)); do sleep 1 & printf "            $i \r"; wait; done
	## start syncing
	eval $(echo -e "rsync -avzP $source $dest") | dialog --colors --no-lines --backtitle "\Z7Bash Media Manager" --progressbox 42 76;
	dialog --colors --no-lines \
        --backtitle "\Z7Bash Media Manager" \
        --infobox "Task complete." 3 19
    read
}
```

- The `copy_media` function is responsible for copying the selected media folders to the specified destination using the `rsync` command.
- It checks for the availability of `rsync` and displays the source and destination paths.
- Users are informed about the progress and given the option to abort the operation by pressing `Ctrl + C`.

## Get Selections Function

```bash
get_selections () {
	# ...
}
```

- The `get_selections` function reads the list of selected folders and constructs a string with the chosen source paths.
- It takes the following arguments:
  - `$1`: Path to the file containing the list of folders.
  - `$2`: Line number of the chosen folder.
  - `$3`: Root folder path.
- It returns a formatted string with the selected source paths.

## Create Checklist Function

```bash
create_checklist () {
	# ...
}
```

- The `create_checklist` function creates a checklist of media folders and allows users to select the folders they want to share.
- It takes the root folder path as an argument and creates a file listing the folder names.
- The `dialog` utility is used to display a checklist with folder options.
- User selections are processed to construct the source path for copying.

## Dialog-Based Interactive Menu

```bash
# main_menu () {
	# ...
# }
```

- The `main_menu` function provides an interactive menu using `dialog` to select the media source (e.g., Audio, Series, Movies, Concerts, Stand-up).
- After selecting the source, it calls the `create_checklist` function to create a checklist of folders within the selected media category.

## Argument Handling

```bash
# STARTUP OPTIONS
# ...
```

- The script accepts various command-line arguments to control its behavior.
- Arguments like `-a`, `-s`, `-m`, `-c`, and `-u` allow users to directly choose a media category for sharing.
- The `-h` argument displays help information.

## Help Information

```bash
# Display help information
print_help() {
    # ...
}
```

- This section displays help information explaining the usage of the script, available options, and examples.

## Best Practices

- **Shebang**: The script starts with a shebang (`#!/bin/bash`) to specify the interpreter.
- **Comments**: Clear comments are provided throughout the script to explain its purpose and usage.
- **Environment Variable Handling**: The script loads environment variables from a `.env` file.
- **User-Friendly**: The script offers both interactive menus and command-line options for sharing media.
- **Error Handling**: The script checks for dependencies and folder existence and provides informative error messages.
- **Modularity**: The script is designed in a modular fashion with functions for different tasks.

This script provides a user-friendly way to select and share specific media folders with other devices or backup locations. Users can choose media categories and individual folders for sharing, making it a convenient tool for managing media libraries.

[Back to top](#table-of-contents)

# Setup Environment Script (bmm-setup_environment)

The **Setup Environment** script is designed to create or update environment variables in the `.env` file for the Bash Media Manager (BMM) project. It provides both a graphical user interface (GUI) for setting up variables and command-line options for specific tasks.

## Script Overview

```bash
#!/bin/bash

## create new .env file or update(change) environment variables in .env file
```

- The script starts with a Bash shebang (`#!/bin/bash`) to indicate that it is a Bash script.
- It includes comments explaining its purpose, requirements, and the creation date.

## Logging and File Paths

```bash
# Create or truncate the log file
LOG_FILE="setup_environment.log"
> "$LOG_FILE"

ENV_FILE="$HOME/bmm/.env"            # Work environment
TEMPLATE="$HOME/bmm/.template_env"   # Fixed template
```

- The script creates or truncates a log file (`setup_environment.log`) to log any important events.
- It defines file paths for the `.env` file (used to store environment variables) and a template file.

## Environment File Handling

```bash
## edit or create a new environment file
if [ -f $ENV_FILE ]; then . $ENV_FILE;
else cp $TEMPLATE $ENV_FILE && . $ENV_FILE || { 
    echo -e "FATAL ERROR: Could not create an environment file.\nAborted."; exit 1;};
fi
```

- This section checks if the `.env` file exists. If it does, it loads the environment variables. If not, it creates a new `.env` file from a template and loads its content.

## Form Fields and Keys

```bash
# Keys must maintain the same order as main_form() fields.
keys=(AUDIOROOT AUDIOBACKUP AUDIOJUNK VIDEOSJUNK SERIESROOT SERIESBACKUP \
        MOVIESROOT MOVIESBACKUP CONCERTSROOT CONCERTSBACKUP STANDUPROOT \
        STANDUPBACKUP AUDIO_OWNER SERIES_OWNER MOVIES_OWNER CONCERTS_OWNER \
        STANDUP_OWNER GROUP)
```

- This array `keys` defines the keys corresponding to the environment variables. The order must match the order of fields in the `main_form()` function.

## Main Form Function

```bash
main_form () {
    # ...
}
```

- The `main_form` function displays a graphical form using `dialog` for setting up environment variables.
- Users can fill in the fields with the desired values for various media-related paths and ownership details.

## Argument Handling

```bash
## ARGUMENTS
if [ "$1" = '-t' ] || [ "$1" = '--template' ]; then
    # ...
elif [ "$1" = '-p' ] || [ "$1" = '--path' ]; then
    # ...
elif [ "$1" = '-c' ] || [ "$1" = '--check' ]; then
    # ...
elif [ "$1" = '-h' ] || [ "$1" = '--help' ]; then
    # ...
else
    main_form;
fi
```

- The script accepts various command-line arguments to control its behavior.
- `-t` or `--template` creates a new `.env` file from a template.
- `-p` or `--path` adds the software root to the `PATH` environment variable.
- `-c` or `--check` checks if media folders exist or creates them.
- `-h` or `--help` displays help information.
- If no arguments are provided, the script invokes the `main_form()` function to display the GUI for setting up environment variables.

## Help Information

```bash
# Display help information
print_help() {
    # ...
}
```

- This section displays help information explaining the usage of the script, available options, and examples.

## Best Practices

- **Shebang**: The script starts with a shebang (`#!/bin/bash`) to specify the interpreter.
- **Comments**: Clear comments are provided throughout the script to explain its purpose and usage.
- **Logging**: The script logs important events to a log file (`setup_environment.log`).
- **Error Handling**: The script checks for the existence of the `.env` file and provides informative error messages if necessary.
- **Modularity**: The script is designed in a modular fashion with functions for different tasks.
- **User-Friendly**: The script offers a GUI for setting up environment variables, making it easy for users to configure the environment for the BMM project.

This script simplifies the process of setting up and configuring the environment for the BMM project by allowing users to define important paths and ownership details through a graphical interface. Additionally, it provides command-line options for specific tasks like adding the software root to the `PATH` and checking for the existence of media folders.

[Back to top](#table-of-contents)

# Environment File Template Explanation

The provided environment file template is a crucial configuration file for the Bash Media Manager (BMM) project. It defines environment variables that specify various paths and ownership details required for the project to function correctly. Below is an explanation of the template's contents:

```bash
## ---------------------- FOLDERS SETUP
## PLEASE READ: * Locations MUST END with '/'
##              * Locations MUST BE FULL path '/root/of/files/'
##              * rsync will send CONTENTS of source to ROOT of dest.
##                  ( ex: /my/use/files/* --> /my/bkp/files/ )
##              * Locations MUST EXIST prior to running scripts
```

- These initial comments provide important instructions for configuring the environment variables:
  - Paths must end with a '/' character.
  - Paths must be full paths (starting from the root directory).
  - The `rsync` command will send the contents of the source directory to the root of the destination directory.
  - All specified locations must exist before running scripts.

## Audio Subsection

```bash
## audio subsection
AUDIOROOT="/mnt/vault/music/"
AUDIOBACKUP="/mnt/vault/music_bkp/"
AUDIOJUNK="/mnt/vault/music/.converted_audio/"
```

- This section defines environment variables related to audio files and directories:
  - `AUDIOROOT`: The root folder for audio files.
  - `AUDIOBACKUP`: The backup folder for audio files.
  - `AUDIOJUNK`: A subfolder within the audio root for converted audio files.

## All Videos Subsection

```bash
## all videos subsection
VIDEOSJUNK="/mnt/vault/videos/.converted_videos/"
```

- This subsection defines an environment variable related to all video files:
  - `VIDEOSJUNK`: A subfolder within the video vault for converted video files.

## Series Subsection

```bash
## series subsection
SERIESROOT="/mnt/vault/videos/series/"
SERIESBACKUP="/mnt/vault/videos_bkp/series/"
```

- This section defines environment variables related to TV series:
  - `SERIESROOT`: The root folder for TV series.
  - `SERIESBACKUP`: The backup folder for TV series.

## Movies Subsection

```bash
## movies subsection
MOVIESROOT="/mnt/vault/videos/movies/"
MOVIESBACKUP="/mnt/vault/videos_bkp/movies/"
```

- This section defines environment variables related to movies:
  - `MOVIESROOT`: The root folder for movies.
  - `MOVIESBACKUP`: The backup folder for movies.

## Concerts Subsection

```bash
## concerts subsection
CONCERTSROOT="/mnt/vault/videos/shows/"
CONCERTSBACKUP="/mnt/vault/videos_bkp/shows/"
```

- This section defines environment variables related to concerts or shows:
  - `CONCERTSROOT`: The root folder for concerts or shows.
  - `CONCERTSBACKUP`: The backup folder for concerts or shows.

## Stand-Up Subsection

```bash
## stand-up subsection
STANDUPROOT="/mnt/vault/videos/standup/"
STANDUPBACKUP="/mnt/vault/videos_bkp/standup/"
```

- This section defines environment variables related to stand-up comedy:
  - `STANDUPROOT`: The root folder for stand-up comedy.
  - `STANDUPBACKUP`: The backup folder for stand-up comedy.

## Permissions

```bash
## permissions
AUDIO_OWNER="lidarr"
SERIES_OWNER="sonarr"
MOVIES_OWNER="radarr"
CONCERTS_OWNER="radarr"
STANDUP_OWNER="radarr"
GROUP="goodies"
```

- This section defines ownership and group details for the various media types and folders:
  - `AUDIO_OWNER`: The owner user for audio-related folders.
  - `SERIES_OWNER`: The owner user for TV series-related folders.
  - `MOVIES_OWNER`: The owner user for movie-related folders.
  - `CONCERTS_OWNER`: The owner user for concerts or shows-related folders.
  - `STANDUP_OWNER`: The owner user for stand-up comedy-related folders.
  - `GROUP`: The group that owns the media folders.

## Script Settings (Auto)

```bash
## ------------------------ SCRIPT SETTINGS (auto)
## bash colors
HEAD='\033[34;1m'   #blue
OK='\033[0;32m'     #green
WARN='\033[1;33m'   #yellow
ERROR='\033[0;31m'  #red
NC='\033[0m'        #no color
BANNER=$(echo -e "toilet -t -F border -F metal -f smblock Bash Media Manager")
```

- This section defines various script settings and colors used in the script:
  - `HEAD`, `OK`, `WARN`, `ERROR`, `NC`: Variables containing ANSI escape codes for different text colors.
  - `BANNER`: A command that can be used to generate a stylized banner for the project.

## Functions

```bash
## ------------------------- FUNCTIONS
# Check if a package is installed and offer to install it if not.
# Usage: dep_check <package_name>
# ...

# Check if a directory exists, and optionally create it after user confirmation.
# Usage: dir_check <directory_path>
# ...
```

- This section provides comments explaining two functions used in the script:
  - `dep_check`: A function to check if a package is installed and offer to install it if not.
  - `dir_check`: A function to check if a directory exists and optionally create it after user confirmation.

Let's detail the two functions, `dep_check` and `dir_check`, from the provided environment file template:

### `dep_check` Function:

```bash
# Check if a package is installed and offer to install it if not.
# Usage: dep_check <package_name>
dep_check() {
    local package_name="$1"

    if dpkg -l | grep -q -E "^ii[[:space:]]+$package_name"; then
        echo -e "$package_name: ${OK}Found${NC}"
    else
        echo -e "${ERROR}$package_name not found!${NC} Install package(s)? (Y/n) \c"
        read -r yesno < /dev/tty
        if [[ "$yesno" =~ ^[Yy]$ ]]; then
            if [ "$(id -u)" -ne 0 ]; then
                echo -e "${ERROR}You need sudo privileges to install packages.${NC}"
                echo -e "Manually install with 'sudo apt-get install $package_name'"
                return 1
            fi
            sudo apt-get update
            sudo apt-get install "$package_name" -y
        else
            echo -e "${WARN}Cannot continue without $package_name package!"
            echo -e "Manually install with 'sudo apt-get install $package_name'"
            echo -e "Aborting...${NC}"
            return 1
        fi
    fi
}
```

- `dep_check` is a function used to check if a specified package is installed on the system and offers to install it if it's not found.

- Parameters:
  - `<package_name>`: The name of the package to check for.

- How it works:
  - It first checks if the package is installed by using the `dpkg` command and filtering the output with `grep`.
  - If the package is found, it displays a message indicating that the package is found.
  - If the package is not found, it prompts the user to confirm the installation.
  - If the user agrees to install the package, it checks if the script has root (sudo) privileges. If not, it informs the user that they need sudo privileges to install packages.
  - It then updates the package list and installs the specified package using `sudo apt-get install` if the user agrees.
  - If the user declines to install the package, it displays an error message and aborts.

### `dir_check` Function:

```bash
# Check if a directory exists, and optionally create it after user confirmation.
# Usage: dir_check <directory_path>
dir_check() {
    local dir_path="$1"

    if [[ -d "$dir_path" ]]; then
        echo -e "${WARN}$dir_path: ${OK}Found${NC}" && return 0
    else
        echo -e "${WARN}$dir_path: ${ERROR}NOT FOUND${NC}"
        read -p "Do you want to create $dir_path? (y/n): " create_dir
        if [[ "$create_dir" =~ ^[Yy]$ ]]; then
            mkdir -p "$dir_path" && echo -e "${WARN}$dir_path: ${OK}NOW CREATED${NC}" || {
                echo -e "${ERROR}Could not create ${WARN}$dir_path${NC}, please check permissions or create them manually."
                return 1
            }
        else
            echo "Operation canceled."
            return 2
        fi
    fi
}
```

- `dir_check` is a function used to check if a specified directory exists and optionally creates it after user confirmation.

- Parameters:
  - `<directory_path>`: The path of the directory to check for and potentially create.

- How it works:
  - It first checks if the directory exists using the `-d` flag with the `[[` conditional in Bash.
  - If the directory exists, it displays a message indicating that the directory is found and returns `0` to indicate success.
  - If the directory does not exist, it displays a message indicating that the directory is not found and prompts the user to confirm whether they want to create the directory.
  - If the user agrees to create the directory, it uses the `mkdir -p` command to create the directory and displays a message indicating that the directory is now created.
  - If the directory cannot be created (likely due to permission issues), it displays an error message and returns `1` to indicate failure.
  - If the user declines to create the directory, it displays a message indicating that the operation is canceled and returns `2` to indicate cancellation.

These two functions, `dep_check` and `dir_check`, are used within the environment setup script to ensure that required packages are installed and that necessary directories are present before the Bash Media Manager scripts are executed.

The environment file template serves as a crucial configuration guide for the Bash Media Manager project. It allows users to define essential paths and ownership details required for media management scripts to work correctly. This template should be customized to match the actual file system structure and ownership on the user's system.

[Back to top](#table-of-contents)

# Conclusion

In conclusion, the Bash Media Manager is a versatile and user-friendly tool designed to simplify media management and sharing tasks on Linux systems. This documentation has provided a comprehensive overview of its features, including directory structure, setup environment, and various media sharing functionalities. By following the instructions outlined in this documentation, users can efficiently configure their media directories, ensure essential packages are installed, and seamlessly share media content across devices. Whether you're managing music, videos, or other media types, the Bash Media Manager empowers users to streamline their media-related tasks and enhance their overall media management experience on Linux systems. We hope this documentation has been informative and helpful in getting you started with this powerful media management tool.

[Back to top](#table-of-contents)
