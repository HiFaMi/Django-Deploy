FROM        ec2-deploy:base

# Copy project files
COPY        .   /srv/project
WORKDIR     /srv/project

# Nginx, Supervisor install
RUN         apt -y install nginx supervisor

# Copy project files
COPY        .   ${PROJECT_DIR}
ENV         PROJECT_DIR     /srv/project

# virtualenv path
RUN         export VENV_PATH=$(pipenv --venv); echo $VENV_PATH;

RUN         cp -f   ${PROJECT_DIR}/.config/nginx.conf \
                    /etc/nginx/nginx.conf && \

            cp -f   ${PROJECT_DIR}/.config/nginx_app.conf \
                    /etc/nginx/sites-available/ && \

            rm -rf  /etc/nginx/sites-enabled/* && \


            ln -sf  /etc/nginx/sites-available/nginx_app.conf \
                    /etc/nginx/sites-enabled

RUN         cp -f   ${PROJECT_DIR}/.config/supervisor_app.conf \
                    /etc/supervisor/conf.d/

CMD         supervisord -n


# Run uWSGI (CMD)
#CMD         pipenv run uwsgi --ini $(PROJECT_DIR)/.config/uwsgi_http.ini

# Run Nginx
#CMD         nginx -g 'daemon off;'