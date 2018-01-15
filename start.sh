#!/bin/bash

envsubst '${APP_VERSION},${ENV_INFO}' < isAlive.conf.tpl > /etc/nginx/sites-available/default
service nginx start