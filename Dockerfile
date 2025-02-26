# Use official Python image
FROM python:3.9

# Set working directory
WORKDIR /app/backend

# Copy dependency file first to leverage Docker caching
COPY requirements.txt /app/backend/

# Update & install dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install dependencies
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy project files after installing dependencies
COPY . /app/backend/

# Expose port 8000 for Django server
EXPOSE 8000

# Default command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
