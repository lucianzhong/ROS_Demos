#include <ros/ros.h>
#include <geometry_msgs/TwistStamped.h>
#include <std_msgs/Float32.h>
#include <math.h>
#include <coms.h>

/*To convert ros twist message's anglular velocity (rad/s) to desired steering angle in degree*/
/*To convert ros twist message's linear velocity (m/s) to desird car velocity in m/s*/

class twist_converter {

public:
  twist_converter(ros::NodeHandle& nh, ros::NodeHandle& nhPrivate);
  virtual ~twist_converter();

  void twist_callback(const geometry_msgs::TwistStamped::ConstPtr& twist_msg);

  double convert_trans_rot_vel_to_wheel_angle(double linear_v, double angular_v, double wheelbase);

  virtual void spin();
  virtual void spinonce();
  void process();

protected:
  ros::NodeHandle nh_;
  ros::NodeHandle nhPrivate_;

  //parameters
  std::string twist_topic_;
  std::string desired_steerangle_topic_;
  std::string desired_velocity_topic_;

  //published topics
  std_msgs::Float32 desired_steerangle_;  // degree
  std_msgs::Float32 desired_velocity_;    // m/s

  //subscriber
  ros::Subscriber twist_subscriber;
  //publisher
  ros::Publisher desired_steerangle_publisher;
  ros::Publisher desired_velocity_publisher;

  //car paramters
  double wheelbase;
  double track;
  double steerratio;
  double maxsteerangle;
  double minsteerangle;
  double maxvelocity;
  double minvelocity;
};

twist_converter::twist_converter(ros::NodeHandle &nh, ros::NodeHandle &nhPrivate){
    nh.param("twist_topic_", twist_topic_, std::string("twist_cmd"));  // in topic name
    nh.param("desired_steerangle_topic_", desired_steerangle_topic_, std::string("desired_steerangle_cmd")); // out topic name
    nh.param("desired_velocity_topic_", desired_velocity_topic_, std::string("desired_velocity_cmd"));  // out topic name

    twist_subscriber = nh.subscribe<geometry_msgs::TwistStamped>(twist_topic_, 1, boost::bind(&twist_converter::twist_callback, this,_1));

    desired_steerangle_publisher = nh.advertise<std_msgs::Float32>(desired_steerangle_topic_, 100);
    desired_velocity_publisher = nh.advertise<std_msgs::Float32>(desired_velocity_topic_, 100);

    // initalize car constant
    wheelbase = WHEEL_BASE;  // meter
    track = WHEEL_TRACK;      // meter
    steerratio = WHEEL_TO_STEERING;   // unitless
    maxsteerangle = STEERING_ANGLE_LIMIT/WHEEL_TO_STEERING;  // degree, CW for +
    minsteerangle = -STEERING_ANGLE_LIMIT/WHEEL_TO_STEERING; // degree, CCW for -
    maxvelocity = SPEED_LIMIT;  // m/s, IMPORTANT: this is safty limit
    minvelocity = 0.0;   // m/s
}

twist_converter::~twist_converter(){
    twist_subscriber.shutdown();
}

void twist_converter::spin(){
    ros::Rate rate (30);
    while (ros::ok())
    {
      spinonce();
      rate.sleep ();
    }
}

void twist_converter::spinonce(){
    process();
    ros::spinOnce();
}

void twist_converter::process(){

}

void twist_converter::twist_callback(const geometry_msgs::TwistStamped::ConstPtr& twist_msg){
    double carbody_steer_angle = convert_trans_rot_vel_to_wheel_angle(twist_msg->twist.linear.x, twist_msg->twist.angular.z, wheelbase);
    desired_steerangle_.data = carbody_steer_angle * steerratio;
    desired_velocity_.data = std::min(std::max(twist_msg->twist.linear.x, minvelocity), maxvelocity);

    desired_steerangle_publisher.publish(desired_steerangle_);
    desired_velocity_publisher.publish(desired_velocity_);
}

double twist_converter::convert_trans_rot_vel_to_wheel_angle(double linear_v, double angular_v, double wheelbase){
    if(angular_v == 0 || linear_v == 0)
        return 0;
    double temp = angular_v / linear_v * wheelbase;
    return std::min(std::max(-atan(temp) / PI * 180, minsteerangle), maxsteerangle); //
}


int main(int argc, char **argv) {
  ros::init(argc, argv, "twist_converter_node");
  ros::NodeHandle nh;
  ros::NodeHandle nhPrivate ("~");

  twist_converter* tc = 0;
  tc = new twist_converter(nh, nhPrivate);

  tc->spin();

  return 0;
}
