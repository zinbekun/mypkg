#!/bin/bash
set -e

source /opt/ros/humble/setup.bash
cd ~/ros2_ws
colcon build
source install/setup.bash

timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log

grep "now:" /tmp/mypkg.log

