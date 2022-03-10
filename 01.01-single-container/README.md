# Purpose

This unit demonstrates the use of Podman with a single container.

```bash
$ podman run -dt -p 8085:80 docker.io/library/nginx
$ curl localhost:8085
# --- snip ---#
<h1>Welcome to nginx!</h1>
# --- snip ---#
```
