#!/bin/bash
set -x

dir=~
[ "$1" != "" ] && dir="$1"

# ワークスペースへ移動
cd $dir/ros2_ws

# ビルド
colcon build

# 環境設定
source $dir/.bashrc
source $dir/ros2_ws/install/setup.bash

echo "===== ROS ENV CHECK ====="
which ros2
ros2 --version
echo "========================="

# サービスサーバ起動（バックグラウンド）
timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log &

# 起動待ち（最低限）
sleep 2

echo "===== SERVICE LIST ====="
ros2 service list
echo "========================"

echo "===== SERVICE TYPE CHECK ====="
ros2 service type /query || echo "SERVICE TYPE NOT RESOLVED"
echo "=============================="

# サービス呼び出し（通信テスト本体）
# ※ ここは「ros2 service type /query」で出た型に合わせる
ros2 service call /query person_msgs/srv/Query "time: now"

# ログ確認（成功判定）
echo "===== LOG OUTPUT ====="
cat /tmp/mypkg.log
echo "======================"

grep "now:" /tmp/mypkg.log

