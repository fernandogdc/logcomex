# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.11.5-slim

LABEL image.name="demand_planning"

WORKDIR /app/logcomex

COPY notebooks /app/logcomex/notebooks
COPY notebooks /app/logcomex/data

ENV VAR1=10

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install & use pipenv
COPY Pipfile Pipfile.lock ./
RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get install -y build-essential python3-pip python3-dev
RUN python -m pip install --upgrade pip
RUN pip install pipenv && pipenv install --dev --system --deploy

WORKDIR /app
COPY . /app

# Creates a non-root user and adds permission to access the /app folder
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
