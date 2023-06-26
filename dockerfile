from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

# syntax=docker/dockerfile:1
FROM ubuntu:22.04

# install app dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask==2.1.*

# install app
COPY hello.py /

# final configuration
ENV FLASK_APP=hello
EXPOSE 8000
CMD flask run --host 0.0.0.0 --port 8000
docker build -t test:latest
docker run -p 8000:8000 test:latest
