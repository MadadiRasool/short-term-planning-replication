# For more information, please refer to https://aka.ms/vscode-docker-python
FROM continuumio/miniconda3

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install  necessary tools
RUN apt-get --allow-releaseinfo-change update && apt-get install -y \
    make \
    gcc \
    mpich \ 
    git \
    && rm -rf /var/lib/apt/lists/*



RUN conda update conda
RUN conda install conda-build

  

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

# make entrypoint script executable
# RUN chmod u+x /app/entrypoint.sh

# Create the environment:
RUN conda env create -f /app/env.yaml

# https://stackoverflow.com/questions/37945759/condas-source-activate-virtualenv-does-not-work-within-dockerfile
# Activate Conda environment
ENV PATH /opt/conda/envs/short-term-planning-replication/bin:$PATH
RUN /bin/bash -c "source activate short-term-planning-replication"


# RUN mkdir -p /usr/src/other_packages
# RUN git clone https://github.com/eph/fortress.git /usr/src/other_packages/fortress
# RUN conda build /usr/src/other_packages/fortress/conda
# RUN conda develop /usr/src/other_packages/fortress
# RUN pip install -e /usr/src/other_packages/fortress
# RUN echo "Make sure fortress is installed:"
# RUN python -c "import fortress"


# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

VOLUME /data /app/data
VOLUME ./fortran /app/fortran
# VOLUME . /app

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["bash"]
# ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "short-term-planning-replication", "python", "run.py"]
