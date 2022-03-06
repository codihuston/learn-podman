#!/bin/bash

# create a network
network=test-net
podman network create "$network"

# create a pod, you must map all ports that will be exposed at creation time!
hostname_test_1="test_1"
hostname_test_2="test_2"

pod_test_1=$(podman pod create --name "$hostname_test_1" --network "$network" -p 127.0.0.1:8081:80)
pod_test_2=$(podman pod create --name "$hostname_test_2" --network "$network" -p 127.0.0.1:8082:80)

# list pod
podman pod ls

# add to the pod
test_1_nginx=$(podman run -dt --pod "$pod_test_1" docker.io/library/nginx)
test_2_nginx=$(podman run -dt --pod "$pod_test_2" docker.io/library/nginx)

# list pod, note all containers are displayed
podman pod ls

# or list containers and their pods
podman ps -a --pod

# list running processes in a pod's containers
podman pod top "$pod_test_1"

# log a pod
podman pod logs "$pod_test_1"

# list the pod spec
podman pod inspect "$pod_test_1"

# verify that nginx container in pod 1 can curl nginx container in pod 2
echo "A: $test_1_nginx, B: $pod_test_2"
echo "A: $test_2_nginx, B: $pod_test_1"
podman exec -it "$test_1_nginx" curl "$hostname_test_1"
podman exec -it "$test_2_nginx" curl "$hostname_test_2"

podman pod stop "$pod_test_1" && podman pod rm "$pod_test_1"
podman pod stop "$pod_test_2" && podman pod rm "$pod_test_2"
podman pod ps