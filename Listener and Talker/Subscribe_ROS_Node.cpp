/*
一、首先建一个包
我的工作空间catkin_ws事先建好了，路径是/home/siat/catkin_ws 
然后运行以下命令在src文件夹下建立test包

$ cd ~/catkin_ws/src
$ catkin_create_pkg test roscpp

注意在包的名字后加上一些基本的依赖，比如roscpp和rospy这样就可以直接调用C++和python节点了，这将会在CMakeLists.txt中出现

find_package(catkin REQUIRED COMPONENTS roscpp)

三、编写CMakeLists.txt文件
这里仅仅在自动生成的CMakeLists.txt文件后面加了以下两句话，并没有额外添加什么依赖

add_executable(test1 src/test1.cpp)
target_link_libraries(test1 ${catkin_LIBRARIES})
1
2
上面第一句是生成可执行文件的，注意第二句不要漏掉，否则会报错说是里面的init,chatterCallback等函数未定义

四、编译
$ cd ~/catkin_ws
$ catkin_make --pkg test
1
2
执行编译完成后运行该节点就行了

$ rosrun test test1














*/




#include "ros/ros.h"
#include "std_msgs/String.h"
#include "turtlesim/Pose.h" 
//#include <sstream> 



void chatterCallback_pose(const turtlesim::PoseConstPtr& msg)
{ float x, y, theta; x=msg->x; y=msg->y; theta=msg->theta;
 ROS_INFO("I heard pose x:[%f] y:[%f] z:[%f]",x, y, theta); } 

int main(int argc, char **argv) 
{ ros::init(argc, argv, "test1"); 
 ros::NodeHandle n;
 ros::Subscriber sub = n.subscribe("turtle1/pose",1000,chatterCallback_pose); 
 //std::cout<<" for test1"<<std::endl; 
 ros::spin(); 
 return 0; }
