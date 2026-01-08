#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2025 Zinbekun
# SPDX-License-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from datetime import datetime
from person_msgs.srv import Query


class Talker(Node):
    def __init__(self):
        super().__init__("talker")
        self.srv = self.create_service(Query, "query", self.cb)

    def cb(self, request, response):
        if request.time == "now":
            response.now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        else:
            response.now = "unknown"
        return response


def main():
    rclpy.init()
    node = Talker()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()


if __name__ == "__main__":
    main()

