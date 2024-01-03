FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    python3-pip \
    git \
    wget

WORKDIR /app

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh 

RUN bash Miniconda3-latest-Linux-x86_64.sh -b

ENV PATH /root/miniconda3/bin:$PATH

RUN conda create -n motion_gpt python=3.9

# Make RUN commands use the new environment:
SHELL ["conda", "run", "--no-capture-output", "-n", "motion_gpt", "/bin/bash", "-c"]

RUN git clone https://github.com/OpenMotionLab/MotionGPT.git

WORKDIR /app/MotionGPT

RUN pip install -e .

RUN pip install -r requirements.txt

ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "motion_gpt", "python", "app.py"]
