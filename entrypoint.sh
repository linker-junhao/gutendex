#!/bin/sh

# Apply migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

# Start gunicorn with static file serving
# Use --static-map to serve static files directly
# This works without modifying Django settings
exec gunicorn --bind 0.0.0.0:8000 --workers 3 gutendex.wsgi:application --static-map /static=/app/staticfiles