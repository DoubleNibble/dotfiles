#!/bin/bash

sudo groupadd docker
sudo gpasswd -a ${USERNAME} docker
sudo service docker restart
