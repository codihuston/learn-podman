# Purpose

This unit demos a single entrypoint to an application with multiple
replicas/instances. There will be a single `haproxy` pod that will
expose 3 pods on the backend.

## About

Observations:

1. Once the HA cluster is running, followed by stopping 1 backend
pod, restarting the pod (or containers) does restart nginx, but not
the express app
## References

- [The Four Essential Sections of an HAProxy Configuration](https://www.haproxy.com/blog/the-four-essential-sections-of-an-haproxy-configuration/)