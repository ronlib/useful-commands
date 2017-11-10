# Rescan audio devices
sudo alsactl nrestore

# Rescan partitions on a device
partprobe /dev/sdX

whereis ls

# NetworkManager control
nmcli


# Open terminal and run xrandr to find the names of your monitors and your available resolutions.
xrandr -q
# If you are following along and don’t get a screen full of display resolution information, you will need to install xrandr first. With Linux Mint, it’s pre-installed. You should see something like this.
# Screen 0: minimum 320 x 200, current 2048 x 768, maximum 4096 x 4096
# LVDS1 connected primary 1024x768+1024+0 (normal left inverted right x axis y axis) 309mm x 173mm
# 1366x768 60.1
# 1360x768 59.8 60.0
# 1024x768 60.0*+
# 800x600 60.3 56.2
# 640x480 59.9
# VGA1 connected 1024x768+0+0 (normal left inverted right x axis y axis) 0mm x 0mm
# 1024x768 60.0*+
# 800x600 60.3 56.2
# 848x480 60.0
# 640x480 59.9
# HDMI-1-0 disconnected (normal left inverted right x axis y axis)
# LVDS1 is my laptop’s screen. VGA1 is the VGA port. You can see that Mint has automatically chosen the highest common resolution between the two monitors, 1024x768.
# To add an undetected 1920 x 1080 (60Hz) resolution, I first used the cvt command to get the settings I needed.
cvt 1920 1080 60
# This command produced the following output.
#1920x1080 59.96 Hz (CVT 2.07M9) hsync: 67.16 kHz; pclk: 173.00 MHz
# Modeline "1920x1080_60.00" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
# Before I made the setting permanent, I thought I would try it on for size. Using the “Modeline” part of the cvt output, I crafted and executed an xrandr command to tell my computer that the new resolution is available for use.
xrandr --newmode "1920x1080" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
# Finally, I used this command to add this new resolution to the VGA port.
xrandr --addmode VGA1 "1920x1080"

# show motherboard and UEFI\BIOS info
sudo dmidecode -t 0 | less
sudo dmidecode -t 2 | less


iw dev wlan0 interface add wlan0_ap type managed addr 12:34:56:78:ab:ce
sudo ip link add name wifi_bridge type bridge
sudo ip link set enp1s0f1 master wifi_bridge
sudo ip address flush dev enp1s0f1 scope global
