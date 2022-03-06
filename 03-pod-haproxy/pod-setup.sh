#!/bin/bash

# create a network
network=test-net
podman network create "$network"

# create a pod, you must map all ports that will be exposed at creation time!

hostname_loadbalancer="loadbalancer"
hostname_test_1="test_1"
hostname_test_2="test_2"
hostname_test_3="test_3"

pod_loadbalancer=$(podman pod create --name "$hostname_loadbalancer" --network "$network" -p 127.0.0.1:8080:80)
pod_test_1=$(podman pod create --name "$hostname_test_1" --network "$network")
pod_test_2=$(podman pod create --name "$hostname_test_2" --network "$network")
pod_test_3=$(podman pod create --name "$hostname_test_3" --network "$network")

# list pod
podman pod ls

# add to the pods
test_1_nginx=$(podman run -d --pod "$pod_test_1" --name "${hostname_test_1}_nginx" -v $(pwd)/nginx/nginx.conf:/etc/nginx/nginx.conf:ro docker.io/library/nginx)
test_2_nginx=$(podman run -d --pod "$pod_test_2" --name "${hostname_test_2}_nginx" -v $(pwd)/nginx/nginx.conf:/etc/nginx/nginx.conf:ro docker.io/library/nginx)
test_3_nginx=$(podman run -d --pod "$pod_test_3" --name "${hostname_test_3}_nginx" -v $(pwd)/nginx/nginx.conf:/etc/nginx/nginx.conf:ro docker.io/library/nginx)

test_1_app=$(podman run -d --pod "$pod_test_1" --name "${hostname_test_1}_app" -e APP_HOSTNAME="$hostname_test_1" express-app)
test_2_app=$(podman run -d --pod "$pod_test_2" --name "${hostname_test_2}_app" -e APP_HOSTNAME="$hostname_test_2" express-app)
test_3_app=$(podman run -d --pod "$pod_test_3" --name "${hostname_test_3}_app" -e APP_HOSTNAME="$hostname_test_3" express-app)

container_loadbalancer=$(podman run -d --pod "$pod_loadbalancer" --name "${hostname_loadbalancer}_haproxy" -v $(pwd)/haproxy:/usr/local/etc/haproxy:ro haproxy:2.3)

# demo stopping pods
podman pod pause "${hostname_test_1}_app"

# demo restarting pods

# # verify that nginx container in pod 1 can curl nginx container in pod 2
# echo "A: $test_1_nginx, B: $pod_test_2"
# echo "A: $test_2_nginx, B: $pod_test_1"
# podman exec -it "$test_1_nginx" curl "$hostname_test_1"
# podman exec -it "$test_2_nginx" curl "$hostname_test_2"

# podman pod stop "$pod_test_1" && podman pod rm "$pod_test_1"
# podman pod stop "$pod_test_2" && podman pod rm "$pod_test_2"
# podman pod ps