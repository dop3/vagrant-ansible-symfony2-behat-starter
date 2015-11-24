Dop3's Symfony2 Started for LAMP or LEMP stack!
========================

# What's inside
 
We use Vagrant + Ansible in order to create a VM (Virtualbox) provisioned with:
 
 * Ubuntu 14.04
 * Apache or Nginx (based on a parameter)
 * PHP (with FPM if needed)
 * Mysql
 
Then we install the latest symfony standard edition!

##### As a bonus we add:
 
###### Require
 
 * Doctrine Migrations dependency
 * Doctrine Extensions

###### Require dev
 
 * behat with mink extensions (browserkit)
 * behatch/contexts (really handy)
 

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
 * app_folder: THE_WEB_APP_FOLDER_NAME
 
### 2.4) ./ansible/provisioning/vars/mysql.yml
 * user: THE_DB_USER
 * password: THE_DB_PASSWORD
 * database: THE_DB_NAME
 * database_test: THE_TEST_DB_NAME
 
## 3) Sets everything up:

    vagrant up 
    # or vagrant provision if you want to re-run the provisioning
    
## Bonus) behat test

This repo comes with a smoke test (behat). If everything goes well you can
 access your VM, go to the web app folder and launch the behat tests:
 
    # cd /THE_FOLDER_TO_SYNC/THE_WEB_APP_FOLDER_NAME
    # ./bin/behat
 
You should see something like this:

    Feature: Smoke Test
      In order to access the home page
      As a visitor
      I need to be visit the home url
    
      Scenario: Visit the home page                 # features/00.smoke-test.feature:6
        Given I am on "/"                           # FeatureContext::visit()
        Then the response status code should be 200 # FeatureContext::assertResponseStatus()
    
    1 scenario (1 passed)
    2 steps (2 passed)
