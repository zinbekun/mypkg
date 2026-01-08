#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

# ワークスペースへ
cd $dir/ros2_ws

# ビルド
colcon build

# 環境設定（超重要）
source $dir/.bashrc
source $dir/ros2_ws/install/setup.bash

# サービスサーバ起動（バックグラウンド）
timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log &

# 起動待ち（最低限）
sleep 2

# サービス存在・型確認（デバッグ用・CIでも可）
ros2 service list
ros2 service type /query

# サービス呼び出し（通信テスト本体）
ros2 service call /query person_msgs/srv/Query "time: now"

# ログ確認（成功判定）
grep "now:" /tmp/mypkg.log

