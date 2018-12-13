#include "ros/ros.h"
#include "canalystii_node.h"
#include "canalystii_node_msg/can.h"
#include <geometry_msgs/Twist.h>
#include <std_msgs/Float32.h>
#include <geometry_msgs/TwistStamped.h>
#include "pid.h"
#include <iostream>
#include <fstream>

unsigned int speed     = 0;
unsigned int steel1    = 0;
unsigned int steel2    = 0;
unsigned int dangwei   = 0;
unsigned int mode      = 0;
unsigned int status    = 0;
unsigned int check_sum = 0;

unsigned int current_steel = 0;

void canMsgCallback(const canalystii_node_msg::can &can_msg){
    unsigned int msg_id = can_msg.id;
    if (msg_id == 388){
        // the frame we interested!!!
        speed     = can_msg.data[0];
        steel1    = can_msg.data[1];
        steel2    = can_msg.data[2];
        dangwei   = can_msg.data[3];
        mode      = can_msg.data[4];
        status    = can_msg.data[5];
        check_sum = can_msg.data[7];

        current_steel = steel1<<8 + steel1;

        ROS_WARN("the current speed is %d", speed);
        ROS_WARN("the current steel is %d", current_steel);
        char dangchars;
        if (mode == 2){
            dangchars = 'A';    
        }else{
            dangchars = 'M';
        }
        
        ROS_WARN("current mode is %c", dangchars);


    }
}

int main(int argc, char **argv){
    ros::init(argc, argv, "can_msg_receiver");

    ros::NodeHandle nh;

    VCI_CAN_OBJ can_obj;

    CANalystii_node can_node;
      //初始化参数，严格参数二次开发函数库说明书。
      VCI_INIT_CONFIG config;
      config.AccCode=0x80000008;
      config.AccMask=0xFFFFFFFF;
      config.Filter=1;//接收所有帧
      config.Timing0=0x00;/*波特率500 Kbps  0x03  0x1C*/
      config.Timing1=0x1C;
      config.Mode=0;//正常模式
      unsigned int can_idx = 0;
      if(VCI_InitCAN(VCI_USBCAN2,0,0,&config)!=1)
      {
        printf(">>Init CAN1 error\n");
        VCI_CloseDevice(VCI_USBCAN2,0);
      }

      if(VCI_StartCAN(VCI_USBCAN2,0,0)!=1)
      {
        printf(">>Start CAN1 error\n");
        VCI_CloseDevice(VCI_USBCAN2,0);

      }

      if(VCI_InitCAN(VCI_USBCAN2,0,1,&config)!=1)
      {
        printf(">>Init can2 error\n");
        VCI_CloseDevice(VCI_USBCAN2,0);

      }
      if(VCI_StartCAN(VCI_USBCAN2,0,1)!=1)
      {
        printf(">>Start can2 error\n");
        VCI_CloseDevice(VCI_USBCAN2,0);

      }
    unsigned int recv_len = 1;
    int current_speed;
    std::ofstream current_speed_log("/home/adam/current_speed_log.txt", std::ios::app);

    ros::Rate r(20.0);
    while(ros::ok()){
        if(can_node.receive_can_frame(can_idx,can_obj,recv_len,20))
        {
          canalystii_node_msg::can msg = CANalystii_node::can_obj2msg(can_obj);
          ROS_WARN("current speed: %d", msg.data[0]);
          current_speed = msg.data[0];

          current_speed_log << current_speed << std::endl;
          can_node.can_msg_pub_.publish(msg);
        }

        r.sleep();
        
    }
    current_speed_log.close();
    

    return 0;
}