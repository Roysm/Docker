@echo off
docker rmi ubuntu
docker build -t ubuntu .

EXIT 0