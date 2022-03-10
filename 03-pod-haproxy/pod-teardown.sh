#!/bin/bash

hostname_loadbalancer="loadbalancer"
hostname_test_1="test_1"
hostname_test_2="test_2"
hostname_test_3="test_3"

podman pod stop "$hostname_loadbalancer" && \
  podman pod rm "$hostname_loadbalancer" &&  

podman pod stop "$hostname_test_1" && \
  podman pod rm "$hostname_test_1" &&  
podman pod stop "$hostname_test_2" && \
  podman pod rm "$hostname_test_2" &&  
podman pod stop "$hostname_test_3" && \
  podman pod rm "$hostname_test_3"
