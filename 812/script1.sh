#!/bin/bash
docker run -d --name centos7 centos:7 sleep 80000000
docker run -d --name ubuntu ubuntu sleep 80000000
docker run -d --name fedora pycontribs/fedora sleep 80000000
docker exec ubuntu apt update
docker exec ubuntu apt install python -y
ansible-playbook site.yml -i inventory/prod.yml --ask-vault-pass
sleep 10
docker stop centos7 ubuntu fedora
sleep 10
docker rm centos7 ubuntu fedora
