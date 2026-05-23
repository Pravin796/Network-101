# Network-101

curl -LO https://raw.githubusercontent.com/Pravin796/Network-101/refs/heads/main/pravin.sh
sudo chmod +x pravin.sh
./pravin.sh

gcloud compute instances create us-test-02 \
--subnet subnet-us-central1 \
--zone us-central1-a \
--machine-type e2-standard-2 \
--tags ssh,http,rules

gcloud compute instances create us-test-03 \
--subnet subnet-europe-west4 \
--zone europe-west4-a \
--machine-type e2-standard-2 \
--tags ssh,http,rules