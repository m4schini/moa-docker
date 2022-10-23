FROM python:3.7-buster

RUN apt update

RUN apt install build-essential -y

WORKDIR /moa

COPY . .

ENV MOA_CONFIG=DevelopmentConfig

RUN pip install -r requirements.txt

RUN python -m moa.models

RUN python -m moa.worker

ENTRYPOINT [ "python", "app.py" ]