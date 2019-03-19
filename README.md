i3buntu
============

This project is for setting up a minimal Ubuntu installation with the i3 window managing system together with other options that will make the operating system work and look well. The main goal of the project is to construct a flavour of the Ubuntu operating system which
* is minimal in the sense that it should not come with many preinstalled desktop applications like LibreOffice, Solitaire, Rhythmbox and other stuff considered to be bloat. This kind of software should be easily installable but should not come preinstalled.
* it should contain all the default repositories plus more to allow for easy installation of most of the typical applications people want access to
* it should come preinstalled with support for Bluetooth devices, WiFi and power management, graphics and network drivers, printers and media keys
* the notion of root should be the same as in regular Ubuntu, and one should get a CLI or visual prompt for a password whenever an attempt to make deep changes to the system is made


# Requirements
* A version of Xubuntu ( I choose xubuntu because it will give your more tools by default ) https://xubuntu.org/
* An internet connection.

# Default Ubuntu packages
The standard Ubuntu distribution comes preinstalled with a number of standard packages. This project tries to determine what packages allow for the desired Ubuntu setup to be made. As of this writing (July 15, 2016) the most recent version of Ubuntu is Ubuntu 16.04, and a complete list of all preinstalled packages is to be found in the following manifest file: http://releases.ubuntu.com/xenial/ubuntu-16.04-desktop-amd64.manifest.

# Installation

##### 1. Download and install Xubuntu

Go to the website and download latest version https://xubuntu.org/ then install it


##### 2. Download and prepare the i3buntu installation files

clone project 

##### 3. Install i3buntu

Now type the following in the terminal:
```
cd i3buntu
sudo chmod +x install.sh
sudo ./install.sh
```
