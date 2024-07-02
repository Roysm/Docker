@echo off
docker rmi mykali
docker build -t mykali .

EXIT 0