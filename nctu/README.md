## demo of Google Cartographer on nctu dataset

This demo have been verified on 
* Environment 1
  * osrf/ros:kinetic-desktop-full-xenial docker image running on Ubuntu 16.04, with cartographer_ros installed
  * dataset 20180623-1_filtered_fixed.bag

### Demo
```
# online SLAM
roslaunch demo.launch bag_filename:=/20180623-1_filtered_fixed.bag

# offline SlAM
roslaunch offline_demo.launch bag_filename:=/20180623-1_filtered_fixed.bag
```

Tested with:
- cartographer git version `e1a839d6689615b15ed4dcd494b5d717fe95b00c`
- cartographer_ros git version `ed418405b5fea6cda98ac602e794511e4e64f0c9`
- ceres-solver git version `1.13.0`
