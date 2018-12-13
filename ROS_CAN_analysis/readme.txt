It contains the CAN ROS message that adapts to the one used in CANalyst-ii, 
and wrapped ROS node for further using. The ROS reads CAN frame from CAN bus and 
broadcast canalystii_node_msg/can msg with specific topic.


///////////////////////////////////////////////////////////
1. copy libcontrolcan.so to usr/lib 
2. copy folder into catkin_ws/src
3. catkin_make