#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2025 Zinbekun
# SPDX-License-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from example_interfaces.srv import Trigger

class Listener(Node):
    def __init__(self):
        super().__init__('listener')
        self.client = self.create_client(Trigger, 'query')
        while not self.client.wait_for_service(timeout_sec=1.0):
            self.get_logger().info('待機中')

        req = Trigger.Request()
        future = self.client.call_async(req)
        rclpy.spin_until_future_complete(self, future)

        if future.result() is not None:
            self.get_logger().info(f"now:{future.result().message}")
        else:
            self.get_logger().error('呼び出し失敗')

def main():
    rclpy.init()
    node = Listener()
    node.destroy_node()
    rclpy.shutdown()

if __name__ == "__main__":
    main()

