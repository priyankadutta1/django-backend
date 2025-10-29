# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy dependencies
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Set environment variables
ENV PORT=8080
ENV PYTHONUNBUFFERED=True

# Expose port
EXPOSE 8080

# Run Django via Gunicorn
CMD gunicorn backend.wsgi:application --bind 0.0.0.0:$PORT
