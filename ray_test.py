import os
import ray

# Set the RAY_ADDRESS environment variable
os.environ["RAY_ADDRESS"] = "127.0.0.1:16379"

# Connect to the Ray cluster using the local forwarded port
ray.init(address='127.0.0.1:16379', _node_ip_address='127.0.0.1')

@ray.remote
def say_hello():
    return "Hello, world!"

# Run the remote function
result = ray.get(say_hello.remote())
print(result)

