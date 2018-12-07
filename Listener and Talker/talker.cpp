//http://wiki.ros.org/cn/ROS/Tutorials/WritingPublisherSubscriber%28c%2B%2B%29


#include "ros/ros.h"  //引用了 ROS 系统中大部分常用的头文件
#include "std_msgs/String.h" //这引用了 std_msgs/String 消息, 它存放在 std_msgs package 里，是由 String.msg 文件自动生成的头文件。需要关于消息的定义，可以参考 msg 页面。 

#include <sstream>

/**
 * This tutorial demonstrates simple sending of messages over the ROS system.
 */
int main(int argc, char **argv)
{
  /**
   * The ros::init() function needs to see argc and argv so that it can perform
   * any ROS arguments and name remapping that were provided at the command line. For programmatic
   * remappings you can use a different version of init() which takes remappings
   * directly, but for most command-line programs, passing argc and argv is the easiest
   * way to do it.  The third argument to init() is the name of the node.
   *
   * You must call one of the versions of ros::init() before using any other
   * part of the ROS system.
   */
  
  //初始化 ROS 。它允许 ROS 通过命令行进行名称重映射——然而这并不是现在讨论的重点。在这里，我们也可以指定节点的名称——运行过程中，节点的名称必须唯一。 
  ros::init(argc, argv, "talker");

  /**
   * NodeHandle is the main access point to communications with the ROS system.
   * The first NodeHandle constructed will fully initialize this node, and the last
   * NodeHandle destructed will close down the node.
   */
  
  //为这个进程的节点创建一个句柄。第一个创建的 NodeHandle 会为节点进行初始化，最后一个销毁的 NodeHandle 则会释放该节点所占用的所有资源。 
  ros::NodeHandle n;

  /**
   * The advertise() function is how you tell ROS that you want to
   * publish on a given topic name. This invokes a call to the ROS
   * master node, which keeps a registry of who is publishing and who
   * is subscribing. After this advertise() call is made, the master
   * node will notify anyone who is trying to subscribe to this topic name,
   * and they will in turn negotiate a peer-to-peer connection with this
   * node.  advertise() returns a Publisher object which allows you to
   * publish messages on that topic through a call to publish().  Once
   * all copies of the returned Publisher object are destroyed, the topic
   * will be automatically unadvertised.
   *
   * The second parameter to advertise() is the size of the message queue
   * used for publishing messages.  If messages are published more quickly
   * than we can send them, the number here specifies how many messages to
   * buffer up before throwing some away.
   */
  
  //告诉 master 我们将要在 chatter（话题名） 上发布 std_msgs/String 消息类型的消息。
  //这样 master 就会告诉所有订阅了 chatter 话题的节点，将要有数据发布。第二个参数是发布序列的大小。
    //如果我们发布的消息的频率太高，缓冲区中的消息在大于 1000 个的时候就会开始丢弃先前发布的消息。 
  //NodeHandle::advertise() 返回一个 ros::Publisher 对象,它有两个作用： 1) 它有一个 publish() 成员函数可以让你在topic上发布消息； 
  //2) 如果消息类型不对,它会拒绝发布。 
  ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter", 1000);
//ros::Rate 对象可以允许你指定自循环的频率。它会追踪记录自上一次调用 Rate::sleep() 后时间的流逝，并休眠直到一个频率周期的时间。
//这个例子中，我们让它以 10Hz 的频率运行
  ros::Rate loop_rate(10);

  /**
   * A count of how many messages we have sent. This is used to create
   * a unique string for each message.
   */
 // roscpp 会默认生成一个 SIGINT 句柄，它负责处理 Ctrl-C 键盘操作——使得 ros::ok() 返回 false。
//如果下列条件之一发生，ros::ok() 返回false：
  //  SIGINT 被触发 (Ctrl-C)
   //被另一同名节点踢出 ROS 网络
    //ros::shutdown() 被程序的另一部分调用
    //节点中的所有 ros::NodeHandles 都已经被销毁 
//一旦 ros::ok() 返回 false, 所有的 ROS 调用都会失效。 
  
  int count = 0;
  while (ros::ok())
  {
    /**
     * This is a message object. You stuff it with data, and then publish it.
     */
    std_msgs::String msg;

    std::stringstream ss;
    ss << "hello world " << count;
    msg.data = ss.str();
//在我们使用标准的String消息，它只有一个数据成员 "data"。当然，你也可以发布更复杂的消息类型。 
    ROS_INFO("%s", msg.data.c_str());//ROS_INFO 和其他类似的函数可以用来代替 printf/cout 等函数

    /**
     * The publish() function is how you send messages. The parameter
     * is the message object. The type of this object must agree with the type
     * given as a template parameter to the advertise<>() call, as was done
     * in the constructor above.
     */
    chatter_pub.publish(msg);//我们向所有订阅 chatter 话题的节点发送消息

    ros::spinOnce();

    loop_rate.sleep();
    ++count;
  }


  return 0;
}

