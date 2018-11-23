#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

set -eu

apt-get update
apt-get install -y sudo wget xcompmgr xvfb openbox recordmydesktop
sudo apt-get install -y python-wstool python-rosdep ninja-build

mkdir catkin_ws
cd catkin_ws
wstool init src

# Merge the cartographer_ros.rosinstall file and fetch code for dependencies.
wstool merge -t src https://raw.githubusercontent.com/googlecartographer/cartographer_ros/master/cartographer_ros.rosinstall
wstool set cartographer --git https://github.com/googlecartographer/cartographer.git -v master -t src -y
wstool set cartographer_ros --git https://github.com/googlecartographer/cartographer_ros.git -v master -t src -y
wstool update -t src

# Install deb dependencies.
# The command 'sudo rosdep init' will print an error if you have already
# executed it since installing ROS. This error can be ignored.
sudo rosdep init || true
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y

# Build and install.
catkin_make_isolated --install --use-ninja
source install_isolated/setup.bash

cd $DIR
# Download the 3D backpack example bag.

# run cartographer
./xvfb.py $DIR/record-cartographer.sh roslaunch $DIR/offline_demo.launch rviz_config:=$DIR/offline.rviz bag_filenames:=$DIR/kitti_2011_09_26_drive_0117_synced.bag
