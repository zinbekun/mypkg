# mypkge
千葉工業大学 未来ロボティクス学科 2025年度 ロボットシステム学内で行った内容に、課題で作成したファイルを追加したものです。

[![Test](https://github.com/zinbekun/mypkge/actions/workflows/test.yml/badge.svg)](https://github.com/zinbekun/mypkge/actions/workflows/test.yml)

[README](https://github.com/zinbekun/mypkge/blob/main/README.md?plain=1#L2)は[akajaika](https://github.com/akajaika/robosys2024/blob/main/README.md?plain=1)（© 2024 Kai Nonaka）を参考に作られています。

## テスト済みの環境
・Ubuntu 24.04.5 LTS

・Python: 3.7～3.12

## mypkge 機能説明
本パッケージ mypkg には、
ROS 2 のサービス通信を用いた以下の 2 つのノードが含まれています。

・talker　ノード：サービスサーバー
・listenerノード：サービスクライアント

person_msgs/srv/Query サービスを用いて、
クライアントから送られた要求に対し、現在時刻を返します。


## talker.py ・listener.py 使い方
talker.pyを起動後、別の端末でlistener.pyを起動すると入力した瞬間の時間が表示されます。また、先にlistener.pyを起動すると別端末でtalkr.pyを起動するまで待機中と表示されます。


```shell
$ ros2 run mypkg listener
[INFO] [1766842493.607655669] [listener]: 待機中

$ ros2 run mypkg talker


$ ros2 run mypkg listener
[INFO] [1766842150.095770751] [listener]: now:2025-12-27 22:29:10
```

## ライセンス
このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
- © 2025 Itto Hase
