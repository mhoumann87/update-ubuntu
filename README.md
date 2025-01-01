# Update

## Script to update and clean a Ubuntu system

Update is a command line tool made to make it easy to update an Ubuntu based Linux system.

Based on Joe Collins script [Up](https://github.com/EzeeLinux/up-debian_ubuntu_update_tool).

Update is written in bash, and is a simple shell script. Version 1.5 adds the options to shutdown or reboot after update. Update now includes update of snap packages.

If you don't use snap packages, you should choose the updatev1.sh file.

### Installation

Place the script in a bin folder in your home directory.
If you use the updatev1.sh file, rename the file name to update.sh.

```console
~/bin
```

Remember to change the rights for the script to add exercution for all

```console
$chmod +x update.sh
```

Then just run it for the command line

```console
$update [--option]
```

### Options

Without any options added

```console
$update
```

it will run the full apt upgrade and refresh your snap packages if you use these.

--remove

```console
$update --remove
```

will update your system and remove useless packages

--clean

```console
$update --clean
```

will update your system, remove useless packages and clear the local repository for files that no longer can be downloaded and are largely useless. This allows a cache to be maintained over a long periode of time without growing out of control.

--reboot

```console
$update --reboot
```

will update and clean your system and then reboot.

--shutdown

```console
$update --shutdown
```

will update and clean your system and then shutdown
