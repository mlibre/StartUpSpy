#!/bin/bash

erase_line() {
	printf '\e[A\e[K'
}

# Function to print colored messages
print_message() {
	local message="$1"
	local emoji="☀️"
	local color_code=$((31 + RANDOM % 6))

	# Add some space before and after the message
	echo -e ""
	echo -e "\e[${color_code}m${emoji}  ${message}  ${emoji}\e[0m"
	echo -e ""
	interactive_mode
}

# Function to display information
show_info() {
	print_message "$1"
	cat "$1"
	echo
}

# Function to check and display if a directory exists
check_directory() {
	if [ -d "$1" ]; then
		print_message "$1"
		ls -1 "$1"
		echo
	fi
}

# Interactive mode function
interactive_mode() {
	if [ "$interactive" == "true" ]; then
		read -p "Press Enter to continue..."
		erase_line
	fi
}

# Function to check and display run level directories
check_runlevel_directories() {
	for dir in /etc/rc[0-9].d; do
		if [ -d "$dir" ]; then
			print_message "Run level directory: $dir"
			ls -1 "$dir"
			echo
		fi
	done
}

# Check if -i flag is passed for interactive mode
interactive="false"
if [ "$1" == "-i" ]; then
	interactive="true"
	shift
fi

# Check user-specific startup files
if [ -f ~/.profile ]; then
	show_info ~/.profile
fi

# Check system-wide startup files
if [ -f /etc/profile ]; then
	show_info /etc/profile
fi

if [ -f ~/.bash_profile ]; then
	show_info ~/.bash_profile
fi

if [ -f ~/.bashrc ]; then
	show_info ~/.bashrc
fi

if [ -f /etc/bash.bashrc ]; then
	show_info /etc/bash.bashrc
fi

# Check autostart directories
check_directory ~/.config/autostart
check_directory /etc/xdg/autostart

# Check X session-related files
check_directory /usr/share/xsessions

# Check X11 init files
if [ -f ~/.xinitrc ]; then
	show_info ~/.xinitrc
fi

if [ -f /etc/X11/xinit/xinitrc ]; then
	show_info /etc/X11/xinit/xinitrc
fi

check_directory /etc/X11/xinit/xinitrc.d

# Check X server configuration
if [ -f ~/.xserverrc ]; then
	show_info ~/.xserverrc
fi

# Check systemd services and timers
check_directory /lib/systemd/system
check_directory /etc/systemd/system

# Check enabled systemd services and timers
print_message "Enabled systemd services"
sudo systemctl list-unit-files --type=service --state=enabled --all --no-pager

print_message "Enabled user systemd services"
systemctl --user list-unit-files --type=service --state=enabled --all --no-pager

print_message "All systemd timers"
sudo systemctl list-unit-files --type=timer --all --no-pager

print_message "User systemd timers"
systemctl --user list-timers --all --no-pager

# Check D-Bus services
check_directory /usr/share/dbus-1/system-services

# Check init.d scripts
check_directory /etc/init.d

# Check runlevel directories
check_runlevel_directories

# Check cron jobs
print_message "User crontab"
crontab -l

print_message "Root crontab"
sudo crontab -l

print_message "/etc/cron.d"
ls -rla /etc/cron.*

# Check anacrontab
if [ -f /etc/anacrontab ]; then
	show_info /etc/anacrontab
fi

# Check PAM configuration
check_directory /etc/pam.d

# Check SDDM configuration
check_directory /usr/lib/sddm/sddm.conf.d/
check_directory /etc/sddm.conf.d/

# Check LXDE autostart configurations
if [ -f /etc/xdg/lxsession/LXDE/autostart ]; then
	show_info /etc/xdg/lxsession/LXDE/autostart
fi

check_directory ~/.config/lxsession/LXDE/autostart
