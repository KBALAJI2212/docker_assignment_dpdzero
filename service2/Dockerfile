FROM ghcr.io/astral-sh/uv:0.7.14-python3.10-alpine

WORKDIR /app

RUN pip install flask

COPY ./app.py ./service2.py

CMD ["uv","run","./service2.py"]