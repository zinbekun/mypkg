#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 Zinbekun
# SPDX-License-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from person_msgs.srv import Query


def main():
    rclpy.init()

    node = Node("listener")

    client = node.create_client(Query, "query")
    while not client.wait_for_service(timeout_sec=1.0):
        node.get_logger().info("待機中")

    req = Query.Request()
    req.time = "now"

    future = client.call_async(req)

    # ここが重要：確実に完了まで待つ
    rclpy.spin_until_future_complete(node, future)

    if future.result() is not None:
        response = future.result()
        node.get_logger().info(f"now:{response.now}")
    else:
        node.get_logger().error("サービス呼び出し失敗")

    node.destroy_node()
    rclpy.shutdown()


if __name__ == "__main__":
    main()

