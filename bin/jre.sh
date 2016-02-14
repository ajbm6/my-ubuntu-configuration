#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "    ERROR: You must use the ./install.sh script"
    exit 1
fi

sudo apt-get install -y default-jre

echo "    SUCCESS: Complete: Java Runtime Environment is installed"
