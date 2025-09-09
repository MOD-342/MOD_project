
FROM python:3.11.13-slim
ENV DEBIAN_FRONTEND=noninteractive

ENV PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PYTHONUNBUFFERED=1
WORKDIR /app
RUN apt-get update && apt-get install -y \
    sqlite3 \
    libsqlite3-dev \
    build-essential \
    gcc \
    libsndfile1-dev \
    && rm -rf /var/lib/apt/lists/*
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN mkdir -p /app/user_data
EXPOSE 8000
CMD ["python", "-c", "print('MOD Docker Container Running Successfully')"]

