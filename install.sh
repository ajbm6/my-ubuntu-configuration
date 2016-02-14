#!/bin/bash
#
# This script automatically install packages for a quick start.
#
# Usage:
#     $ sudo ./bulk-install.sh
#
if [[ $USER == "root" ]]; then
    "You should not run this as the root user, this configures local user files"
fi

# Temporary environment variables
export INSTALL_SCRIPT = true
export PROJECT_BIN_PATH = $PWD/bin # no trailing slash
export PROJECT_FILE_PATH = $PWD/files # no trailing slash
export PROJECT_TEMP_PATH = $PWD/tmp # no trailing slash

echo "===================================================================="
echo ""
echo "                        Ubuntu Configuration                        "
echo ""
echo " RECOMMENDED: Run 'ppa' first to prevent any problems"
echo ""
echo "  * To exit anytime CTRL+C"
echo "  * Select a package to install or type --all to install all"
echo ""
echo "===================================================================="
echo ""

while true; do
cat <<- command_list
     CMD     |      PROCESS
 ------------+---------------------------------------------------------------
    --all    |      Run all commands
 ------------+----------------------------------------------------------------
     dot     |      Copy dot files (.bashrc, .vimrc, .gitconfig, .gitignore  
    gnome    |      Install Gnome 3 GUI Tools (Toggle at login or see README)
     gui     |      Install Ubuntu GUI Tools (Compiz, Unity Tweak)
     jre     |      Install Java Runtime Environment (default)
     lamp    |      Install LAMP (Apache, PHP5, MySQL)
     node    |      Install NodeJS (nodejs, bower, gulp, grunt-cli)
     perm    |      Update /usr/local permissions
    phalcon  |      (Optional) Install PhalconPHP (Adds PPA)
     ppa     |      Install PPAs (nodejs, wine, git, numix icons)
     py      |      Install Python (python, python-dev, python-pip)
    redis    |      Install Redis (redis-server)
    util     |      Install Utilities (vim, git, curl, htop, unzip, terminator, tmux, screen)
      q      |      Quit (or CTRL+C)
command_list

echo ""
echo "===================================================================="
echo ""

read -p "Type a Command: " cmd

        case $cmd in
            --all)
                for entry in ./bin/*
                do
                    bash $entry
                done
                echo ""
                echo "===================================================================="
                echo ""
                ;;
            dot)
                bash ./bin/dot.sh
                echo ""
                echo "===================================================================="
                echo ""
                ;;
            gnome)
                bash ./bin/gnome.sh
                echo ""
                echo "===================================================================="
                echo ""
                ;;
            gui)
                bash ./bin/gui.sh
                echo ""
                echo "===================================================================="
                echo ""
                ;;
            jre)
                bash ./bin/jre.sh
                echo ""
                echo "===================================================================="
                echo ""
                ;;
            lamp)
                bash ./bin/lamp.sh
                echo ""
                echo "===================================================================="
                echo ""
                ;;
            node)
                bash ./bin/node.sh
                echo ""
                echo "===================================================================="
                echo ""
                ;;
            perm)
                bash ./bin/perm.sh
                echo ""
                echo "===================================================================="
                echo ""
                ;;
            ppa)
                bash ./bin/ppa.sh
                echo ""
                echo "===================================================================="
                echo ""
                ;;
            py)
                bash ./bin/py.sh
                echo ""
                echo "===================================================================="
                echo ""
                ;;
            rb)
                bash ./bin/rb.sh
                echo ""
                echo "===================================================================="
                echo ""
                ;;
            redis)
                bash ./bin/redis.sh
                echo ""
                echo "===================================================================="
                echo ""
                ;;
            util)
                bash ./bin/util.sh
                echo ""
                echo "===================================================================="
                echo ""
                ;;
            q)
                exit 1
                ;;
            *)
                echo ""
                echo "    ERROR: Invalid command!"
                echo ""
                echo "===================================================================="
                echo ""
        
        esac
        
done
