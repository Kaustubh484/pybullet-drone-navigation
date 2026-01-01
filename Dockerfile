
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    libgl1 \
    libglib2.0-0 \
    libxext6 \
    libxrender1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app


RUN pip install --no-cache-dir torch==2.5.1 \
    --index-url https://download.pytorch.org/whl/cu121


RUN pip install --no-cache-dir \
    "clearml==2.0.2" \
    "gymnasium==1.2.2" \
    "numpy==2.2.6" \
    "pybullet==3.2.7" \
    "scipy==1.15.3" \
    matplotlib \
    git+https://github.com/utiasDSL/gym-pybullet-drones.git

COPY . /app


CMD ["python3", "test_drone.py", \
     "--algo", "sac", \
     "--model_path", "phase3_sac_random_3/best_model", \
     "--episodes", "1", \
     "--max_steps", "10000"]