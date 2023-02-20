FROM python:3.12.0a5-slim-bullseye

WORKDIR /app

COPY . .

CMD [ "python3", "main.py"]