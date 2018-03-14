FROM python:3.7.0b2-slim
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . /app
WORKDIR /app/web
#CMD FLASK_APP=app.py flask run --host=0.0.0.0
