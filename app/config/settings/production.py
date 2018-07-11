from .base import *


secrets = json.loads(open(os.path.join(SECRET_DIR, 'production.json')).read())

DEBUG = False

# Django-storages
INSTALLED_APPS += [
    'storages',
]

ALLOWED_HOSTS = [
    'localhost'
]

DEFAULT_FILE_STORAGE = 'config.storages.S3DefaultStorage'
STATICFILES_STORAGE = 'config.storages.S3StaticStorage'

AWS_ACCESS_KEY_ID = secrets['AWS_ACCESS_KEY_ID']
AWS_SECRET_ACCESS_KEY = secrets['AWS_SECRET_ACCESS_KEY']
AWS_STORAGE_BUCKET_NAME = secrets['AWS_STORAGE_BUCKET_NAME']
AWS_DEFAULT_ACL = secrets['AWS_DEFAULT_ACL']
AWS_S3_REGION_NAME = secrets['AWS_S3_REGION_NAME']
AWS_S3_SIGNATURE_VERSION = secrets['AWS_S3_SIGNATURE_VERSION']

# Static
STATIC_ROOT = os.path.join(ROOT_DIR, '.static')
MEDIA_ROOT = os.path.join(ROOT_DIR, '.media')
STATIC_URL = '/static/'
MEDIA_URL = '/media/'

# WSGI
WSGI_APPLICATION = 'config.wsgi.production.application'

# DB
DATABASES = secrets['DATABASES']
