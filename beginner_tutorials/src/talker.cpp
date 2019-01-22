//talker.cpp
#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sstream>
int main(int argc,char **argv)
{
    //名称talker必须唯五
    ros::init(argc,argv,"talker1");
    ros::NodeHandle n;
    ros::Publisher chatter_pub=n.advertise<std_msgs::String>("message1",1000);

    ros::Rate loop_rate(10); //loop_rate 发送数据频率10Hz
    int count=0;
    while(ros::ok())
    {
        std_msgs::String msg;
        std::stringstream ss;
        ss<< "helo world" <<count;
        msg.data=ss.str();

        ROS_INFO("%s",msg.data.c_str());

        chatter_pub.publish(msg);

        ros::spinOnce();

        loop_rate.sleep();
        ++count;
    }
    return 0;
}