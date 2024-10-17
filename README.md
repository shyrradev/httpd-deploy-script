# httpd-deploy-script
# HTTPD Deployment Script

This Bash script automates the installation and deployment of an **HTTPD** web server using an HTML template sourced from Tooplate. It handles everything from installing required packages to cleaning up temporary files, making it easy to set up a basic web server.

## Features

- Installs necessary packages (`httpd`, `wget`, `unzip`)
- Starts and enables the HTTPD service
- Downloads and deploys an HTML template
- Cleans up temporary files after deployment
- Displays the IP address of the web server

## Prerequisites

Before running the script, ensure you have:

- An Amazon Linux or CentOS instance.
- `sudo` privileges to install packages and manage services.
- Internet connectivity to download the HTML template.

## Usage

1. **Clone the Repository** (if applicable):
   ```bash
   git clone git@github.com:shyrradev/httpd-deploy-script.git
   cd httpd-deploy-script


This script will deploy the httpd web server and serve HTML content from a specified zip file, which can be sourced from tooplate.com or any other HTML-based application.
