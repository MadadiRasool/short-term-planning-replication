# For more information, please refer to https://aka.ms/vscode-docker-python
FROM  stp_base:v0


# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1


WORKDIR /app
LABEL version="1.0"
LABEL maintainer="rm <<madadi.rasool@yahoo.com>>"

# Create the environment:
# COPY env.yaml .
# RUN conda env create -f env.yaml

COPY . /app

# make entrypoint script executable
# RUN chmod u+x /app/entrypoint.sh

# Create the environment:
# RUN conda env create -f /app/env.yaml

# Make RUN commands use the new environment:
RUN echo "conda activate short-term-planning-replication" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]


VOLUME /data /app/data
VOLUME /fortran /app/fortran
VOLUME /figures-tables /app/figures-tables
# VOLUME . /app

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
# ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/bin/bash"]
# ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "short-term-planning-replication", "python", "run.py"]
