#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2025 Zinbekun
# SPDX-License-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from datetime import datetime
from example_interfaces.srv import Trigger

class Talker(Node):
    def __init__(self):
        super().__init__('talker')
        self.create_service(Trigger, 'query', self.cb)

    def cb(self, request, response):
        response.success = True
        response.message = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        return response

def main():
    rclpy.init()
    node = Talker()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == "__main__":
    main()

