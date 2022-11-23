#!/bin/bash
sudo yum install httpd -y
sudo chkconfig httpd on
sudo systemctl start httpd