FROM node
ADD . /tmp

#use /tmp for the gulp build
WORKDIR /tmp
RUN apt-get update
RUN apt-get install -y nginx
RUN npm install -g gulp
RUN npm link gulp
RUN npm install

#node-sass complains about the node version - rebuild solves this, although not ideal
RUN npm rebuild node-sass
RUN gulp build

#delete the partials post-gulp
RUN rm -r public/partials
RUN cp -r public/* /var/www/html

#setup the isAlive endpoint
RUN apt-get install -y gettext
RUN envsubst < isAlive.conf.tpl > /etc/nginx/sites-available/default

# nginx setup
# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

CMD ./start.sh