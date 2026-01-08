#!/bin/bash
set -e

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build

source $dir/.bashrc
source $dir/ros2_ws/install/setup.bash

timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log &
sleep 2

ros2 service call /query example_interfaces/srv/Trigger

grep "now:" /tmp/mypkg.log

