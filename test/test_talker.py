import rclpy
from rclpy.node import Node
import pytest
from person_msgs.srv import Query

@pytest.fixture(scope="module")
def rclpy_context():
    rclpy.init()
    yield
    rclpy.shutdown()

def test_talker_now_service(rclpy_context):
    node = Node("test_client")

    client = node.create_client(Query, "query")

    assert client.wait_for_service(timeout_sec=5.0)

    req = Query.Request()
    req.now = "now"

    future = client.call_async(req)
    rclpy.spin_until_future_complete(node, future, timeout_sec=5.0)

    response = future.result()

    assert response is not None
    assert response.now != "unknown"

    node.destroy_node()

