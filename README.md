# ROS_Node

cd catkin_ws/src
git clone git@github.com:libing64/pose_ekf.git
cd ..
catkin_make -DCATKIN_WHITELIST_PACKAGES="pose_ekf"
roslaunch pose_ekf pose_ekf.launch
