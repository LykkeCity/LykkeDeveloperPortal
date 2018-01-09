server {
  listen 80 default_server;
  listen [::]:80 default_server;

  root /var/www/html;

  index index.html index.htm;

  server_name _;

  location ~ ^/api/isalive$ {
    return 200 '{"Version": "${APP_VERSION}", "Env": "${ENV_INFO}"}';
  };
  
  location / {
    # First attempt to serve request as file, then
    # as directory, then fall back to displaying a 404.
    try_files $uri $uri/ =404;
  }
}