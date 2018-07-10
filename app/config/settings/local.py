from .base import *


DEBUG = True

ALLOWED_HOSTS = [
    'localhost',
    '127.0.0.1',
    '.amazonaws.com',
]

# Static
STATIC_ROOT = os.path.join(ROOT_DIR, '.static')
MEDIA_ROOT = os.path.join(ROOT_DIR, '.media')
STATIC_URL = '/static/'
MEDIA_URL = '/media/'

# WSGI
WSGI_APPLICATION = 'config.wsgi.local.application'

# DB
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}


