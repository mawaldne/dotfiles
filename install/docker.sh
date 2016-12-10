#! /bin/bash
echo 'Installing docker images'
docker pull postgres
docker pull redis

echo 'Starting docker services'
docker run -d --name postgres -p 5432:5432 --restart always postgres
docker run -d --name redis -p 6379:6379 --restart always redis
