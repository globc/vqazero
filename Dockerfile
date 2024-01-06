# set base image (host OS)
FROM nvidia/cuda:11.4.3-base-ubuntu20.04

RUN apt-get update -y \
    && apt-get install -y python3-pip

# set the working directory in the container
WORKDIR /app

COPY requirements.txt requirements1.txt

RUN pip install -r requirements1.txt

RUN python3 -m spacy download en_core_web_sm

RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu113

# copy the dependencies file to the working directory
COPY vqa_zero/requirements.txt .

# install dependencies
RUN pip install -r requirements.txt


# copy the content of the local directory to the working directory
COPY . .