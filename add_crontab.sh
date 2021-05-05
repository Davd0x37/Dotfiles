#!/bin/bash


{ crontab -l -u root; echo '*/5 * * * * echo 3 > /proc/sys/vm/drop_caches; touch /root/drop_caches_last_run'; } | crontab -u root -