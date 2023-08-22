FROM nvcr.io/nvidia/cuda:11.8.0-devel-ubuntu22.04 as python-base

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.10 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Copy Dependencies
COPY requirements.txt .

# Install Dependencies
RUN pip install -r requirements.txt

# Copy Application
COPY . .

# Run Application
EXPOSE 50051
CMD [ "python3", "src/main.py" ]