FROM ros:noetic

SHELL ["/bin/bash", "-c"]
##
### Install python dependencies
##RUN pip3 install matplotlib --upgrade && \
##    pip3 install roboflow opencv-python
##
### Install ROS dependencies
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list \
 && sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 \
 && apt-get update && apt-get install --no-install-recommends -y \
 && apt-get install apt-utils build-essential psmisc vim-gtk git swig sudo libcppunit-dev python3-catkin-tools python3-rosdep python3-pip python3-rospkg python3-future python3-osrf-pycommon -y \
 && rm -rf /var/lib/apt/lists/*

### Set the working directory in the container
WORKDIR /root/robogym_ws/src

### Install packages
RUN git clone https://github.com/jr-robotics/robo-gym-robot-servers.git \
 && git clone -b $ROS_DISTRO https://github.com/jr-robotics/mir_robot.git \
 && git clone -b $ROS_DISTRO https://github.com/jr-robotics/universal_robot.git \
 && git clone -b v0.7.1-dev https://github.com/jr-robotics/franka_ros_interface \
 && git clone https://github.com/jr-robotics/franka_panda_description \
 && git clone -b ${ROS_DISTRO}-devel https://github.com/jr-robotics/panda_simulator \
 && git clone https://github.com/orocos/orocos_kinematics_dynamics \
 && cd orocos_kinematics_dynamics \
 && git checkout b35c424e77ebc5b7e6f1c5e5c34f8a4666fbf5bc \
 && cd .. && git clone https://github.com/jr-robotics/robo-gym.git && cd robo-gym && pip install -e .

### Build the ROS workspace
WORKDIR /root/robogym_ws/
RUN apt-get update \
 && rosdep update \
 && rosdep install --from-paths src -i -y --rosdistro $ROS_DISTRO \
 && catkin init \
 && source /opt/ros/$ROS_DISTRO/setup.bash \
 && catkin build