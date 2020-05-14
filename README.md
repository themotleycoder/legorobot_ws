# legorobot
ROS eneabled Lego robot using Python 2

## Requirements:
* Python 2
  * PYNPUT library for keyboard control
* PIP
* ROS
* Lego EV3 computer and motors
* Wifi dongle (USB) for EV3
* 16GB SD Card
* IDE or Something to edit code in (I use [Visual Studio Code](https://code.visualstudio.com/) its free and available on most platforms!)
* Basic knowledge of linux command line

## Setup (Using an Ubuntu laptop as ROS publisher):

### ROS (Melodic)
* Follow instructions provided here: http://wiki.ros.org/melodic/Installation/Ubuntu
* I used the 'desktop full install' option as I wanted the additonal ROS tools installed


### EV3
* I used the [EV3DEV](https://www.ev3dev.org) operating system installed on a 16gb SD card to run ROS on the EV3
* Follow instructions provided here: https://www.ev3dev.org/docs/getting-started/
* Once you have the EV3 booted with EV3DEV running on it you can SSH to the device with:

    `ssh robot@IPADDRESS` ... the password is: maker

### Project
* Clone the code into your chosen directory if you haven't already:
    
    `git clone https://github.com/themotleycoder/legorobot_ws.git`

* then...

    `cd ~/legorobot_ws`

    `pip install pynput`

    `catkin_make install`

* Now we need to install the robot scripts on the EV3:
  
    `scp src/legorobot/robotscripts/* robot@IPADDRESS:` 
    
    Password is maker

## RPI
* apt-get install git

### Docker
Install the following prerequisites

    sudo apt-get install apt-transport-https ca-certificates software-properties-common -y

Download and install Docker

    curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh

Give the ‘pi’ user the ability to run Docker

    sudo usermod -aG docker pi

Import Docker GPG key

    sudo curl https://download.docker.com/linux/raspbian/gpg

Setup the Docker Repo

    nano vim /etc/apt/sources.list

Add the following line and save:

    deb https://download.docker.com/linux/raspbian/ stretch stable

Patch and update your PI

    sudo apt-get update
    sudo apt-get upgrade

Start the Docker service

    systemctl start docker.service

To verify that Docker is installed and running

    docker info

### Docker Run Specifics
    docker run --network host --name legorobot -e ROS_IP=[IP Address of Master] -e ROS_MASTER_URI=http://[IP Address of Master]:11311 -it legorobot

### Start ROS master

    roscore

## Useful Docker/ROS Commands:

To access the docker image with a new terminal:

    docker exec -it legorobot sh -c bash

To run `apt-get update` and install `nano` (for example) on a docker container that is running:

    docker exec -it legorobot sh -c "apt-get update && apt-get install nano"

To source the ROS environment after exec-ing into Docker:
  
    source /opt/ros/melodic/setup.bash

To run ROS commands in the new docker terminal:

    catkin_make install
    source devel/setup.bash

