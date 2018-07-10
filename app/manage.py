#!/usr/bin/env python
import os
import sys

if __name__ == "__main__":
    # 만약에 DJANGO_SETTINGS_MODULE의 값이 존재할 경우 그 값이 default, 없을 경우 config.settings 가 기본값
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings")
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)
