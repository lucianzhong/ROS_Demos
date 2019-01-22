//listenner.cpp
 #include "ros/ros.h"
#include "std_msgs/String.h"
void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
    ROS_INFO("I heard:[%s]",msg->data.c_str());
}
int main(int argc,char **argv)
{
    //名称初始化时要求唯一
    ros::init(argc,argv,"listenner1");
    ros::NodeHandle n;

    //这里订阅的chatter必须与发布者一致
    ros::Subscriber sub=n.subscribe("message1",1000,chatterCallback);

    //spin()是节点读取数据的消息响应循环
    ros::spin();
    return 0;
}