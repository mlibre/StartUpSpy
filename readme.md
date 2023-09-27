# StartupSpy 🚀

![Spy Icon](spy-icon.png)

`StartupSpy` is a handy Bash script that provides a comprehensive overview of startup and initialization files, services, and configurations on a Linux system. It's a valuable tool for both Linux administrators and enthusiasts who want to gain insights into what's happening under the hood during system startup.

## Features

- 📂 Checks user-specific and system-wide startup files
- 🤖 Examines autostart directories for user and system applications
- 🖥️ Investigates X session-related files and configurations
- 🧰 Inspects systemd services, timers, and user-specific systemd units
- 🚌 Monitors D-Bus services for added functionality
- ⚙️ Scans init.d scripts and runlevel directories
- ⏰ Reviews cron jobs for both users and the root
- 🔄 Checks anacrontab for periodic tasks
- 🔒 Investigates PAM (Pluggable Authentication Modules) configurations
- 💼 Explores SDDM (Simple Desktop Display Manager) configurations
- 🎨 Dives into LXDE (Lightweight X11 Desktop Environment) autostart configurations

## Usage

To run the Startup Spy script, simply execute it in your terminal. You can use the `-i` flag for interactive mode, which pauses after each section for user input.

```bash
./startupspy.sh
```

For interactive mode:

```bash
./startupspy.sh -i
```

**Note:** Some sections may require superuser privileges, so you may be prompted for your password during execution.

## Manual Configuration Edits

If you want to manually edit or view specific configuration files and directories mentioned in the `StartupSpy` script, you can use the following commands:

- nano .profile
- nano /etc/profile
- nano ~/.bash_profile
- nano .bashrc
- nano /etc/bash.bashrc
- ls /etc/profile.d/
- ls ~/.config/autostart
- ls /etc/xdg/autostart
- ls /usr/share/xsessions
- nano ~/.xinitrc
- nano /etc/X11/xinit/xinitrc
- ls /etc/X11/xinit/xinitrc.d/
- cat ~/.xserverrc
- ls -1 /lib/systemd/system/*.service /etc/systemd/system/*.service
- ls usr/share/dbus-1/system-services/
- sudo systemctl list-unit-files --type=service --state=enabled --all
- systemctl --user list-unit-files --type=service --state=enabled --all
- sudo systemctl list-unit-files --type=timer --all
- sudo systemctl list-timers --all
- systemctl --user list-timers --all
- ls /etc/init.d/
- ls /etc/rc*
- crontab -e
- sudo crontab -e
- ls -rla /etc/cron.*
- cat /etc/anacrontab
- ls /etc/pam.d/
- cat /usr/lib/sddm/sddm.conf.d/
- cat /etc/sddm.conf.d/
- cat /etc/xdg/lxsession/LXDE/autostart
- ls ~/.config/lxsession/LXDE/autostart

## License

This project is licensed under the CC0 License

## My ETH Address

Made with ❤️ by Mlibre

> 0xc9b64496986E7b6D4A68fDF69eF132A35e91838e
