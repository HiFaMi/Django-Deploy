from .base import *


db_data = json.loads(open(os.path.join(SECRET_DIR, 'dev.json')).read())

DEBUG = True


# Static
STATIC_ROOT = os.path.join(ROOT_DIR, '.static')
MEDIA_ROOT = os.path.join(ROOT_DIR, '.media')
STATIC_URL = '/static/'
MEDIA_URL = '/media/'

# WSGI
WSGI_APPLICATION = 'config.wsgi.dev.application'

# DB

DATABASES = db_data['DATABASES']
print(DATABASES)