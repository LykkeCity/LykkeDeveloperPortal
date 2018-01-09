#!/bin/bash

envsubst < isAlive.conf.tpl > /etc/nginx/sites-available/default
service nginx start