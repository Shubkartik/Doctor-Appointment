@echo off
echo ========================================
echo MediBook - Setup Script
echo ========================================
echo.

echo [1/6] Creating virtual environment...
python -m venv venv

echo [2/6] Activating virtual environment...
call venv\Scripts\activate

echo [3/6] Installing requirements...
pip install -r requirements.txt

echo [4/6] Running migrations...
python manage.py makemigrations
python manage.py migrate

echo [5/6] Creating superuser...
echo Please enter admin credentials:
python manage.py createsuperuser

echo [6/6] Creating media folders...
mkdir media
mkdir media\profile_images

echo.
echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo Run the server with(WebSocket support chat features):
echo   daphne -b 127.0.0.1 -p 8000 doctor_appointment.asgi:application
echo.
echo Or for HTTP only:
echo   python manage.py runserver
echo.
pause