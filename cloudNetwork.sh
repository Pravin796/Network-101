#!/bin/bash

read -p "ENTER VPC_NAME: " VPC_NAME
read -p "ENTER SUBNET_A: " SUBNET_A
read -p "ENTER SUBNET_B: " SUBNET_B
read -p "ENTER FIREWALL_1: " FIREWALL_1
read -p "ENTER FIREWALL_2: " FIREWALL_2
read -p "ENTER FIREWALL_3: " FIREWALL_3
read -p "ENTER ZONE_1: " ZONE_1
read -p "ENTER ZONE_2: " ZONE_2

export REGION_1=${ZONE_1%-*}
export REGION_2=${ZONE_2%-*}

export VM_1=us-test-01
export VM_2=us-test-02

gcloud compute networks create $VPC_NAME \
--subnet-mode=custom \
--bgp-routing-mode=regional

gcloud compute networks subnets create $SUBNET_A \
--region=$REGION_1 \
--network=$VPC_NAME \
--range=10.10.10.0/24

gcloud compute networks subnets create $SUBNET_B \
--region=$REGION_2 \
--network=$VPC_NAME \
--range=10.10.20.0/24

gcloud compute firewall-rules create $FIREWALL_1 \
--network=$VPC_NAME \
--allow=tcp:22

gcloud compute firewall-rules create $FIREWALL_2 \
--network=$VPC_NAME \
--allow=tcp:3389

gcloud compute firewall-rules create $FIREWALL_3 \
--network=$VPC_NAME \
--allow=icmp

gcloud compute instances create $VM_1 \
--zone=$ZONE_1 \
--subnet=$SUBNET_A \
--machine-type=e2-standard-2

gcloud compute instances create $VM_2 \
--zone=$ZONE_2 \
--subnet=$SUBNET_B \
--machine-type=e2-standard-2