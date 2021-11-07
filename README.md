I3buntu - ( Ubuntu server + I3wm )
============

This is my fork of i3buntu. There are many like it, but this one is mine. In this project, you can install I3 over the Ubuntu server without installing anything that you don't need. My goals for this project:

- speed: I want to turn on my low-spec laptop and get to writing very quickly
- simplicity and minimalism: I'm building this for a writing machine. It should do little else.
- dotfile configs: for easy version control, portability, configations should be text files in their expected locations, whenever possible.
- dark theme: for writing at night, and to reduce eye strain, I'll pick darker colors for stuff.

> Still Under development: 
For using these types of projects, you should know Linux and bash enough to edit them based on your needs.

![screenshot](misc/screenshot.png)


# Requirements
* Ubuntu server 20.04
* An internet connection.

# Default Ubuntu packages
The standard Ubuntu distribution comes pre-installed with several standard packages. This project tries to determine what packages allow for the desired Ubuntu setup to be made.

# Installation

##### 1. Download and install Ubuntu Server

Go to the Ubuntu website and download ubuntu server 20.04 https://ubuntu.com/ then install it.


##### 2. Download and prepare the i3buntu installation files

clone project 

##### 3. Install i3buntu

Now type the following in the terminal:
```
cd i3buntu
sudo chmod +x run.sh
sudo ./run.sh
```

Add this to your crontab
```
$ crontab -e

*/5 * * * *     ~/bin/battery.sh

```

# Use dot files only
You should know that this project assumed you have all the dependecies (because when you run `run.sh` it will install everything) so you need to install this things yourself 

- i3
- urxvt 
- fish
- rofi 
- polybar


# Todo
- [ ] Secret folder to save ssh key, AWS key and so on
- [ ] Separate custom apps from the core
- [ ] Organize the core
- [ ] ... 
