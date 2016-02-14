#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "    ERROR: You must use the ./install.sh script"
    exit 1
fi

sudo apt-get install -y\
    mysql-server\
    php5\
    php5-dev\
    php5-curl\
    php5-mysql\
    php5-sqlite\
    php5-redis\
    php5-xmlrpc\
    php5-xdebug\
    php5-gd\
    php5-imagick\
    php5-intl\
    php5-mcrypt\
    libpcre3-dev\
    libsqlite3-dev\
    apache2\
    libapache2-mod-php5\
    libapache2-mod-wsgi
    
# copy project folder over
if [ ! -d "~/projects" ]; then
    cp -r $PROJECT_FILE_PATH/projects ~/projects
else
    echo "    ERROR: Skipping, ~/projects folder already exists"
fi

# create VHost for /home/users/projects folder
if [ ! -f /etc/apache2/sites-available/projects.conf ]; then

    echo "    SUCCESS: Creating projects VirtualHost"
    
    echo "ServerName projects
    <VirtualHost *:80>
        # Indexes + directory root
        DocumentRoot /home/$USER/projects
        
        # log files
        ErrorLog /home/$USER/projects/error.log
        CustomLog /home/$USER/projects/access.log combined
    </VirtualHost>
    
    <Directory /home/$USER/projects>
        Header set Access-Control-Allow-Origin '*'
        Options Indexes Followsymlinks
        AllowOverride All
        Require all granted
    </Directory>" > projects.conf
    
    sudo mv projects.conf /etc/apache2/sites-available
    sudo a2ensite projects
    
    # disable the default site
    sudo a2dissite 000-default
else
    echo "    ERROR: Skipping, ~/projects folder already exists"
fi

# See if we need composer (Duplicate in Phalcon for now)
if [ ! -f /usr/local/bin/composer ]; then
    curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer
else
    sudo composer self-update
fi

# Turn Error Reporting On
sudo sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php5/apache2/php.ini

# Turn Display Errors On
sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini

# Append X-Debug to it's INI
sudo echo "zend_extension=xdebug.so

xdebug.remote_enable=1
xdebug.remote_handler=dbgp
xdebug.remote_host=127.0.0.1
xdebug.remote_port=9000
xdebug.remote_log=\"/var/log/xdebug/xdebug.log\"
" > /etc/php5/mods-available/xdebug.ini

# Some Apache Finishing up
sudo a2enmod rewrite headers
sudo service apache2 restart

echo "    SUCCESS: LAMP Completed"
echo ""
echo "    SUCCESS: You can edit /etc/hosts and append 'projects', ex:"
echo "             127.0.0.1 localhost projects"
echo ""
echo "             And you will be able to access http://projects for your /home/$USER/projects folder"
echo ""
