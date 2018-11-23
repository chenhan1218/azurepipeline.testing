## demo of Google Cartographer on kitti dataset

This demo have been verified on 
* Environment 1
  * osrf/ros:kinetic-desktop-full-xenial docker image running on Ubuntu 16.04, with cartographer_ros installed
  * dataset 2011_09_26_drive_0117 (2.6 GB)
    * transfer to kitti_2011_09_26_drive_0117_synced.bag with kitti2bag

### Demo
```
# online SLAM
roslaunch demo.launch bag_filename:=/mnt/dataset/kitti/kitti_2011_09_26_drive_0117_synced.bag

# offline SlAM
roslaunch offline_demo.launch bag_filename:=/mnt/dataset/kitti/kitti_2011_09_26_drive_0117_synced.bag
```

Tested with:
- cartographer git version `e1a839d6689615b15ed4dcd494b5d717fe95b00c`
- cartographer_ros git version `ed418405b5fea6cda98ac602e794511e4e64f0c9`
- ceres-solver git version `1.13.0`
