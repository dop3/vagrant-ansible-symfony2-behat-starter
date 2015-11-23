Dop3's Symfony2 Started for LAMP or LEMP stack!
========================

# Abstract
 
We use Vagrant + Ansible in order to create a VM (Virtualbox) provisioned with:
 * Ubuntu 14.04
 * Apache or Nginx (based on a parameter)
 * PHP (with FPM if needed)
 * Mysql
 
The latest symfony standard edition is installed too!

# Instructions 

## 1) Clone this repo

## 2) Edit some parameters

### 2.1) ./Vagrantfile
 * v.name="THE_PROJECT_NAME"
 * "--name"="THE_PROJECT_NAME"
 * hostname="THE_PROJECT_NAME"
 * config.vm.synced_folder -> THE_FOLDER_TO_SYNC
 
 * config.vm.network :private_network, ip: "THE_PROJECT_LOCAL_IP"
 * private_interface: "192.168.33.99" (ansible stuff)

### 2.2) ./ansible/playbook.yml
 * app_name: THE_PROJECT_NAME
 * servername: THE_PROJECT_LOCAL_DEV_URL THE_PROJECT_LOCAL_IP

### 2.3) ./ansible/provisioning/vars/common.yml
 * doc_root: THE_FOLDER_TO_SYNC
 
### 2.4) ./ansible/provisioning/vars/mysql.yml
 * user: THE_DB_USER
 * password: THE_DB_PASSWORD
 * database: THE_DB_NAME
 * database_test: THE_TEST_DB_NAME
 
## 3) Sets everything up:
vagrant up
cd /THE_FOLDER_TO_SYNC
composer install
