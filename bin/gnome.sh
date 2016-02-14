#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the ./install.sh script."
    exit
fi

sudo apt-get install ubuntu-gnome-desktop

echo "    SUCCESS: Gnome Complete! (You need to reboot)"
echo "    SUCCESS: To re-configure your gdm/lightdm use: sudo dpkg-reconfigure gdm"
echo "    SUCCESS: For extensions use Firefox at: https://extensions.gnome.org"
