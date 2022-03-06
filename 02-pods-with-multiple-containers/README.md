# Purpose

This unit introduces the concept of pods. This is where Podman begins to
differ from Docker.

## About

For more information about Pods, run the following commands:

```bash
$ podman pod --help
```

When creating a pod and attaching it to a network, it is assigned a DNS name.
The name that it is assigned to is the pod name. For example, if you create
a pod with the name `my_pod` and attach it to a network `my_network`. Other
pods created on the same network can query `my_pod` over the network by name.

Annoyance: difficult to get status of containers within a pod.


## References

- [Podman: Managing pods and containers in a local container runtime](https://developers.redhat.com/blog/2019/01/15/podman-managing-containers-pods#podman_pods__what_you_need_to_know)
- [Containerd, Runc, CRI-O, and OCI](https://www.tutorialworks.com/difference-docker-containerd-runc-crio-oci/)