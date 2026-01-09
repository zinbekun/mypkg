# mypkg
千葉工業大学 未来ロボティクス学科 2025年度 ロボットシステム学内で行った内容に、課題で作成したファイルを追加したものです。

[![Test](https://github.com/zinbekun/mypkg/actions/workflows/test.yml/badge.svg)](https://github.com/zinbekun/mypkg/actions/workflows/test.yml)

[README](https://github.com/zinbekun/mypkg/blob/main/README.md?plain=1#L2)は[akajaika](https://github.com/akajaika/mypkg/blob/main/README.md?plain=1)（© 2024 Kai Nonaka）を参考に作られています。


## mypkg 機能説明
本パッケージはROS2のサービス通信を用いて、現在時刻を返すだけのシンプルなサーバーノードを提供するパッケージです。

## テスト済みの環境
・Ubuntu22.04

・Python: 3.12


## ノード構成

### talker ノード（サービスサーバ）
**役割**  
クライアントからのサービス要求を受信し、現在時刻をレスポンスとして返します。

**提供するサービス**
- サービス名：`/query`
- サービス型：`person_msgs/srv/Query`

---

### listener ノード（サービスクライアント）
**役割**  
サービスサーバにリクエストを送信し、返ってきた応答を受信して表示します。

**使用するサービス**
- サービス名：`/query`
- サービス型：`person_msgs/srv/Query`

---

## サービス仕様

### query サービス
**概要**  
このサービスは、クライアントから送信されたリクエストを受け取り、  
ノード内部で処理を行った結果をレスポンスとして返すサービスです。

**サービス型**
- `person_msgs/srv/Query`


## talker ・listener 使い方
talker.pyを起動後、別の端末でlistener.pyを起動すると現在時刻が表示されます。また、launchファイル経由でも実行できます。

```shell
$ ros2 run mypkg talker


$ ros2 run mypkg listener
[INFO] [1767875435.780543814] [listener]: now:2026-01-08 21:30:35


$ ros2 launch mypkg talk_listen.launch.py
[INFO] [launch]: All log files can be found below /home/nbalu/.ros/log/2026-01-08-21-36-00-421674-itto-1900
[INFO] [launch]: Default logging verbosity is set to INFO
[INFO] [talker-1]: process started with pid [1903]
[INFO] [listener-2]: process started with pid [1904]
[listener-2] [INFO] [1767875761.409793603] [listener]: now:2026-01-08 21:36:01
[INFO] [listener-2]: process has finished cleanly [pid 1904]
```

## ライセンス
このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
- © 2025 Itto Hase
