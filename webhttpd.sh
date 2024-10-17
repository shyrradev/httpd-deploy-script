#!/bin/bash

# Function to check the status of the last command and exit if an error occurs
check_status() {
    if [ $? -ne 0 ]; then
        echo "########################################"
        echo "Error occurred, exiting the script."
        echo "########################################"
        exit 1
    fi
}

# Installing Dependencies
echo "########################################"
echo "Installing Packages (httpd, wget, unzip)"
echo "########################################"
sudo yum install httpd wget unzip -y > /dev/null 2>&1
check_status
echo "Packages installed successfully."
echo

# Start and Enable HTTPD
echo "########################################"
echo "Starting and Enabling HTTPD Service"
echo "########################################"
sudo systemctl start httpd
check_status
sudo systemctl enable httpd
check_status
echo "HTTPD service started and enabled successfully."
echo

# Creating Temporary Directory
echo "########################################"
echo "Creating temporary directory for web files"
echo "########################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles || exit
check_status
echo "Temporary directory created."
echo

# Downloading and Deploying the HTML Template
echo "########################################"
echo "Downloading the HTML template from Tooplate"
echo "########################################"
wget https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip > /dev/null 2>&1
check_status
echo "Template downloaded successfully."

echo "Unzipping the downloaded template"
unzip 2136_kool_form_pack.zip > /dev/null 2>&1
check_status
echo "Template unzipped successfully."

echo "Copying files to the web root directory (/var/www/html)"
sudo cp -r 2136_kool_form_pack/* /var/www/html
check_status
echo "Files copied successfully to /var/www/html."
echo

# Restarting HTTPD Service
echo "########################################"
echo "Restarting HTTPD Service"
echo "########################################"
sudo systemctl restart httpd
check_status
echo "HTTPD service restarted successfully."
echo

# Clean up Temporary Files
echo "########################################"
echo "Cleaning up temporary files"
echo "########################################"
rm -rf /tmp/webfiles
check_status
echo "Temporary files cleaned up."
echo

# Display IP Address of the Web Server
echo "########################################"
echo "Fetching IP address of the web server"
echo "########################################"
ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d/ -f1
check_status
echo "IP address displayed above."
echo

