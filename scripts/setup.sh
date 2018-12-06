#!/bin/bash
set -eu

echo -e "\n==========> start kaltura setup\n"
docker-compose exec kaltura sh -c 'composer install'
docker-compose exec kaltura sh -c '/opt/kaltura/bin/kaltura-config-all.sh /tmp/local.ans'
echo -e "\n==========> kaltura setup finish.\n"

echo -e "\n==========> start VRTour setup\n"
docker-compose exec vrtour sh -c 'composer install'
echo -e "\n==========> VRTour setup finish.\n"

echo -e "\n==========> start iam setup\n"
docker-compose exec iam sh -c 'composer install'
docker-compose exec iam sh -c 'cd /var/www/html/ex2-iam; php artisan passport:install'
echo -e "\n==========> iam setup finish.\n"
