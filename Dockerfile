FROM        ec2-deploy:base

# Copy project files
COPY        .   /srv/project
WORKDIR     /srv/project

# Nginx
RUN         apt -y install nginx

# Copy project files
COPY        .   ${PROJECT_DIR}
ENV         PROJECT_DIR     /srv/project

# virtualenv path
RUN         export VENV_PATH=$(pipenv --venv); echo $VENV_PATH;
ENV         VENV_PATH       $VENV_PATH


# Run uWSGI (CMD)
#CMD         pipenv run uwsgi --ini $(PROJECT_DIR)/.config/uwsgi_http.ini

# Run Nginx
#CMD         nginx -g 'daemon off;'