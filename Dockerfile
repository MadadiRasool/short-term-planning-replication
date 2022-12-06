FROM continuumio/miniconda3

WORKDIR /app
LABEL version="1.0"
LABEL maintainer="rm <<madadi.rasool@yahoo.com>>"

# Create the environment:
COPY env.yaml .
RUN conda env create -f env.yaml

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "short-term-planning-replication", "/bin/bash", "-c"]

# Demonstrate the environment is activated:
RUN echo "Make sure numpy is installed:"
RUN python -c "import numpy"

# The code to run when container is started:
COPY run.py .
COPY scripts/03-estimate-baseline-models.py .
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "short-term-planning-replication", "python", "run.py"]

# The code to run when container is started:
# COPY entrypoint.sh .
# ENTRYPOINT ["bash", "entrypoint.sh"]

