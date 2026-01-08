#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

# サービスサーバ起動
timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log &

# 起動待ち（超重要・最低限）
sleep 2

# サービス呼び出し（これが通信テスト）
ros2 service call /query person_msgs/srv/Query "time: now"

# ログ確認（正しい grep）
grep "now:" /tmp/mypkg.log

