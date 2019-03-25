# ROS_Node

Using Python2: sudo update-alternatives --config python 
Using ROS: source /opt/ros/kinetic/setup.bash


How to install ROS KInetic in Unbuntu 16.04:
	http://wiki.ros.org/kinetic/Installation/Ubuntu


catkin_make:

	1. make folder: /home/lucian/catkin_ws/src
	
	2. in the folder catkin_ws: catkin_make
	
	3. source devel/setup.bash       the bin file will be in /catkin_ws/devel/lib/
	
	4. roslaunch 



The files:


1. launch文件： 使用launch file, 可以同时启动多个ros节点，包括ROS-master. 所以这样只要一个roslaunch,就可以启动　roscore和多个节点程序

		如何启动launch 文件，roslaunch package-name launch-file-name
		
		
2. cmake文件： CMakeLists.txt 文件,为 CMake build 文件。是 CMake 编译系统中软件包的输入。描述如何编译代码、安装到哪里

		一个完整的ROS下CMakeList.txt由下面内容组成:
		
		1. 所需CMake版本（cmake_minimum_required） 
		
		2. 软件包名称（project（）) 
		
		3. 查找构建所需的其他CMake / Catkin软件包（find_package（）） 
		
		4. 启用Python模块支持（catkin_python_setup（））
		
		5. 消息/服务/动作生成器（add_message_files（），add_service_files（），add_action_files（）） 
		
		6. 生成消息/服务/动作等自定义消息（generate_messages（）） 
		
		7. 指定包的构建信息输出（catkin_package（）） 
		
		8. 要建立的库/可执行文件（add_library（）/ add_executable（）/ target_link_libraries（）） 
		
		9. 测试（catkin_add_gtest（）） 
		
		10. 安装规则（install（））
		
		
3. package.xml文件： package.xml实际上是一个程序包的描述文件

		<package format="2">
		
  		<name>foo_core</name>#包名
		
 		<version>1.2.4</version>#版本号
		
  		<description>#描述消息
		
    		This package provides foo capability.
		
  		</description>
		
 		<maintainer email="ivana@willowgarage.com">Ivana Bildbotz</maintainer>
		
  		<license>BSD</license>
		
  		<url>http://ros.org/wiki/foo_core</url>#链接
	
  		<author>Ivana Bildbotz</author>#作者
	
  		<buildtool_depend>catkin</buildtool_depend>#构建工具依赖

  		<depend>roscpp</depend>#依赖的包
		
  		<depend>std_msgs</depend>

  		<build_depend>message_generation</build_depend>#构建时依赖的包

 		 <exec_depend>message_runtime</exec_depend>#运行是依赖的包
		 
 		 <exec_depend>rospy</exec_depend>

 		 <test_depend>python-mock</test_depend>#测试时依赖的包

  		<doc_depend>doxygen</doc_depend>#生成文档时依赖的包



4. msg文件： 






5. ROS文件结构：

	workspace_folder/        -- WORKSPACE
	
  	      src/                   -- SOURCE SPACE
	      
   		 CMakeLists.txt       -- 'Toplevel' CMake file, provided by catkin
		 
    		 package_1/
		 
	  		src/
			
	  		include/
			
      		     CMakeLists.txt     -- CMakeLists.txt file for package_1
		     
      		     package.xml        -- Package manifest for package_1
		     
    		 ...
		 
    		 package_n/
		 
	 		src/
			
	  		include/
			
      		     CMakeLists.txt     -- CMakeLists.txt file for package_n
		     
      		     package.xml        -- Package manifest for package_n
		
6. 如何创建一个ROS node: 

	$cd ~/catkin_ws/
	$catkin_create_pkg beginner_tutorials std_msgs rospy roscpp
	$cd  beginner_tutorials
	$mkdir src
	$cd src
	创建 talker.cpp / listenner.cpp两个源码文件

	目录下的CMakelists.txt尾部追加信息  
		include_directories(include ${catkin_INCLUDE_DIRS})  
		add_executable(talker src/talker.cpp)  
		target_link_libraries(talker ${catkin_LIBRARIES})  
		add_dependencies(talker rospubsub_demo_generate_messages_cpp)  
		add_executable(listener src/listener.cpp)  
		target_link_libraries(listener ${catkin_LIBRARIES})  
		add_dependencies(listener rospubsub_demo_generate_messages_cpp)  

	$source ~/catkin_ws/devel/setup.bash  
	$rosrun beginner_tutorials talker  
	$rosrun beginner_tutorials listenner  

	通过rqt_graph看节点状态
	$rosrun rqt_graph rqt_graph 

	使用roslanuch:
 	编写beginner_tutorials.launch 文件
		 <launch>
			<node pkg="beginner_tutorials" type="talker" name="talker" output="screen"/>
			<node pkg="beginner_tutorials" type="listener" name="listener" output="screen"/>
		</launch>


	roslaunch beginner_tutorials beginner_tutorials.launch 

