# For more information, please refer to https://aka.ms/vscode-docker-python
FROM continuumio/miniconda3

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
# COPY requirements.txt .
# RUN python -m pip install -r requirements.txt

WORKDIR /app
LABEL version="1.0"
LABEL maintainer="rm <<madadi.rasool@yahoo.com>>"

# Create the environment:
# COPY env.yaml .
# RUN conda env create -f env.yaml

COPY . /app

# Create the environment:
RUN conda env create -f /app/env.yaml

# Activate Conda environment
ENV PATH /opt/conda/envs/short-term-planning-replication/bin:$PATH
RUN /bin/bash -c "source activate short-term-planning-replication"


# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["/app/entrypoint.sh"]
# ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "short-term-planning-replication", "python", "run.py"]
